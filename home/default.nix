{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/himalaya.nix

    ./desktop/gtk.nix
    ./desktop/sway.nix
    ./desktop/firefox.nix
    ./desktop/dunst.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    wezterm
    ripgrep
    fd
    xq
    nodejs
    bun
    theme
    # rust dev
    rustup
    pkg-config
    gnumake
    lld_19
    gcc
  ];
  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/marie/.dotfiles/configs/wezterm";
    recursive = true;
  };
}
