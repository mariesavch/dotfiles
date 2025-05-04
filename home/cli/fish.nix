{ colors, pkgs, inputs, lib, ... }: {
  home.packages =
    [ pkgs.fishPlugins.autopair inputs.grc-rs.packages.${pkgs.system}.default ];
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format =
        "$directory$git_branch$git_commit$git_state$git_status$nix_shell$cmd_duration$line_break$character";
      nix_shell = {
        format = "via [ nix]($style) ";
        heuristic = true;
      };
      directory = {
        style = "cyan bold italic";
        read_only = " ";
      };
      character = {
        vimcmd_symbol = "[❯](bold blue)";
        vimcmd_visual_symbol = "[❯](bold purple)";
        vimcmd_replace_symbol = "[❯](bold yellow)";
        vimcmd_replace_one_symbol = "[❯](bold yellow)";
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch(:$remote_branch)]($style) ";
      };
    };
  };
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "${lib.getExe pkgs.eza} --icons -l -s type -a --git";
      ls = "${lib.getExe pkgs.eza} --icons -s type -a --git";
      tree = "${
          lib.getExe pkgs.eza
        } --icons -s type -a --git -T -I '.git|node_modules|.next'";
      top = "${lib.getExe pkgs.htop}";
      img = "${lib.getExe pkgs.timg}";
      cp = "${lib.getExe pkgs.xcp} -r";
      rm = "${lib.getExe pkgs.rip2}";
      du = "grc-rs du -h";
      df = "grc-rs df -h";
      iw = "iwctl station wlan0";
      find = "fd";
      grep = "rg";
      copy = "wl-copy";
      ":q" = "exit";
      ":h" = "man";
      mkdir = "mkdir -p";
      nr = "sudo nixos-rebuild switch --flake ~/.dotfiles#kitaro";
      pm = "${lib.getExe pkgs.pulsemixer}";
      bt = "${lib.getExe pkgs.bluetuith}";
      ipinfo = "curl -s ipinfo.io | xq";
      c = "clear";
      g = "git";
    };
    shellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec sway
      fish_config theme choose theme

      set fish_greeting
      set -gx EDITOR (which nvim)
      set -gx VISUAL $EDITOR
      set -gx SUDO_EDITOR $EDITOR
      set -gx MANPAGER "nvim +Man!"
      set -gx LD_LIBRARY_PATH "${
        lib.makeLibraryPath [
          pkgs.pkg-config
          pkgs.udev
          pkgs.alsa-lib-with-plugins
          pkgs.vulkan-loader
          pkgs.libxkbcommon
          pkgs.wayland
          pkgs.openssl
        ]
      }"

      ${lib.getExe pkgs.nix-your-shell} fish | source
      grc-rs --aliases --except=du,df | source

      fish_vi_key_bindings

      set -g fish_vi_force_cursor
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_visual block
    '';
  };

  xdg.configFile."fish/themes/theme.theme".text = ''
    fish_color_normal ${colors.text}
    fish_color_command ${colors.blue}
    fish_color_param ${colors.pink}
    fish_color_keyword ${colors.flamingo}
    fish_color_quote ${colors.blue}
    fish_color_redirection ${colors.mauve}
    fish_color_end ${colors.peach}
    fish_color_comment ${colors.overlay0}
    fish_color_error ${colors.red}
    fish_color_gray ${colors.overlay0}
    fish_color_selection --background=${colors.surface0}
    fish_color_search_match --background=${colors.surface0}
    fish_color_option ${colors.green}
    fish_color_operator ${colors.pink}
    fish_color_escape ${colors.peach}
    fish_color_autosuggestion ${colors.overlay0} -i
    fish_color_cancel ${colors.red}
    fish_color_cwd ${colors.yellow}
    fish_color_user ${colors.teal}
    fish_color_host ${colors.lavender}
    fish_color_host_remote ${colors.green}
    fish_color_status ${colors.maroon}
    fish_pager_color_progress ${colors.overlay0}
    fish_pager_color_prefix ${colors.mauve}
    fish_pager_color_completion ${colors.text}
    fish_pager_color_description ${colors.overlay0}
  '';

  xdg.configFile."grc-rs" = {
    source = "${inputs.grc-rs.packages.${pkgs.system}.default}/etc/grc-rs";
    recursive = true;
  };
}
