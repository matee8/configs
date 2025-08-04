{
    config,
    lib,
    ...
}:
{
    config = lib.mkIf config.custom.home-manager.console.enable {
        programs.neovim = {
            enable = true;
            defaultEditor = true;
        };

        # This allows to keep the neovim configuration in Lua.
        xdg.configFile.nvim.source = ./nvim;
    };
}
