{ pkgs, ... }: {
  home.stateVersion = "21.11";
  imports = [
    ./git.nix
    ./fish.nix
    ./neovim.nix
    ./himalaya.nix
    ./gtk.nix
    ./sway.nix
    ./waybar.nix
    ./luakit.nix
  ];
  home.packages = with pkgs; [ gcc rustc cargo rustPackages.clippy ];
}
