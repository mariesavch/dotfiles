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
}
