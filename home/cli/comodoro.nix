{ ... }: {
  programs.comodoro = {
    enable = true;
    settings = {
      pomodoro = {
        preset = "pomodoro";
        tcp-host = "kitaro";
        tcp-port = 3487;
      };
    };
  };
  services.comodoro = {
    enable = true;
    preset = "pomodoro";
    protocols = [ "tcp" ];
    environment = { RUST_LOG = "debug"; };
  };
}
