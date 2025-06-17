{ pkgs, lib, colors, ... }: {
  home.packages = with pkgs; [ wl-clipboard ];
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    package = pkgs.sway-unwrapped.override {
      enableXWayland = false;
      trayEnabled = false;
    };
    config = {
      window = {
        titlebar = false;
        border = 0;
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          xkb_options = "ctrl:nocaps";
          repeat_delay = "200";
          repeat_rate = "30";
        };
        "type:touchpad" = {
          tap = "disabled";
          natural_scroll = "enabled";
          accel_profile = "adaptive";
          scroll_factor = "0.45";
          pointer_accel = "0.47";
        };
      };
      bars = lib.mkForce [ ];
      defaultWorkspace = "workspace 1";
      keybindings = let
        mod = "Mod4";
        concatAttrs = lib.fold (x: y: x // y) { };
        tagBinds = concatAttrs (map (i: {
          "${mod}+${toString i}" = "exec 'swaymsg workspace ${toString i}'";
          "${mod}+Shift+${toString i}" =
            "exec 'swaymsg move container to workspace ${toString i}'";
        }) (lib.range 0 9));
      in tagBinds // {
        "${mod}+Return" = "exec ${
            lib.getExe pkgs.neovide
          } -- --listen /tmp/nvim-$(date +%Y%m%d%H%M%S).pipe +term";
        "${mod}+d" = "exec ${lib.getExe pkgs.luakit}";
        "${mod}+n" = "exec ${pkgs.notifystatus}/bin/notifystatus";

        "XF86AudioMute" = "exec ${pkgs.volume}/bin/volume sset Master toggle";
        "XF86AudioRaiseVolume" =
          "exec ${pkgs.volume}/bin/volume sset Master 5%+";
        "XF86AudioLowerVolume" =
          "exec ${pkgs.volume}/bin/volume sset Master 5%-";

        "${mod}+XF86AudioRaiseVolume" =
          "exec ${pkgs.volume}/bin/volume sset Master 1%+";
        "${mod}+XF86AudioLowerVolume" =
          "exec ${pkgs.volume}/bin/volume sset Master 1%-";

        "XF86AudioNext" = "exec ${lib.getExe pkgs.playerctl} next";
        "XF86AudioPrev" = "exec ${lib.getExe pkgs.playerctl} previous";
        "XF86AudioPlay" = "exec ${lib.getExe pkgs.playerctl} play-pause";

        "XF86MonBrightnessDown" =
          "exec ${pkgs.brightness}/bin/brightness set 5%-";
        "XF86MonBrightnessUp" =
          "exec ${pkgs.brightness}/bin/brightness set 5%+";

        "${mod}+XF86MonBrightnessDown" =
          "exec ${pkgs.brightness}/bin/brightness set 1%-";
        "${mod}+XF86MonBrightnessUp" =
          "exec ${pkgs.brightness}/bin/brightness set 1%+";

        "${mod}+q" = "kill";
        "${mod}+r" = ''mode "resize"'';
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+space" = "floating toggle";
        "${mod}+Shift+space" = "focus mode_toggle";
        "${mod}+Shift+q" = "exit";
      };
      colors = let
        style = {
          background = "#${colors.base}";
          indicator = "#${colors.text}";
          border = "#${colors.base}";
          text = "#${colors.text}";
          childBorder = "#${colors.base}";
        };
      in {
        focused = style;
        focusedInactive = style;
        unfocused = style;
        urgent = style;
      };
      seat."*".hide_cursor = "when-typing enable";
      output = {
        "*".bg = "#${colors.mantle} solid_color";
        "eDP-1".scale = "1";
      };
    };
    extraConfig = ''
      bindgesture swipe:3:right workspace prev
      bindgesture swipe:3:left workspace next
    '';
  };
}
