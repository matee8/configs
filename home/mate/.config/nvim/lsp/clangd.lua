return {
    cmd = { "clangd", "--background-index" },
    root_markers = {
        ".clangd",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
    },
    filetypes = { "c", "cpp" },
    flags = {
        debounce_text_changes = 20,
    },
    capabilites = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = {
            "utf-8",
            "utf-16",
        },
        headerInsertion = "never",
    },
}
