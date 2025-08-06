{
    config,
    pkgs,
    ...
}:
{
    programs.neovim =
        let
            toLua = str: "lua << EOF\n${str}\nEOF\n";
            toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
        in
        {
            enable = true;

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;
            defaultEditor = true;

            extraPackages = with pkgs; [
                vscode-langservers-extracted
                typescript-language-server
                pyright
                rustup
                clang
            ];

            plugins = with pkgs.vimPlugins; [
                {
                    plugin = mini-files;
                    config = toLuaFile ./nvim/plugins/files.lua;
                }

                {
                    plugin = gitsigns-nvim;
                    config = toLuaFile ./nvim/plugins/gitsigns.lua;
                }

                {
                    plugin = fzf-lua;
                    config = toLuaFile ./nvim/plugins/fzf.lua;
                }

                {
                    plugin = (
                        nvim-treesitter.withPlugins (p: [
                            p.tree-sitter-bash
                            p.tree-sitter-c
                            p.tree-sitter-css
                            p.tree-sitter-html
                            p.tree-sitter-javascript
                            p.tree-sitter-lua
                            p.tree-sitter-markdown
                            p.tree-sitter-markdown_inline
                            p.tree-sitter-nix
                            p.tree-sitter-printf
                            p.tree-sitter-python
                            p.tree-sitter-query
                            p.tree-sitter-rust
                            p.tree-sitter-sql
                            p.tree-sitter-vimdoc
                        ])
                    );
                    config = toLuaFile ./nvim/plugins/treesitter.lua;
                }
            ];

            extraLuaConfig = ''
                ${builtins.readFile ./nvim/config/options.lua}
                ${builtins.readFile ./nvim/config/lsp.lua}
                ${builtins.readFile ./nvim/config/diagnostic.lua}
                ${builtins.readFile ./nvim/config/keymaps.lua}
                ${builtins.readFile ./nvim/config/misc.lua}
            '';
        };
}
