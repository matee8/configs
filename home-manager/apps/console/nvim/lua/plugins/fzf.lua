return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    opts = {
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
            "<Cmd>FzfLua git_files<Cr>",
            desc = "Fuzzy find files",
            silent = true,
        },
        {
            "<leader>fs",
            "<Cmd>FzfLua grep_project<Cr>",
            desc = "Fuzzy grep over files in project",
            silent = true,
        },
    },
}
