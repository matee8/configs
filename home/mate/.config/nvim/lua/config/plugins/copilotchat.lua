return {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    dependencies = {
        "github/copilot.vim",
    },
    opts = {
        model = "claude-3.5-sonnet",
        agent = "copilot",
        temperature = 1.0,
        window = {
            width = 0.3,
            height = 0.5,
        },
        show_help = false,
        mappings = {
            close = {
                insert = "<C-q>",
            },
            reset = {
                insert = "<C-r>",
                normal = "<C-r>",
            },
            accept_diff = {
                normal = "<C-f>",
                insert = "<C-f>",
            },
        },
        highlight_headers = false,
        separator = "---",
        error_header = "> [!ERROR] Error",
    },
}
