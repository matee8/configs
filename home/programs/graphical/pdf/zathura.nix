{
    config,
    lib,
    ...
}:
{
    options.custom.zathura.enable = lib.mkEnableOption "enable zathura configuration";

    config = lib.mkIf config.custom.zathura.enable {
        xdg.mimeApps.defaultApplications."application/pdf" = "org.pwmt.zathura.desktop";

        programs.zathura.enable = true;
    };
}
