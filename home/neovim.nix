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

      dprint
      nil
      nixfmt-classic

      fzf
      gnumake
      unzip
    ];
  };

  xdg.configFile."nvim" = {
    source =
      config.lib.file.mkOutOfStoreSymlink "/home/marie/.dotfiles/configs/nvim";
    recursive = true;
  };

  home.file.".dprint.json".text = builtins.toJSON {
    plugins = [
      "https://plugins.dprint.dev/json-0.20.0.wasm"
      "https://plugins.dprint.dev/markdown-0.18.0.wasm"
    ];
  };
}
