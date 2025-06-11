{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/himalaya.nix

    ./desktop/gtk.nix
    ./desktop/sway.nix
    ./desktop/dunst.nix
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
