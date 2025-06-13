{ pkgs, config, ... }: {
  imports = [
    ./git.nix
    ./fish.nix
    ./neovim.nix
    ./himalaya.nix
    ./gtk.nix
    ./sway.nix
    ./dunst.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    neovide
    luakit
    ripgrep
    neofetch
    rink
    thokr
    fd
    extract
  ];
  xdg.configFile."luakit" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/marie/.dotfiles/configs/luakit";
    recursive = true;
  };
}
