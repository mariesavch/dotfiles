{ inputs, colors, ... }: {
  imports = [
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs colors; };
    users.marie.imports = [ ../../home ];
  };
  nix = {
    gc.automatic = true;
    settings = {
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      auto-optimise-store = true;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      tarball-ttl = 604800;
    };
  };

  security.pam.services.waylock = { };
  security.sudo.wheelNeedsPassword = false;

  services = {
    logind.powerKey = "ignore";
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    timeout = 2;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  programs.dconf.enable = true;
}
