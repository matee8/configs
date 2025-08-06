{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: {
        nixosConfigurations = {
            matelaptop = inputs.nixpkgs.lib.nixosSystem {
                modules = [
                    ./hosts/laptop/configuration.nix
                    inputs.stylix.nixosModules.stylix
                ];
            };
        };

        homeConfigurations = {
            "mate@matelaptop" = inputs.home-manager.lib.homeManagerConfiguration {
                pkgs = import inputs.nixpkgs {
                    system = "x86_64-linux";
                };

                modules = [
                    ./hosts/laptop/home.nix
                    inputs.nur.modules.homeManager.default
                    inputs.stylix.homeModules.stylix
                ];
            };
        };
    };
}
