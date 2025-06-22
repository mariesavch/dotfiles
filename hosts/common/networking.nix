{ ... }: {
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
  networking.wg-quick.interfaces.awg0 = {
    type = "amneziawg";
    configFile = "/var/secrets/awg0.conf";
  };
}
