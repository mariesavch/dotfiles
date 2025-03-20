{ inputs, ... }: {
  imports = [
    ../common
    ./hardware.nix
    inputs.nixos-apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    inputs.nixos-apple-silicon.overlays.apple-silicon-overlay
    (final: prev: { mesa = final.mesa-asahi-edge; })
  ];

  hardware = {
    asahi = {
      peripheralFirmwareDirectory = ./firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "driver";
      setupAsahiSound = true;
      withRust = true;
    };
    graphics.enable = true;
  };

  boot = {
    consoleLogLevel = 0;
    kernelParams = [ "apple_dcp.show_notch=1" ];
    loader.efi.canTouchEfiVariables = false;
    m1n1CustomLogo = ./bootlogo_256.png;
  };

  networking.hostName = "kitaro";
  system.stateVersion = "23.05";
}
