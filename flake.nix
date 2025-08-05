{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs: {
        nixosConfigurations = {
            matelaptop = inputs.nixpkgs.lib.nixosSystem {
                modules = [
                    ./hosts/laptop/configuration.nix
                ];
                specialArgs = {
                    firefox-addons = inputs.firefox-addons.packages."x86_64-linux";
                };
            };
        };

        homeConfigurations = {
            "mate@matelaptop" = inputs.home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = {
                    firefox-addons = inputs.firefox-addons.packages."x86_64-linux";
                };

                pkgs = import inputs.nixpkgs {
                    system = "x86_64-linux";
                };

                modules = [
                    ./hosts/laptop/home.nix
                ];
            };
        };
    };
}
