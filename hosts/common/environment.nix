{ ... }: {
  environment = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      SUDO_EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
      BROWSER = "luakit";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_BIN_HOME = "$HOME/.local/bin";
      XDG_PICTURES_DIR = "$HOME/pictures";
      XDG_DOWNLOADS_DIR = "/tmp/downloads";
    };
  };
}
