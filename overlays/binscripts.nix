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
}
