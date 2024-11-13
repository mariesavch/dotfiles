{ inputs, pkgs, lib, ... }: {
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

  systemd.package = let
    systemdBroken = (lib.versionAtLeast pkgs.systemd.version "256.7");
    systemdPatched = pkgs.systemd.overrideAttrs (old: {
      patches = let
        oldPatches = (old.patches or [ ]);
        patchNames = (builtins.map (p:
          if ((builtins.typeOf p) == "path") then builtins.baseNameOf p else "")
          oldPatches);
        fixName =
          "0019-Revert-boot-Make-initrd_prepare-semantically-equival.patch";
        alreadyPatched = builtins.elem fixName patchNames;
      in oldPatches ++ lib.optionals (!alreadyPatched) [
        (pkgs.fetchpatch {
          url =
            "https://raw.githubusercontent.com/NixOS/nixpkgs/125e99477b0ac0a54b7cddc6c5a704821a3074c7/pkgs/os-specific/linux/systemd/${fixName}";
          hash = "sha256-UW3DZiaykQUUNcGA5UFxN+/wgNSW3ufxDDCZ7emD16o=";
        })
      ];
    });
  in if systemdBroken then systemdPatched else pkgs.systemd;

  boot = {
    consoleLogLevel = 0;
    kernelParams = [ "apple_dcp.show_notch=1" ];
    loader.efi.canTouchEfiVariables = false;
    m1n1CustomLogo = ./bootlogo_256.png;
  };

  networking.hostName = "kitaro";
  system.stateVersion = "23.05";
}
