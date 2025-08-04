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

    outputs =
        inputs:
        let
            utils = import ./utils;
            settings = import ./settings.nix;

            mkSystem =
                configuration:
                utils.mkSystem {
                    specialArgs = {
                        inherit settings;
                    };

                    inherit configuration;
                    inherit (inputs) nixpkgs;
                };

            mkHome =
                system: configuration:
                let
                    firefox-addons = inputs.firefox-addons.packages.${system};
                in
                utils.mkHome {
                    extraSpecialArgs = {
                        inherit settings;
                        inherit firefox-addons;

                    };

                    inherit configuration system;
                    inherit (inputs) home-manager nixpkgs;
                };
        in
        {
            nixosConfigurations = {
                ${settings.hostnames.laptop} = mkSystem ./hosts/laptop/configuration.nix;
            };

            homeConfigurations = {
                "${settings.mainUser.name}@${settings.hostnames.laptop}" =
                    mkHome "x86_64-linux" ./hosts/laptop/home.nix;
            };
        };
}
