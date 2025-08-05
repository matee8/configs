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
                    ./nixos
                    inputs.home-manager.nixosModules.home-manager
                ];
            };
        };
    };
}
