return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        on_attach = function(
            bufnr
        )
            if
                vim.api
                    .nvim_buf_get_name(
                        bufnr
                    )
                    :match(
                        "%.ipynb$"
                    )
            then
                return false
            end
        end,
    },
}
