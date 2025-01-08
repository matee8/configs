return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        ensure_installed = {
            "c",
            "printf",
            "lua",
            "vimdoc",
            "javascript",
            "python",
            "bash",
            "html",
            "css",
            "sql",
            "rust",
        },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        playgrund = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                },
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
