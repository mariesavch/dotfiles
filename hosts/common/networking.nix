{ ... }: {
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
  networking.proxy.default = "socks5://localhost:1080";
  services.v2ray = {
    enable = true;
    configFile = "/var/secrets/v2ray.json";
  };
}
