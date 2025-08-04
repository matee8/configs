{
    lib,
    ...
}:
{
    imports = [
        ./apps
        ./features
    ];

    xdg.enable = true;
    programs.home-manager.enable = true;
}
