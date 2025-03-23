return {
    "hrsh7th/nvim-cmp",
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
    },
    opts = function()
        local cmp = require("cmp")

        return {
            completion = {
                completeopt = "menu,menu,noinsert",
            },
            preselect = cmp.PreselectMode.Item,
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-d>"] = cmp.mapping.abort(),
                ["<C-K>"] = cmp.mapping.select_prev_item(),
                ["<C-J>"] = cmp.mapping.select_next_item(),
                ["<A-k>"] = cmp.mapping.scroll_docs(-4),
                ["<A-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-f>"] = cmp.mapping.confirm({
                    select = false,
                }),
            }),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                },
                {
                    name = "nvim_lsp_signature_help",
                },
                {
                    name = "buffer",
                },
                {
                    name = "path",
                },
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = function(entry, vim_item)
                    vim_item.menu = nil
                    return vim_item
                end,
            },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")

        cmp.setup.cmdline({
            "/",
            "?",
        }, {
            mapping = cmp.mapping.preset.cmdline({
                ["<C-k>"] = {
                    c = cmp.mapping.select_prev_item(),
                },
                ["<C-j>"] = {
                    c = cmp.mapping.select_next_item(),
                },
                ["<C-f>"] = {
                    c = cmp.mapping.confirm({
                        select = false,
                    }),
                },
            }),
            sources = {
                {
                    name = "buffer",
                },
            },
            window = {
                completion = cmp.config.window.bordered(),
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline({
                ["<C-k>"] = {
                    c = cmp.mapping.select_prev_item(),
                },
                ["<C-j>"] = {
                    c = cmp.mapping.select_next_item(),
                },
                ["<C-f>"] = {
                    c = cmp.mapping.confirm({
                        select = false,
                    }),
                },
            }),
            sources = {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = {},
                    },
                },
                {
                    name = "path",
                },
            },
            window = {
                completion = cmp.config.window.bordered(),
            },
        })

        cmp.setup.cmdline("!", {
            sources = {
                {
                    name = "path",
                },
            },
            window = {
                completion = cmp.config.window.bordered(),
            },
        })

        cmp.setup(opts)
    end,
}
