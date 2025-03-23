vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.diagnostic.config({
            update_in_insert = false,
            severity_sort = true,
            underline = true,
            virtual_text = {
                prefix = "●",
                source = "if_many",
                spacing = 4,
            },
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
})
