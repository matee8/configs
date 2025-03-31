vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("UserTextYankPost", { clear = true }),
    pattern = "*",
    command = "silent! lua vim.highlight.on_yank({ timeout =  500 })",
})
