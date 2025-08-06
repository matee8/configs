{
    config,
    lib,
    ...
}:
{
    options.custom.thunderbird.enable = lib.mkEnableOption "enable thunderbird configuration";

    config = lib.mkIf config.custom.thunderbird.enable {
        programs.thunderbird = {
            enable = true;
            profiles.default = {
                isDefault = true;
            };
        };
    };
}
