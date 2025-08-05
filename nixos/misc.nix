{
    lib,
    config,
    ...
}:
{
    options = {
        custom.timeZone = lib.mkOption {
            type = lib.types.str;
        };
        custom.locale = lib.mkOption {
            type = lib.types.str;
        };
        custom.extraLocale = lib.mkOption {
            type = lib.types.str;
        };
    };

    config = {
        networking = {
            networkmanager.enable = true;
            firewall.enable = true;
        };

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
    };
}
