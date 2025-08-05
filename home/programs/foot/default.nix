{
    config,
    lib,
    ...
}:
{
    options.custom.foot.enable = lib.mkEnableOption "enable foot terminal configuration";

    config = lib.mkIf config.custom.foot.enable {
        programs.foot = {
            enable = true;
            settings = {
                main = {
                    shell = "zsh";
                    term = "foot";
                    app-id = "foot-client";
                    font = "${config.custom.theme.font}:size=13:antialias=true";
                    font-bold = "${config.custom.theme.font}:style=Bold:size=13:antialias=true";
                    font-italic = "${config.custom.theme.font}:style=Italic:size=13:antialias=true";
                    font-bold-italic = "${config.custom.theme.font}:style=Bold Italic:size=13:antialias=true";
                    pad = "4x4";
                };

                bell = {
                    urgent = "no";
                    notify = "no";
                    visual = "no";
                };

                scrollback = {
                    lines = 1000;
                    multiplier = 3;
                };

                colors = config.custom.theme.colors.terminal // {
                    cursor = "${config.custom.theme.colors.secondary} ${config.custom.theme.colors.primary}";
                };
            };
        };
    };
}
