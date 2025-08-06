{
    config,
    lib,
    pkgs,
    ...
}:
{
    options.custom.ffplay.enable = lib.mkEnableOption "enable ffplay configuration";

    config = lib.mkIf config.custom.ffplay.enable {
        home.file.".local/share/applications/ffplay.desktop".source =
            ../../../../assets/applications/ffplay.desktop;

        xdg.mimeApps.defaultApplications = {
            "video/mp4" = "ffplay.desktop";
            "video/x-matroska" = "ffplay.desktop";
            "audio/mpeg" = "ffplay.desktop";
        };

        home.packages = [ pkgs.ffmpeg-full ];
    };
}
