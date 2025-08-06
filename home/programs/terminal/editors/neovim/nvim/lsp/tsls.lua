return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript" },
    root_markers = {
        "pnpm-lock.yaml",
        "tsconfig.json",
        "package.json",
    },
}
