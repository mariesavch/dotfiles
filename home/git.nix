{ ... }: {
  programs.git = {
    enable = true;
    userName = "mariesavch";
    userEmail = "mariesavch@icloud.com";
    extraConfig = {
      github.user = "mariesavch";
      init.defaultBranch = "main";
      difftool.prompt = false;
      mergetool = {
        keepBackup = false;
        trustExitCode = false;
        prompt = true;
      };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
    };
  };
}
