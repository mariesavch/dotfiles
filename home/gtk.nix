{ pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      name = "CartographCF Nerd Font";
      size = 12;
    };
    gtk3.extraCss = ''
      decoration {
          border-radius: 0px 0px 0px 0px;
          border-width: 0px;
          box-shadow: none;
      }

      decoration:backdrop {
          border-radius: 0px 0px 0px 0px;
          border-width: 0px;
          box-shadow: none;
      }
    '';
    gtk2.configLocation = "/home/marie/.config/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  home.pointerCursor = {
    name = "Simp1e-Dark";
    package = pkgs.simp1e-cursors;
    gtk.enable = true;
    size = 24;
  };
  xdg.configFile."qt5ct/colors/theme.conf".text = ''
    [ColorScheme]
    active_colors=  #ffcdd6f4,     #ff45475a, #ff585b70, #ff313244, #ff11111b, #ff181825, #ffcdd6f4,     #ffcdd6f4,  #ffcdd6f4,     #ff1e1e2e, #ff181825, #ff11111b, #ffcba6f7, #ff11111b,    #ff89b4fa,     #ffb4befe,   #ff181825, #ffffffff, #ff1e1e2e, #ffcdd6f4, #806c7086, #ffcba6f7
    inactive_colors=#ff7f849c, #ff1e1e2e,     #ff45475a, #ff313244, #ff11111b, #ff181825, #ff7f849c, #ffcdd6f4,  #ff7f849c, #ff1e1e2e, #ff181825, #ff11111b, #ff313244,              #ff7f849c, #ff7f849c, #ff7f849c,   #ff181825, #ffffffff, #ff1e1e2e, #ffcdd6f4, #806c7086, #ff313244
    disabled_colors=#ff6c7086, #ff313244, #ff45475a, #ff313244, #ff11111b, #ff181825, #ff6c7086, #ffcdd6f4,  #ff6c7086, #ff1e1e2e, #ff181825, #ff11111b, #ff181825,                #ff6c7086, #ffa9bcdb,   #ffc7cceb, #ff181825, #ffffffff, #ff1e1e2e, #ffcdd6f4, #806c7086, #ff181825
  '';
  xdg.dataFile."krita/color-schemes/theme.colors".text = ''
    [ColorEffects:Disabled]
    Color=30, 30, 46
    ColorAmount=0.30000000000000004
    ColorEffect=2
    ContrastAmount=0.1
    ContrastEffect=0
    IntensityAmount=-1
    IntensityEffect=0

    [ColorEffects:Inactive]
    ChangeSelectionColor=true
    Color=30, 30, 46
    ColorAmount=0.5
    ColorEffect=3
    ContrastAmount=0
    ContrastEffect=0
    Enable=true
    IntensityAmount=0
    IntensityEffect=0

    [Colors:Button]
    BackgroundAlternate=203,166,247
    BackgroundNormal=49, 50, 68
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundActive=250, 179, 135
    ForegroundInactive=166, 173, 200
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=205, 214, 244
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [Colors:Complementary]
    BackgroundAlternate=17, 17, 27
    BackgroundNormal=24, 24, 37
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundActive=250, 179, 135
    ForegroundInactive=166, 173, 200
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=205, 214, 244
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [Colors:Header]
    BackgroundAlternate=17, 17, 27
    BackgroundNormal=24, 24, 37
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundActive=250, 179, 135
    ForegroundInactive=166, 173, 200
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=205, 214, 244
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [Colors:Selection]
    BackgroundAlternate=203,166,247
    BackgroundNormal=203,166,247
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundLink=203,166,247
    ForegroundInactive=24, 24, 37
    ForegroundActive=250, 179, 135
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=17, 17, 27
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [Colors:Tooltip]
    BackgroundAlternate=27,25,35
    BackgroundNormal=30, 30, 46
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundActive=250, 179, 135
    ForegroundInactive=166, 173, 200
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=205, 214, 244
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [Colors:View]
    BackgroundAlternate=24, 24, 37
    BackgroundNormal=30, 30, 46
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundActive=250, 179, 135
    ForegroundInactive=166, 173, 200
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=205, 214, 244
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [Colors:Window]
    BackgroundAlternate=17, 17, 27
    BackgroundNormal=24, 24, 37
    DecorationFocus=203,166,247
    DecorationHover=49, 50, 68
    ForegroundActive=250, 179, 135
    ForegroundInactive=166, 173, 200
    ForegroundLink=203,166,247
    ForegroundNegative=243, 139, 168
    ForegroundNeutral=249, 226, 175
    ForegroundNormal=205, 214, 244
    ForegroundPositive=166, 227, 161
    ForegroundVisited=203, 166, 247


    [General]
    ColorScheme=CatppuccinMochaMauve
    Name=Catppuccin Mocha Mauve
    accentActiveTitlebar=false
    shadeSortColumn=true


    [KDE]
    contrast=4


    [WM]
    activeBackground=30, 30, 46
    activeBlend=205, 214, 244
    activeForeground=205, 214, 244
    inactiveBackground=17, 17, 27
    inactiveBlend=166, 173, 200
    inactiveForeground=166, 173, 200
  '';
}
