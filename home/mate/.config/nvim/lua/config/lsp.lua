vim.lsp.enable({
    "clangd",
    "css",
    "html",
    "jdtls",
    "pyright",
    "rust-analyzer",
    "tsls",
    "texlab",
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf
            )
        end
    end,
})
