{
    settings,
    ...
}:
{
    programs.git = {
        enable = true;
        userName = settings.user.git.name;
        userEmail = settings.user.git.email;
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
