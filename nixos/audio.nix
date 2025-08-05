{
    config,
    lib,
    ...
}:
{
    options.custom.audio.enable = lib.mkEnableOption "enable audio configuration";

    config = lib.mkIf config.custom.audio.enable {
        services.pipewire = {
            enable = true;
            pulse.enable = true;
        };
    };
}
