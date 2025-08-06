{
    config,
    lib,
    ...
}:
{
    options.custom.audio.enable = lib.mkEnableOption "enable audio configuration";

    config = lib.mkIf config.custom.audio.enable {
        services.pulseaudio.enable = false;

        security.rtkit.enable = true;

        services.pipewire = {
            enable = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };
    };
}
