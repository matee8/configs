require("fzf-lua").setup({
    defaults = {
        formatter = "path.dirname_first",
    },
    files = {
        cwd_prompt = false,
    },
})
