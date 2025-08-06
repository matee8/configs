{
    config,
    lib,
    ...
}:
{
    config = lib.mkIf config.custom.river.enable {
        wayland.windowManager.river.settings.rule-add."-app-id" = {
            "'librewolf*'" = "ssd";
            "'thunderbird*'" = "ssd";
            "'libreoffice*'" = "ssd";
            "'*zathura*'" = "ssd";
        };
    };
}
