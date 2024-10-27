{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grc-rs = {
      url = "github:mariesavch/grc-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url =
        "gitlab:rycee/nur-expressions/83a5049cfc2e37d9ef5b540aa01c0e5cc1e2a00f?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      themes = {
        dark = {
          type = "dark";
          rosewater = "ff8389";
          flamingo = "ff8389";
          red = "ff8389";
          maroon = "ff8389";
          pink = "ff7eb6";
          mauve = "be95ff";
          peach = "d44a1c";
          yellow = "ab8600";
          green = "08bdba";
          teal = "33b1ff";
          sky = "33b1ff";
          sapphire = "33b1ff";
          blue = "78a9ff";
          lavender = "78a9ff";
          text = "ffffff";
          subtext1 = "f4f4f4";
          subtext0 = "e0e0e0";
          overlay2 = "adadad";
          overlay1 = "949494";
          overlay0 = "7a7a7a";
          surface2 = "4f4f4f";
          surface1 = "383838";
          surface0 = "2e2e2e";
          base = "161616";
          mantle = "0d0d0d";
          crust = "000000";
        };
        light = {
          type = "light";
          rosewater = "c14a4a";
          flamingo = "c14a4a";
          pink = "945e80";
          mauve = "945e80";
          red = "c14a4a";
          maroon = "c14a4a";
          peach = "c35e0a";
          yellow = "a96b2c";
          green = "6c782e";
          teal = "4c7a5d";
          sky = "4c7a5d";
          sapphire = "4c7a5d";
          blue = "45707a";
          lavender = "45707a";
          text = "654735";
          subtext1 = "7b5d44";
          subtext0 = "8f6f56";
          overlay2 = "a28368";
          overlay1 = "b6977a";
          overlay0 = "c9aa8c";
          surface2 = "A79C86";
          surface1 = "C9C19F";
          surface0 = "DFD6B1";
          base = "fbf1c7";
          mantle = "F3EAC1";
          crust = "E7DEB7";
        };
      };
      colors = themes.light;
    in {
      nixosConfigurations."kitaro" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs colors; };
        modules = [
          ./hosts/kitaro
          ./hosts/common
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
