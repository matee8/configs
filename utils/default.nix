let
    nixosModules = ../nixos;
    home-managerModules = ../home-manager;
in
{
    mkSystem =
        {
            configuration,
            nixpkgs,
            specialArgs,
        }:
        nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
                configuration
                nixosModules
            ];
        };

    mkHome =
        {
            system,
            configuration,
            home-manager,
            nixpkgs,
            extraSpecialArgs,
        }:
        home-manager.lib.homeManagerConfiguration {
            inherit extraSpecialArgs;

            pkgs = import nixpkgs {
                inherit system;
            };

            modules = [
                configuration
                home-managerModules
            ];
        };
}
