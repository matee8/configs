{
    config,
    lib,
    ...
}:
{
    imports = [
        ./development.nix
    ];

    custom.home-manager.development.enable = lib.mkDefault false;
}
