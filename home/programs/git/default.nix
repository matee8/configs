{
    config,
    lib,
    ...
}:
{
    options = {
        custom.git.userName = lib.mkOption {
            type = lib.types.str;
        };
        custom.git.userEmail = lib.mkOption {
            type = lib.types.str;
        };
    };

    config.programs.git = {
        enable = true;
        userName = config.custom.git.userName;
        userEmail = config.custom.git.userEmail;
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
}
