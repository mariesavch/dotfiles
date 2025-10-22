{ pkgs, ... }: {
  home.stateVersion = "21.11";
  imports = [
    ./git.nix
    ./fish.nix
    ./neovim.nix
    ./himalaya.nix
    ./gtk.nix
    ./sway.nix
    ./dunst.nix
    ./firefox.nix
  ];
  home.packages = with pkgs; [ krita gcc thokr ];
}
