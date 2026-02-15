local set_keymap = vim.keymap.set

set_keymap(
    {
        "i",
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

set_keymap("n", "<leader>ee", function()
    MiniFiles.open()
end, {
    silent = true,
    desc = "Open file browser",
})

set_keymap("i", "<C-Space>", "<Nop>", {
    silent = true,
})

set_keymap("n", "<leader>ff", function()
    MiniPick.builtin.files()
end, {
    silent = true,
})

set_keymap("n", "<leader>fs", function()
    MiniPick.builtin.grep_live()
end, {
    silent = true,
})

set_keymap("n", "<leader>tt", "<cmd>tab term<cr>", {
    silent = true,
})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
