{ inputs, colors, pkgs, lib, ... }: {
  imports = [
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];
  nixpkgs.overlays = [ (import ../../overlays/binscripts.nix) ];

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

  environment = {
    systemPackages = with pkgs; [ gnused curl openssh ];
    defaultPackages = lib.mkForce [ ];
  };
  fonts.packages = with pkgs; [ noto-fonts-monochrome-emoji ];

  security.sudo.wheelNeedsPassword = false;

  services = {
    logind.powerKey = "ignore";
    upower.enable = true;
    fstrim.enable = true;
    timesyncd.enable = true;
    nscd.enable = lib.mkForce true;
  };

  boot.loader = {
    systemd-boot.enable = true;
    timeout = 0;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  programs.command-not-found.enable = false;
  xdg.icons.enable = true;
}
