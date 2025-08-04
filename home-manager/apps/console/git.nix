{
    config,
    lib,
    ...
}:
{
    config = lib.mkIf config.custom.home-manager.console.enable {
        programs.git = {
            enable = true;
            aliases = {
                c = "commit";
                s = "status";
                p = "push";
            };
            extraConfig = {
                credential.helper = "store";
                init.defaultBranch = "main";
                pull.rebase = false;
                ui.color.ui = "always";
                color.ui = true;
            };
        };
    };
}
