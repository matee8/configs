{
    config,
    lib,
    ...
}:
{
    options = {
        custom.bluetooth.enable = lib.mkEnableOption "enable bluetooth configuration";
    };

    config = lib.mkIf config.custom.bluetooth.enable {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
        };
    };
}
