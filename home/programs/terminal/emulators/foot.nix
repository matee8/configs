{
    pkgs,
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
                    shell = "${pkgs.zsh}/bin/zsh";
                    term = "foot";
                    app-id = "foot-client";
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
            };
        };
    };
}
