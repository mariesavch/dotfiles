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
    date=$(date +'%A, %#d %B %H:%M')

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
  extract = prev.writeShellScriptBin "extract" ''
        #!/bin/bash

    if [[ $# -eq 0 ]]; then
        cat >&2 <<'EOF'
    Usage: extract [-option] [file ...]

    Options:
        -r, --remove    Remove archive after unpacking.
    EOF
        exit 1
    fi

    remove_archive=1
    if [[ "$1" == "-r" || "$1" == "--remove" ]]; then
        remove_archive=0
        shift
    fi

    pwd="$PWD"
    while [[ $# -gt 0 ]]; do
        if [[ ! -f "$1" ]]; then
            echo "extract: '$1' is not a valid file" >&2
            shift
            continue
        fi

        success=0
        file="$1"
        full_path="$(realpath "$1")"
        extract_dir="''${file%.*}"

        if [[ "$extract_dir" =~ ".tar$" ]]; then
            extract_dir="''${extract_dir%.tar}"
        fi

        if [[ -e "$extract_dir" ]]; then
            rnd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5)
            extract_dir="''${extract_dir}-''${rnd}"
        fi

        mkdir -p "$extract_dir"
        cd "$extract_dir" || exit
        echo "extract: extracting to $extract_dir" >&2

        case "''${file,,}" in
            *.tar.gz|*.tgz) tar zxvf "$full_path" ;;
            *.tar.bz2|*.tbz|*.tbz2) tar xvjf "$full_path" ;;
            *.tar.xz|*.txz) tar --xz -xvf "$full_path" || xzcat "$full_path" | tar xvf - ;;
            *.tar.lz) lzip -d "$full_path" && tar xvf "''${full_path%.lz}" ;;
            *.tar.lz4) lz4 -d "$full_path" | tar xvf - ;;
            *.tar.zst|*.tzst) tar --zstd -xvf "$full_path" || zstdcat "$full_path" | tar xvf - ;;
            *.tar) tar xvf "$full_path" ;;
            *.gz) gunzip -ck "$full_path" > "''${file%.*}" ;;
            *.bz2) bunzip2 "$full_path" ;;
            *.xz) unxz "$full_path" ;;
            *.lz4) lz4 -d "$full_path" ;;
            *.lzma) unlzma "$full_path" ;;
            *.z) uncompress "$full_path" ;;
            *.zip) unzip "$full_path" ;;
            *.rar) unrar x "$full_path" ;;
            *.7z) 7z x "$full_path" ;;
            *.deb)
                mkdir -p control data
                ar vx "$full_path" > /dev/null
                cd control && tar xvf ../control.tar.*
                cd ../data && tar xvf ../data.tar.*
                cd .. && rm -f *.tar.* debian-binary
                ;;
            *.zst) unzstd --stdout "$full_path" > "''${file%.*}" ;;
            *.cab|*.exe) cabextract "$full_path" ;;
            *.cpio) cpio -idmvF "$full_path" ;;
            *.zpaq) zpaq x "$full_path" ;;
            *)
                echo "extract: '$file' cannot be extracted" >&2
                success=1 ;;
        esac

        if [[ $success -eq 0 && $remove_archive -eq 0 ]]; then
            rm "$full_path"
        fi

        cd "$pwd" || exit

        if [[ -d "$extract_dir" ]]; then
            content=("$extract_dir"/*)
            if [[ ''${#content[@]} -eq 1 && -d "''${content[0]}" ]]; then
                mv "''${content[0]}"/* "$extract_dir" 2>/dev/null
                rmdir "''${content[0]}"
            elif [[ ''${#content[@]} -eq 0 ]]; then
                rmdir "$extract_dir"
            fi
        fi

        shift
    done

  '';
}
