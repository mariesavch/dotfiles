{
  description = "Nix Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    nixos-apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
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
      colors = {
        rosewater = "f5e0dc";
        flamingo = "f2cdcd";
        pink = "f5c2e7";
        mauve = "cba6f7";
        red = "f38ba8";
        maroon = "eba0ac";
        peach = "fab387";
        yellow = "f9e2af";
        green = "a6e3a1";
        teal = "94e2d5";
        sky = "89dceb";
        sapphire = "74c7ec";
        blue = "89b4fa";
        lavender = "b4befe";
        text = "cdd6f4";
        subtext1 = "bac2de";
        subtext0 = "a6adc8";
        overlay2 = "9399b2";
        overlay1 = "7f849c";
        overlay0 = "6c7086";
        surface2 = "585b70";
        surface1 = "45475a";
        surface0 = "313244";
        base = "1e1e2e";
        mantle = "181825";
        crust = "11111b";
      };
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
