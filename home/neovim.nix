{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    withNodeJs = false;
    extraPackages = with pkgs; [
      stylua
      lua-language-server
      rust-analyzer
      rustfmt
      taplo
      nil
      nixfmt-classic
      gnumake
      fd
      ripgrep
    ];
  };

  xdg.configFile."nvim" = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/marie/.dotfiles/configs/nvim";
    recursive = true;
  };
}
