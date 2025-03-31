return {
    cmd = { "rust-analyzer" },
    filetypes = {
        "rust",
    },
    root_dir = function(buf, cb)
        local root = vim.fs.root(buf, { "Cargo.toml" })
        if root then
            vim.system(
                { "cargo", "metadata", "--no-deps", "--format-version", "1" },
                { cwd = root, text = true },
                function(out)
                    if out.code ~= 0 then
                        cb(root)
                        return
                    end

                    local success, result = pcall(vim.json.decode, out.stdout)
                    if success and type(result) == "table" then
                        cb(result.workspace_root)
                    else
                        cb(root)
                    end
                end
            )
        else
            cb(nil)
        end
    end,
    settings = {
        autoformat = true,
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
}
