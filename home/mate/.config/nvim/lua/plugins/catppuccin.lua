MiniDeps.now(function()
    MiniDeps.add({
        source = "catppuccin/nvim",
    })

    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        show_end_of_buffer = false,
        float = {
            transparent = true,
            solid = true,
        },
        default_integrations = false,
        integrations = {
            native_lsp = {
                enabled = true,
            },
            mini = {
                enabled = true,
            }
        },
    })

    vim.cmd.colorscheme("catppuccin")
end)
