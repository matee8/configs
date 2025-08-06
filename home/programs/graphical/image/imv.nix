{
    config,
    lib,
    ...
}:
{
    options.custom.imv.enable = lib.mkEnableOption "enable imv configuration";

    config = lib.mkIf config.custom.imv.enable {
        xdg.mimeApps.defaultApplications = {
            "image/png" = "imv.desktop";
            "image/jpeg" = "imv.desktop";
            "image/gif" = "imv.desktop";
            "image/bmp" = "imv.desktop";
            "image/tiff" = "imv.desktop";
        };

        programs.imv.enable = true;
    };
}
