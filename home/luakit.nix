{ colors, config, ... }: {
  xdg.configFile."luakit" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "/home/marie/.dotfiles/configs/luakit";
    recursive = true;
  };
  # so simple so stupid so terrible it can broke websites
  # but it makes web just pretty(i hate webdevs)
  xdg.dataFile."luakit/styles/style.css".text = ''
    /* i really want this to be global */ 
    *, body, :root, ::after, ::placeholder {
      background-color: #${colors.base} !important;
      background: #${colors.base} !important;
      color: #${colors.text} !important;
      fill: #${colors.text} !important;
      border: 0px solid #${colors.base} !important;
      border-color: #${colors.base} !important;
      box-shadow: 0 0 0 0 #${colors.base} !important;
      line-height: 1.7 !important;
      font-family: CartographCF Nerd Font !important;
    }
  '';
}
