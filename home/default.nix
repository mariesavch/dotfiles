{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./fish.nix
    ./neovim.nix
    ./himalaya.nix
    ./gtk.nix
    ./sway.nix
    ./dunst.nix
    ./luakit.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [ neovide luakit fd ripgrep rink thokr ];
}
