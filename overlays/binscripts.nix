final: prev: {
  volume = prev.writeShellScriptBin "volume" ''
    #!/bin/sh

    ${prev.alsa-utils}/bin/amixer "$@"
    volume="$(awk -F"[][]" '/Left:/ { print $2 }' <(${prev.alsa-utils}/bin/amixer sget Master))"
    state="$(awk -F"[][]" '/Left:/ { print $4 }' <(${prev.alsa-utils}/bin/amixer sget Master))"

    if [ $state = "off" ]; then
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "volume" \
            "muted" \
            -t 888 \
            -u low
    else
        ${prev.libnotify}/bin/notify-send -r 69 \
            -a "volume" "currently at $volume" \
            -h int:value:"$volume" \
            -t 888 \
            -u low
    fi
  '';
  brightness = let brightnessctl = prev.brightnessctl + "/bin/brightnessctl";
  in prev.writeShellScriptBin "brightness" ''
    #!/bin/sh

    ${brightnessctl} "$@"
    brightness=$(echo $(($(${brightnessctl} g) * 100 / $(${brightnessctl} m))))

    ${prev.libnotify}/bin/notify-send -r 69 \
        -a "brightness" "currently at $brightness%" \
        -h int:value:"$brightness" \
        -t 888 \
        -u low
  '';
  kbdbrightness = let brightnessctl = prev.brightnessctl + "/bin/brightnessctl";
  in prev.writeShellScriptBin "kbdbrightness" ''
    #!/bin/sh

    ${brightnessctl} "$@" --device='kbd_backlight'
    brightness=$(echo $(($(${brightnessctl} --device='kbd_backlight' g) * 100 / $(${brightnessctl} --device='kbd_backlight' m))))

    ${prev.libnotify}/bin/notify-send -r 69 \
        -a "keyboard brightness" "currently at $brightness%" \
        -h int:value:"$brightness" \
        -t 888 \
        -u low
  '';
  notifystatus = prev.writeShellScriptBin "notifystatus" ''
    #!/bin/sh

    battery=$(echo "$(cat /sys/class/power_supply/macsmc-battery/capacity)%")
    if [ $(cat /sys/class/power_supply/macsmc-battery/status) = 'Charging' ]; then
      battery_status='(charging)'
    fi
    date=$(date +'%A, %#d %b %H:%M')

    ${prev.libnotify}/bin/notify-send -r 69 \
        -a "''${date,,}" "battery at $battery $battery_status" \
        -h int:value:"$battery" \
        -t 888 \
        -u low
  '';

  theme = prev.writeShellScriptBin "th" ''
        if grep -q "colors = themes.light;" ~/.dotfiles/flake.nix; then
          echo -e "\e[1;32mswitch to dark"
          sed -i -e 's/theme.colors = themes.light/theme.colors = themes.dark/' ~/.dotfiles/configs/wezterm/theme.lua
          sed -i -e 's/local colors = themes.light/local colors = themes.dark/' ~/.dotfiles/configs/luakit/theme.lua
          sed -i -e 's/settings.application.prefer_dark_mode = false/settings.application.prefer_dark_mode = true/' ~/.dotfiles/configs/luakit/userconf.lua
          sed -i -e 's/vim.opt.background = "light"/vim.opt.background = "dark"/' ~/.dotfiles/configs/nvim/lua/v/core/options.lua
          sed -i -e 's/colors = themes.light;/colors = themes.dark;/' ~/.dotfiles/flake.nix
          sudo nixos-rebuild switch --flake ~/.dotfiles#kitaro
    else
          echo -e "\e[1;32mswitch to light"
          sed -i -e 's/theme.colors = themes.dark/theme.colors = themes.light/' ~/.dotfiles/configs/wezterm/theme.lua
          sed -i -e 's/local colors = themes.dark/local colors = themes.light/' ~/.dotfiles/configs/luakit/theme.lua
          sed -i -e 's/settings.application.prefer_dark_mode = true/settings.application.prefer_dark_mode = false/' ~/.dotfiles/configs/luakit/userconf.lua
          sed -i -e 's/vim.opt.background = "dark"/vim.opt.background = "light"/' ~/.dotfiles/configs/nvim/lua/v/core/options.lua
          sed -i -e 's/colors = themes.dark;/colors = themes.light;/' ~/.dotfiles/flake.nix
          sudo nixos-rebuild switch --flake ~/.dotfiles#kitaro
    fi
  '';
}
