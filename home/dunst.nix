{ colors, ... }: {
  services.dunst = let
    style = {
      timeout = 8;
      background = "#${colors.mantle}";
      foreground = "#${colors.text}";
      highlight = "#${colors.mauve}";
    };
  in {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        width = 320;
        origin = "top-left";
        notification_limit = 1;
        offset = "20x20";
        icon_position = "off";
        line_height = "8";

        progress_bar_height = 6;
        progress_bar_frame_width = 0;

        padding = 18;
        horizontal_padding = 18;
        frame_width = 0;
        gap_size = 9;
        font = "CartographCF Nerd Font 12";
        format =
          "<span font_desc='CartographCF Nerd Font Heavy Italic 12' foreground='#${colors.text}'>%a</span>\\n%s%b";
        show_indicators = false;
        ellipsize = "end";
        markup = "full";
      };

      urgency_low = style;
      urgency_normal = style;
      urgency_critical = style;
    };
  };
}
