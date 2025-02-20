return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = {
        cmd = {'/home/mate/.local/share/nvim/mason/bin/jdtls'},
        root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    },
    config = function(_, opts)
        require("jdtls").start_or_attach(opts)
    end,
}
