local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim",
        mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup()

local now, add = MiniDeps.now, MiniDeps.add

now(function()
    require("mini.diff").setup({
        view = {
            style = "number",
        },
    })
end)

now(function()
    require("mini.files").setup({
        mappings = {
            close = "<C-c>",
        },
    })
end)

now(function()
    require("mini.pick").setup({
        mappings = {
            choose = "<C-f>",
            move_down = "<C-j>",
            move_up = "<C-k>",
        },
    })
end)

now(function()
    add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end,
        },
    })

    add({
        source = "nvim-treesitter/nvim-treesitter-textobjects",
    })

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "c",
            "css",
            "html",
            "javascript",
            "lua",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "query",
            "rust",
            "sql",
            "vimdoc",
        },
        indent = {
            enable = true,
        },
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
    })
end)

now(function()
    add({
        source = "catppuccin/nvim",
    })

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
end)
