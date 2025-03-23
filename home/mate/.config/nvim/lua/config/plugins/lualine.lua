return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "letieu/harpoon-lualine",
    },
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                "mode",
            },
            lualine_b = {
                "diagnostics",
            },
            lualine_c = {
                "harpoon2",
            },
            lualine_x = {
                "diff",
            },
            lualine_y = {
                "branch",
            },
            lualine_z = {
                "filename",
            },
        },
    },
}
