{ inputs, colors, pkgs, ... }: {
  imports = [
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];
  nixpkgs.overlays = [ (import ../../overlays/scripts.nix) ];
  fonts.packages = with pkgs; [ noto-fonts-monochrome-emoji ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs colors; };
    users.marie.imports = [ ../../home ];
  };
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };
    settings = {
      warn-dirty = false;
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      tarball-ttl = 604800;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  services = {
    logind.powerKey = "ignore";
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
    usbmuxd.enable = true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    timeout = 2;
  };

  programs = {
    dconf.enable = true;
    command-not-found.enable = false;
  };
}
