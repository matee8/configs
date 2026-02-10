MiniDeps.now(function()
    MiniDeps.add({
        source = "nvim-treesitter/nvim-treesitter",
        hooks = {
            post_checkout = function()
                vim.cmd("TSUpdate")
            end,
        },
    })

    require("nvim-treesitter").install(
        {
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
        }
    )

    vim.api.nvim_create_autocmd('FileType', {
        pattern = {
            'bash',
            'c',
            'css',
            'html',
            'javascript',
            'typescript',
            'jsx',
            'lua',
            'markdown',
            'python',
            'rust',
            'sql'
        },
        callback = function()
            vim.treesitter.start()
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo.foldmethod = 'expr'
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
end)
