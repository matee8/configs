{
    lib,
    config,
    ...
}:
{
    options.custom = {
        timeZone = lib.mkOption {
            type = lib.types.str;
        };
        locale = lib.mkOption {
            type = lib.types.str;
        };
        extraLocale = lib.mkOption {
            type = lib.types.str;
        };
        keyMap = lib.mkOption {
            type = lib.types.str;
        };
    };

    config = {
        time.timeZone = config.custom.timeZone;
        i18n = {
            defaultLocale = config.custom.locale;
            extraLocaleSettings = {
                LC_ADDRESS = config.custom.extraLocale;
                LC_IDENTIFICATION = config.custom.extraLocale;
                LC_MEASUREMENT = config.custom.extraLocale;
                LC_MONETARY = config.custom.extraLocale;
                LC_NAME = config.custom.extraLocale;
                LC_NUMERIC = config.custom.extraLocale;
                LC_PAPER = config.custom.extraLocale;
                LC_TELEPHONE = config.custom.extraLocale;
                LC_TIME = config.custom.extraLocale;
            };
        };
        console = {
            keyMap = config.custom.keyMap;
            font = "Lat2-Terminus16";
        };
    };
}
