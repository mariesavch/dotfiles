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
      taplo
      nil
      nixfmt-classic
      fzf
      gnumake
    ];
  };

  xdg.configFile."nvim" = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/marie/.dotfiles/configs/nvim";
    recursive = true;
  };
}
