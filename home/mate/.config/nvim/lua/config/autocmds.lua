local create_autocmd =
    vim.api.nvim_create_autocmd

create_autocmd(
    "TextYankPost",
    {
        pattern = "*",
        command = "silent! lua vim.highlight.on_yank({ timeout =  500 })",
    }
)

create_autocmd(
    "LspAttach",
    {
        callback = function(
            opts
        )
            local orig_util_open_floating_preview =
                vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(
                contents,
                syntax,
                opts,
                ...
            )
                opts = opts
                    or {}
                opts.max_width = opts.max_width
                    or 80
                opts.max_height = opts.max_height
                    or 15
                return orig_util_open_floating_preview(
                    contents,
                    syntax,
                    opts,
                    ...
                )
            end

            if
                vim.bo[opts.buf].filetype
                == "markdown"
            then
                require(
                    "otter"
                ).activate()
            end
        end,
    }
)
