{ ... }: {
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
  networking.firewall.allowedTCPPorts = [ 3000 8080 ];
  networking.extraHosts = ''
    0.0.0.0 ufanet.ru
    0.0.0.0 www.ufanet.ru
    0.0.0.0 mail.ru
    0.0.0.0 www.mail.ru
    0.0.0.0 twitter.com
    0.0.0.0 www.twitter.com
    0.0.0.0 facebook.com
    0.0.0.0 www.facebook.com
    0.0.0.0 instagram.com
    0.0.0.0 www.instagram.com
    0.0.0.0 news.ycombinator.com
  '';
}
