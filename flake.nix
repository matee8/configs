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
            settings = import ./settings.nix;
        in
        {
            nixosConfigurations = {
                ${settings.hosts.laptop.hostname} = inputs.nixpkgs.lib.nixosSystem {
                    modules = [
                        ./hosts/laptop/configuration.nix
                        ./nixos
                    ];
                    specialArgs = {
                        inherit settings;
                    };
                };
            };

            homeConfigurations = {
                "${settings.mainUser.name}@${settings.hosts.laptop.hostname}" =
                    inputs.home-manager.lib.homeManagerConfiguration
                        {
                            extraSpecialArgs = {
                                inherit settings;
                                firefox-addons = inputs.firefox-addons.packages.${settings.hosts.laptop.arch};
                            };

                            pkgs = import inputs.nixpkgs {
                                system = "x86_64-linux";
                            };

                            modules = [
                                ./hosts/laptop/home.nix
                                ./home-manager
                            ];
                        };
            };
        };
}
