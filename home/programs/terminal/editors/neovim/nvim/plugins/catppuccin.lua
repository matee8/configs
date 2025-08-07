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
    highlight_overrides = {
        all = function(colors)
            return {
                Pmenu = {
                    bg = colors.base
                },
            }
        end
    }
})
vim.cmd.colorscheme("catppuccin")
