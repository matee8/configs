return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
    },
    opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", {
            link = "Comment",
            default = true,
        })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()

        cmp.setup.cmdline(":", {
            sources = { { name = "cmdline", name = "path" } },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            sources = { { name = "buffer" } },
        })

        cmp.setup.cmdline("!", {
            sources = { { name = "path" } },
        })

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
                ["<C-K>"] = cmp.mapping.select_prev_item(),
                ["<C-J>"] = cmp.mapping.select_next_item(),
                ["<A-k>"] = cmp.mapping.scroll_docs(-4),
                ["<A-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-f>"] = cmp.mapping.confirm({
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "buffer" },
                { name = "path" },
            }),
            window = {
                completion = require("cmp").config.window.bordered(),
                documentation = require("cmp").config.window.bordered(),
            },
            sorting = defaults.sorting,
            formatting = {
                format = function(entry, vim_item)
                    vim_item.menu = nil
                    return vim_item
                end,
            },
        }
    end,
}
