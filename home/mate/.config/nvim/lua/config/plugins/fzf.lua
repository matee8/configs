return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    opts = {
        "default-title",
        defaults = {
            formatter = "path.dirname_first",
        },
        files = {
            cwd_prompt = false,
        },
    },
    keys = {
        {
            "<leader>ff",
            "<CMD>FzfLua files<CR>",
            desc = "Fuzzy find files",
            silent = true,
        },
        {
            "<leader>fs",
            "<CMD>FzfLua grep_project<CR>",
            desc = "Fuzzy grep over files in project",
            silent = true,
        },
    },
}
