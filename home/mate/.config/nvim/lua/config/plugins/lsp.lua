local servers = {
    clangd = {
        cmd = {
            "clangd",
            "--offset-encoding=utf-16",
            "--header-insertion=never",
        },
    },
    pyright = {},
    html = {},
    cssls = {},
    ts_ls = {},
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
                checkOnSave = {
                    allTargets = false,
                },
            },
        },
    },
}

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "williamboman/mason.nvim",
            run = { "<CMD>MasonUpdate<CR>" },
            config = function()
                require("mason").setup({
                    ui = {
                        border = "rounded",
                    },
                })
            end,
        },
    },
    ft = {
        "c",
        "cpp",
        "python",
        "bash",
        "html",
        "css",
        "javascript",
        "typescript",
        "rust",
    },
    cmd = { "Mason" },
    opts = {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
            function(server)
                local opts = servers[server] or {}
                opts.capabilities =
                    require("cmp_nvim_lsp").default_capabilities()
                require("lspconfig")[server].setup(opts)
            end,
        },
    },
}
