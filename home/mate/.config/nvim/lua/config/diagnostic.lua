vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.lsp.handlers["textDocument/hover"] =
            vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

        vim.diagnostic.config({
            underline = false,
            update_in_insert = false,
            virtual_text = false,
            severity_sort = true,
            float = {
                border = "rounded",
            },
        })
    end,
})
