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
    };

    outputs = inputs: {
        nixosConfigurations = {
            matelaptop = inputs.nixpkgs.lib.nixosSystem {
                modules = [
                    ./hosts/laptop/configuration.nix
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
                ];
            };
        };
    };
}
