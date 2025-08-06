require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = true,
    integrations = {
        mason = true,
        cmp = true,
        fzf = true,
        harpoon = true,
        native_lsp = {
            enabled = true,
        },
    },
})
vim.cmd.colorscheme("catppuccin")
