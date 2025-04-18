{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-apple-silicon = {
      url = "github:mariesavch/nixos-asahi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grc-rs = {
      url = "github:mariesavch/grc-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions/?dir=pkgs/firefox-addons";
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
          rosewater = "da1e28";
          flamingo = "da1e28";
          red = "da1e28";
          maroon = "da1e28";
          pink = "d02670";
          mauve = "8a3ffc";
          peach = "d44a1c";
          yellow = "ab8600";
          green = "007d79";
          teal = "1192e8";
          sky = "1192e8";
          sapphire = "1192e8";
          blue = "0f62fe";
          lavender = "0f62fe";
          text = "000000";
          subtext1 = "404040";
          subtext0 = "474747";
          overlay2 = "575757";
          overlay1 = "595959";
          overlay0 = "737373";
          surface2 = "8c8c8c";
          surface1 = "d1d1d1";
          surface0 = "e6e6e6";
          base = "FFFFFF";
          mantle = "f2f2f2";
          crust = "ebebeb";
        };
      };
      colors = themes.dark;
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
