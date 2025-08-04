{
    config,
    lib,
    settings,
    ...
}:
{
    config = lib.mkIf config.custom.home-manager.desktop.enable {
        programs.foot = {
            enable = true;
            settings = {
                main = {
                    shell = "zsh";
                    term = "foot";
                    app-id = "foot-client";
                    font = "${settings.theme.font}:size=13:antialias=true";
                    font-bold = "${settings.theme.font}:style=Bold:size=13:antialias=true";
                    font-italic = "${settings.theme.font}:style=Italic:size=13:antialias=true";
                    font-bold-italic = "${settings.theme.font}:style=Bold Italic:size=13:antialias=true";
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
                colors = settings.theme.colors.terminal // {
                    cursor = "${settings.theme.colors.secondary} ${settings.theme.colors.primary}";
                };
            };
        };
    };
}
