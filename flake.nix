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
        inputs@{
            nixpkgs,
            home-manager,
            ...
        }:
        let
            settings = import ./settings.nix;
        in
        {
            nixosConfigurations.${settings.system.hostName} = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit settings;
                };
                modules = [ ./nixos/configuration.nix ];
            };
            homeConfigurations."${settings.user.name}@${settings.system.hostName}" =
                home-manager.lib.homeManagerConfiguration
                    {
                        pkgs = nixpkgs.legacyPackages.${settings.system.arch};
                        extraSpecialArgs = {
                            inherit settings;
                            firefox-addons = inputs.firefox-addons;
                        };
                        modules = [ ./home-manager/home.nix ];
                    };
        };
}
