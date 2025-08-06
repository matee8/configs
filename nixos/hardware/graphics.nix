{
    config,
    lib,
    ...
}:
{
    options.custom.graphics.enable = lib.mkEnableOption "enable graphics configuration";

    config = lib.mkIf config.custom.graphics.enable {
        hardware.graphics = {
            enable = true;
            enable32Bit = true;
        };
    };
}
