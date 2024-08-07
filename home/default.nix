{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/himalaya.nix

    ./desktop/gtk.nix
    ./desktop/sway.nix
    ./desktop/furryfox.nix
    ./desktop/waybar.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [ ripgrep wezterm fd nodejs bun cargo rustc gcc ];
  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/marie/.dotfiles/configs/wezterm";
    recursive = true;
  };
}
