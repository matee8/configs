{
    ...
}:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    # This allows to keep the neovim configuration in Lua.
    xdg.configFile.nvim.source = ./nvim;
}
