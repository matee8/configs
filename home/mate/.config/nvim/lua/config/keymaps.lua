-- Leader
vim.g.mapleader =
    " "

local set_keymap =
    vim.keymap.set

-- General keymaps
set_keymap(
    {
        "i",
        "t",
    },
    "<C-c>",
    "<Esc>"
)

set_keymap(
    "i",
    "<Up>",
    ""
)
set_keymap(
    "i",
    "<Down>",
    ""
)
set_keymap(
    "i",
    "<Right>",
    ""
)
set_keymap(
    "i",
    "<Left>",
    ""
)
set_keymap(
    "n",
    "<Up>",
    ""
)
set_keymap(
    "n",
    "<Down>",
    ""
)
set_keymap(
    "n",
    "<Right>",
    ""
)
set_keymap(
    "n",
    "<Left>",
    ""
)

set_keymap(
    "i",
    "<C-h>",
    "<Left>",
    {
        silent = true,
    }
)
set_keymap(
    "i",
    "<C-j>",
    "<Down>",
    {
        silent = true,
    }
)
set_keymap(
    "i",
    "<C-k>",
    "<Up>",
    {
        silent = true,
    }
)
set_keymap(
    "i",
    "<C-l>",
    "<Right>",
    {
        silent = true,
    }
)

set_keymap(
    "n",
    "H",
    "^",
    {
        silent = true,
    }
)
set_keymap(
    "n",
    "L",
    "$",
    {
        silent = true,
    }
)

set_keymap(
    "n",
    ";",
    ":",
    {
        silent = true,
    }
)

set_keymap(
    "n",
    "n",
    "nzz",
    {
        silent = true,
    }
)
set_keymap(
    "n",
    "N",
    "Nzz",
    {
        silent = true,
    }
)

set_keymap(
    "x",
    "<leader>p",
    [['_dP]],
    {
        silent = true,
        desc = "Paste without yank",
    }
)

set_keymap(
    "n",
    "<leader>d",
    '"_dd',
    {
        silent = true,
        desc = "Delete without yank",
    }
)

-- Open file explorer
set_keymap(
    "n",
    "<leader>ee",
    function()
        require(
            "oil"
        ).open_float()
    end,
    {
        silent = true,
        desc = "Open file browser",
    }
)

-- Close floating window
set_keymap(
    "n",
    "<leader>q",
    function()
        if
            vim.api.nvim_get_current_win()
            ~= 1000
        then
            vim.api.nvim_win_close(
                vim.api.nvim_get_current_win(),
                {}
            )
        end
    end,
    {
        silent = true,
        desc = "Close LSP docs",
    }
)

-- LSP keymaps
vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        callback = function()
            set_keymap(
                "n",
                "<leader>ln",
                vim.lsp.buf.rename,
                {
                    silent = true,
                    desc = "Rename",
                }
            )

            set_keymap(
                "n",
                "<leader>la",
                function()
                    vim.lsp.inlay_hint.enable(
                        not vim.lsp.inlay_hint.is_enabled()
                    )
                end,
                {
                    silent = true,
                    desc = "Show argument names",
                }
            )

            set_keymap(
                "n",
                "<leader>ld",
                "<CMD>FzfLua lsp_definitions<CR>",
                {
                    silent = true,
                    desc = "Go to definitions",
                }
            )

            set_keymap(
                "n",
                "<leader>lr",
                "<CMD>FzfLua lsp_references<CR>",
                {
                    silent = true,
                    desc = "Go to references",
                }
            )

            set_keymap(
                "n",
                "<leader>lld",
                "<CMD>FzfLua diagnostics_workspace<CR>",
                {
                    silent = true,
                    desc = "List diagnostics for all buffers",
                }
            )
        end,
    }
)
