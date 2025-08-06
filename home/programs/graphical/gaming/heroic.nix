{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.heroic.enable = lib.mkEnableOption "enable heroic configuration";

    config = lib.mkIf config.custom.heroic.enable {
        home.packages = with pkgs; [
            wineWowPackages.stable
            gamemode
            heroic
        ];
    };
}
