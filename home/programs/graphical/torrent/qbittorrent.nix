{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.qbittorrent.enable = lib.mkEnableOption "enable qbittorrent configuration";

    config = lib.mkIf config.custom.qbittorrent.enable {
        home.packages = [ pkgs.qbittorrent ];
    };
}
