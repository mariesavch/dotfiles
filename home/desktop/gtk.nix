{ pkgs, ... }: {
  gtk = {
    enable = true;
    font = {
      name = "CartographCF Nerd Font";
      size = 12;
    };
    gtk2.configLocation = "/home/marie/.config/gtk-2.0/gtkrc";
  };
  xdg.configFile."gtk-3.0/gtk.css".text = ''
    window decoration {
      box-shadow: none;
    }
    .titlebar, .titlebar .background {
      border-radius: 0px 0px 0px 0px;
    }
  '';
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    gtk.enable = true;
    size = 24;
  };
}
