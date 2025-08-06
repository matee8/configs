vim.lsp.enable({
    "clangd",
    "css",
    "html",
    "pyright",
    "rust-analyzer",
    "tsls",
    "texlab"
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspAttach", { clear = false }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            client.server_capabilities.completionProvider.triggerCharacters =
                vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                { autotrigger = true }
            )
        end
    end,
})
