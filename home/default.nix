{ pkgs, config, ... }: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/neovim.nix
    ./cli/himalaya.nix

    ./desktop/gtk.nix
    ./desktop/sway.nix
    ./desktop/dunst.nix
    ./desktop/firefox.nix
  ];
  home.stateVersion = "21.11";
  home.packages = with pkgs; [
    wezterm
    ripgrep
    neofetch
    rink
    thokr
    fd
    xq
    nodejs
    bun
    tlrc
    theme
    extract
    # rust dev
    rustup
    pkg-config
    gnumake
    lld_19
    gcc
    dioxus-cli
    # bevy engine deps
    pkg-config
    udev
    alsa-lib-with-plugins
    vulkan-loader
    libxkbcommon
    wayland
    openssl
  ];
  xdg.configFile."wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/marie/.dotfiles/configs/wezterm";
    recursive = true;
  };
  xdg.configFile."luakit" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/marie/.dotfiles/configs/luakit";
    recursive = true;
  };
}
