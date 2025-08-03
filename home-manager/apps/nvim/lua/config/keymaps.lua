local set_keymap = vim.keymap.set

set_keymap(
    {
        "i",
        "t",
    },
    "<C-c>",
    "<Esc>",
    {
        silent = true,
    }
)

set_keymap("i", "<C-h>", "<Left>", {
    silent = true,
})
set_keymap("i", "<C-j>", "<Down>", {
    silent = true,
})
set_keymap("i", "<C-k>", "<Up>", {
    silent = true,
})
set_keymap("i", "<C-l>", "<Right>", {
    silent = true,
})

set_keymap("n", ";", ":", {
    silent = true,
})

set_keymap("n", "n", "nzz", {
    silent = true,
})
set_keymap("n", "N", "Nzz", {
    silent = true,
})

set_keymap("x", "<leader>p", [['_dP]], {
    silent = true,
    desc = "Paste without yank",
})

set_keymap("n", "<leader>d", '"_dd', {
    silent = true,
    desc = "Delete without yank",
})

set_keymap("n", "<leader>ee", function() MiniFiles.open() end, {
    silent = true,
    desc = "Open file browser",
})

set_keymap("i", "<C-f>", "<C-y>", {
    silent = true,
})

set_keymap("i", "<C-Space>", "<Nop>", {
    silent = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        set_keymap("n", "<leader>la", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, {
            silent = true,
            desc = "Show argument names",
        })

        set_keymap("n", "<leader>ld", "<CMD>FzfLua diagnostics_workspace<Cr>", {
            silent = true,
            desc = "List diagnostics for all buffers",
        })
    end,
})
