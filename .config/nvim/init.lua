local servers = {
    clangd = {
        cmd = {
            'clangd', '--offset-encoding=utf-16', '--header-insertion=never' 
        } 
    },
    pyright = {},
    html = {},
    cssls = {},
    ts_ls = {},
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true
                },
                checkOnSave = {
                    allTargets = false
                }
            }
        }
    }
} 

-- Cursorline
vim.o.cursorline = true

-- Center cursorline
vim.o.scrolloff = 30

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- Border column
vim.o.colorcolumn = '80'

-- Command line
vim.o.cmdheight = 0

-- Update time
vim.o.updatetime = 250
vim.o.timeoutlen = 250

-- No word wrap
vim.wo.wrap = false
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99

-- System clipboard
vim.o.clipboard = 'unnamedplus'

-- Infinite undo
vim.opt.undofile = true

-- Disable mouse
vim.o.mouse = ''

-- Disable swap files
vim.opt.swapfile = false
vim.opt.backup = false

-- Appearance 
vim.g.netrw_banner = 0
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.signcolumn = 'yes'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.background = 'dark'

-- Beeping
vim.opt.vb = true

-- Diffs
vim.opt.diffopt:append('iwhite')
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')

-- Leader
vim.g.mapleader = ' '

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    command = 'silent! lua vim.highlight.on_yank({ timeout =  500 })'
})

-- General keymaps
vim.keymap.set('i', '<Up>', '')
vim.keymap.set('i', '<Down>', '')
vim.keymap.set('i', '<Right>', '')
vim.keymap.set('i', '<Left>', '')
vim.keymap.set('n', '<Up>', '')
vim.keymap.set('n', '<Down>', '')
vim.keymap.set('n', '<Right>', '')
vim.keymap.set('n', '<Left>', '')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>')
vim.keymap.set('t', '<C-c>', '<C-\\><C-n><CMD>buffer #<CR><CMD>bd! term*<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CMD>buffer #<CR><CMD>bd! term*<CR>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('v', 'J', ':m "<+1<CR>gv=gv', {
    silent = true, 
    desc = 'Move selected line down in visual mode' 
})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {
    silent = true,
    desc = 'Move selected line up in visual mode' 
})

vim.keymap.set('v', 'L', '<CMD>s/^/ /g<CR>gv')
vim.keymap.set('v', 'H', '<CMD>s/^ //g<CR>gv')

vim.keymap.set('x', '<leader>p', [['_dP]], {
    silent = true, 
    desc = 'Paste without yank' 
})
vim.keymap.set('n', '<leader>d', '"_dd', {
    silent = true, 
    desc = 'Paste without yank' 
})
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })

-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.keymap.set('n', '<leader>h', function()
            vim.lsp.buf.hover({focusable = false})
        end, {
            silent = true,
            desc = 'Open LSP docs'
        })
        vim.keymap.set('n', '<leader>q', 
            function() 
                if vim.api.nvim_get_current_win() ~= 1000 then
                    vim.api.nvim_win_close(vim.api.nvim_get_current_win(), {}) 
                end
            end, {
                silent = true,
                desc = 'Close LSP docs'
        })
        vim.keymap.set('n', '<leader>lf', function() 
                vim.lsp.buf.format({ async = true })
            end, {
            silent = true, 
            desc = 'Format file' 
        })
        vim.keymap.set('n', '<leader>lqf', vim.lsp.buf.code_action, {
                silent = true,
                desc = 'Quick fixes'
        })
        vim.keymap.set('n', '<leader>ld', 
            function() require('telescope.builtin').lsp_definitions() end, {
                silent = true,
                desc = 'Go to definitions'
        })
        vim.keymap.set('n', '<leader>lr', 
            function() require('telescope.builtin').lsp_references() end, {
                silent = true,
                desc = 'Go to references'
        })
        vim.keymap.set('n', '<leader>lt', 
            function() require('telescope.builtin').lsp_type_definitions() end, {
                silent = true,
                desc = 'Go to type definitions'
        })
        vim.keymap.set('n', '<leader>lld',
            function() require('telescope.builtin').diagnostics() end, {
                silent = true,
                desc = 'List diagnostics for all buffers'
        })
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, {
            silent = true,
            desc = 'Rename'
        })
        vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, {
            silent = true,
            desc = 'Show diagnostic for line'
        })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
            silent = true,
        })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
            silent = true,
        })
        vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, {
            silent = true,
        })
        vim.keymap.set('n', '<leader>lsh', vim.lsp.buf.signature_help, {
            silent = true
        })
        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, {
            silent = true
        })
    end,
})

-- Plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require('lazy').setup(
    {
        {
            'nvim-lua/plenary.nvim'
        },
        { 
            { 
                'catppuccin/nvim', 
                as = 'catppuccin', 
                lazy = false, 
                priority = 10000,
                config = function()
                    require('catppuccin').setup({
                        flavour = 'mocha',
                        transparent_background = true,
                        show_end_of_buffer = false,
                        term_colors = true,
                        integrations = {
                            mason = true,
                            native_lsp = {
                                enabled = true,
                                virtual_text = {
                                    errors = { 'italic' },
                                    hints = { 'italic' },
                                    warnings = { 'italic' },
                                    information = { 'italic' }
                                },
                                underlines = {
                                    errors = { 'underline' },
                                    hints = { 'underline' },
                                    warnings = { 'underline' },
                                    information = { 'underline' }
                                },
                                inlay_hints = {
                                    background = true
                                }
                            },
                            cmp = true,
                            telescope = {
                                enabled = true
                            },
                            harpoon = true,
                        },
                        custom_highlights = function(colors)
                            return {
                                WinSeparator = { fg = '#1e1e2e' }
                            }
                        end
                    })
                    vim.cmd.colorscheme('catppuccin')
                end
            },
            { 
                'nvim-lualine/lualine.nvim',
                lazy = false,
                config = function()
                    require('lualine').setup({
                        options = {
                            theme = 'catppuccin',
                            globalstatus = true
                        }
                    })
                end
            },
            { 
                'nvim-treesitter/nvim-treesitter', 
                event = 'VeryLazy',
                run = ':TSUpdate',
                config = function()
                    require('nvim-treesitter.configs').setup {
                        ensure_installed = {
                            'c',
                            'lua',
                            'vim',
                            'vimdoc',
                            'query',
                            'javascript',
                            'python',
                            'bash',
                            'html',
                            'css',
                            'sql',
                            'rust'
                        },
                        sync_install = false,
                        auto_install = true,
                        indent = { enable = true },
                        autotag = { enable = true },
                        highlight = {
                            enable = true,
                            additional_vim_regex_highlighting = false
                        },
                    }
                end
            },
            { 
                'lukas-reineke/indent-blankline.nvim', 
                event = 'VeryLazy',
                config = function()
                    require('ibl').setup({
                        indent = { char = '.' },
                        scope = { enabled = false }
                    })
                end
            },
            { 
                'shortcuts/no-neck-pain.nvim',
                lazy = false,
                config = function()
                    require('no-neck-pain').setup({
                        width = 90,
                        autocmds = {
                            enableOnVimEnter = true,
                            skipEnteringNoNeckPainBuffer = true
                        },
                        buffers = {
                            right = {
                                enabled = false
                            }
                        }
                    })

                    vim.keymap.set('n', '<leader>zz', '<CMD>NoNeckPain<CR>', {
                        silent = true,
                        desc = 'Zen mode'
                    })
                end
            }
        },
        {
            'williamboman/mason-lspconfig.nvim',
            dependencies = {
                'neovim/nvim-lspconfig',
                { 
                    'williamboman/mason.nvim',
                    config = function()
                        require('mason').setup({ ui = { border = 'rounded' } })
                    end
                }
            },
            ft = {'c', 'cpp', 'cs', 'python', 'bash', 'html', 'css', 
                'javascript', 'typescript', 'rust', 'go', 'php'},
            config = function()
                require('mason-lspconfig').setup({ 
                    ensure_installed = vim.tbl_keys(servers),
                    handlers = { function(server)
                        local opts = servers[server] or {}
                        opts.capabilities = require('cmp_nvim_lsp').default_capabilities()
                        require('lspconfig')[server].setup(opts)
                    end }
                })
            end
        },
        { 
            'hrsh7th/nvim-cmp',
            event = { 'InsertEnter', 'CmdlineEnter' },
            dependencies = {
                'L3MON4D3/LuaSnip',
                'hrsh7th/cmp-nvim-lsp',
                'dcampos/cmp-emmet-vim',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-path'
            },
            config = function() 
                require('cmp').setup({
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end
                    },
                    sources = {
                        { name = 'nvim_lsp' },
                        { name = 'nvim_lsp_signature_help' },
                        { name = 'emmet_vim', option = { filetypes = { 'html', 'css', 'php' } } },
                        { name = 'vim-dadbod-completion' },
                        { name = 'luasnip' },
                        { name = 'buffer' },
                        { name = 'path' }
                    },
                    mapping = {
                        ['<C-K>'] = require('cmp').mapping.select_prev_item(),
                        ['<C-J>'] = require('cmp').mapping.select_next_item(),
                        ['<C-f>'] = require('cmp').mapping.confirm({select = true}),
                        ['<C-e>'] = require('cmp').mapping.abort(),
                        ['<A-K>'] = require('cmp').mapping.scroll_docs(-4),
                        ['<A-J>'] = require('cmp').mapping.scroll_docs(4)
                    },
                    window = {
                        completion = require('cmp').config.window.bordered(),
                        documentation = require('cmp').config.window.bordered()
                    },
                    formatting = {
                        format = function(entry, vim_item)
                            vim_item.menu = nil
                            return vim_item
                        end
                    }
                })

                require('cmp').setup.cmdline(':', {
                    sources = {{name = 'cmdline', name = 'path'}},
                })

                require('cmp').setup.cmdline({'/', '?'}, {
                    sources = {{name = 'buffer'}},
                })

                require('cmp').setup.cmdline('!', {
                    sources = {{name = 'path'}},
                })

                vim.o.pumheight = 10
                vim.o.pumwidth = 30
            end
        },
        {
            { 
                'nvim-telescope/telescope.nvim', 
                lazy = false,
                dependencies = { 
                    'nvim-telescope/telescope-file-browser.nvim',
                    'nvim-tree/nvim-web-devicons', 
                },
                config = function()
                    require('telescope').setup({
                        extensions = {
                            file_browser = {
                                hijack_netrw = true
                            }
                        }
                    })

                    require('telescope').load_extension('file_browser')

                    vim.keymap.set('n', '<leader>ee', 
                        function() require('telescope').extensions.file_browser.file_browser() end, {
                            silent = true,
                            desc = 'Open file browser'
                    })
                    vim.keymap.set('n', '<leader>ff',
                        function() require('telescope.builtin').find_files() end, {
                            silent = true,
                            desc = 'Fuzzy find files in current directory'
                    })
                    vim.keymap.set('n', '<leader>fs', 
                        function() require('telescope.builtin').live_grep() end, {
                            desc = 'Fuzzy find string in current directory'
                    })
                    vim.keymap.set('n', '<leader>fc', 
                        function() require('telescope.builtin').grep_string() end, {
                            silent = true,
                            desc = 'Fuzzy find string under cursor in current directory'
                    })
                end
            },
            { 
                'ThePrimeagen/harpoon', 
                event = 'VeryLazy',
                ft = {'c', 'cpp', 'cs', 'python', 'bash', 'html', 'css', 
                    'javascript', 'typescript', 'rust', 'go', 'php'},
                config = function()
                    require('harpoon').setup({
                        global_settings = {
                            save_on_toggle = true
                        }
                    })

                    vim.keymap.set('n', '<leader>ha', 
                        function() require('harpoon.mark').add_file() end, {
                            silent = true,
                            desc = 'Mark file to harpoon'
                        })
                    vim.keymap.set('n', '<leader>hm', 
                        function() require('harpoon.ui').toggle_quick_menu() end, {
                            silent = true,
                            desc = 'Show harpoon marked files' 
                        })
                    vim.keymap.set('n', '<A-1>', function() require('harpoon.ui').nav_file(1) end, {
                        silent = true,
                        desc = 'Go to harpoon 1' 
                    })
                    vim.keymap.set('n', '<A-2>', function() require('harpoon.ui').nav_file(2) end, {
                        silent = true,
                        desc = 'Go to harpoon 2' 
                    })
                    vim.keymap.set('n', '<A-3>', function() require('harpoon.ui').nav_file(3) end, {
                        silent = true,
                        desc = 'Go to harpoon 3' 
                    })
                    vim.keymap.set('n', '<A-4>', function() require('harpoon.ui').nav_file(4) end, {
                        silent = true,
                        desc = 'Go to harpoon 4' 
                    })
                    vim.keymap.set('n', '<A-5>', function() require('harpoon.ui').nav_file(5) end, {
                        silent = true,
                        desc = 'Go to harpoon 5' 
                    })
                    vim.keymap.set('n', '<A-6>', function() require('harpoon.ui').nav_file(6) end, {
                        silent = true,
                        desc = 'Go to harpoon 6' 
                    })
                    vim.keymap.set('n', '<A-7>', function() require('harpoon.ui').nav_file(7) end, {
                        silent = true,
                        desc = 'Go to harpoon 7' 
                    })
                    vim.keymap.set('n', '<A-8>', function() require('harpoon.ui').nav_file(8) end, {
                        silent = true,
                        desc = 'Go to harpoon 8' 
                    })
                    vim.keymap.set('n', '<A-9>', function() require('harpoon.ui').nav_file(9) end, {
                        silent = true,
                        desc = 'Go to harpoon 9' 
                    })
                end
            }
        },
        {
            { 
                'windwp/nvim-autopairs', 
                event = 'InsertEnter',
                config = function()
                    require('nvim-autopairs').setup()
                end
            },
            { 
                'lewis6991/gitsigns.nvim',
                event = 'VeryLazy',
                config = function()
                    require('gitsigns').setup({
                        auto_attach = true
                    })
                end
            }
        },
    },
    {
        ui = { border = 'rounded' }
    }
)

-- Fix LSP floating window
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function() 
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.max_width = opts.max_width or 80
            opts.max_height = opts.max_height or 15
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        local i = 0

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'rounded'
        })

        vim.diagnostic.config({
            virtual_text = false,
            update_in_insert = true,
            float = { border = 'rounded' }
        })
    end
})

-- Code runner
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(opts)
        if vim.bo[opts.buf].filetype == 'c' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal clang -std=c23' .. 
                ' -O3 -Werror -Wall -Wextra -Wpedantic % && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙱 '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!clang-format -i %<CR>', {
                    silent = true,
                    desc = 'Run clang-format'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal clang-tidy *.c<CR>', {
                    silent = true,
                    desc = 'Run clang-tidy'
            })
        elseif vim.bo[opts.buf].filetype == 'cpp' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal clang++ -O2 -DNDEBUG -pedantic-errors -Wall' ..
                ' -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror' ..
                ' -std=c++23 && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙲 '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!clang-format -i %<CR>', {
                    silent = true,
                    desc = 'Run clang-format'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal clang-tidy *.cpp<CR>', {
                    silent = true,
                    desc = 'Run clang-tidy'
            })
        elseif vim.bo[opts.buf].filetype == 'cs' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal dotnet run<CR>', {
                    silent = true,
                    desc = 'Run 󰌛 '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!dotnet format<CR>', {
                    silent = true,
                    desc = 'Run formatter'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal dotnet csharpier .<CR>', {
                    silent = true,
                    desc = 'Run linter'
            })
        elseif vim.bo[opts.buf].filetype == 'java' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal java %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!mvn spotless:apply', {
                    silent = true,
                    desc = 'Run formatter'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal mvn spotbugs:check', {
                    silent = true,
                    desc = 'Run linter'
            })
        elseif vim.bo[opts.buf].filetype == 'python' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal python3 %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal pylint %<CR>', {
                    silent = true,
                    desc = 'Run pylint'
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!yapf --style google -i %<CR>', {
                    silent = true,
                    desc = 'Run yapf'
            })
        elseif vim.bo[opts.buf].filetype == 'sh' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>!chmod u+x %<CR><CMD>terminal ./%<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'go' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal go run ./...<CR>', {
                    silent = true,
                    desc = 'Run 󰟓  '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!gofmt -w %<CR>', {
                    silent = true,
                    desc = 'Run formatter'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal staticcheck ./..<CR>', {
                    silent = true,
                    desc = 'Run staticcheck'
            })
            vim.keymap.set('n', '<leader>rv',
                '<CMD>terminal go vet ./...<CR>', {
                    silent = true,
                    desc = 'Run go vetter'
            })
        elseif vim.bo[opts.buf].filetype == 'rust' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal cargo run<CR>', {
                    silent = true,
                    desc = 'Run 󱘗  '
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal cargo clippy<CR>', {
                    silent = true,
                    desc = 'Run clippy'
            })
            vim.keymap.set('n', '<leader>rt',
                '<CMD>terminal cargo test<CR>', {
                    silent = true,
                    desc = 'Run tests'
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!cargo +nightly fmt<CR>', {
                    silent = true,
                    desc = 'Run formatter'
            })
        elseif vim.bo[opts.buf].filetype == 'zig' then
            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 0
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal zig run %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>terminal zig fmt %<CR>', {
                    silent = true,
                    desc = 'Run formatter'
                })
        elseif vim.bo[opts.buf].filetype == 'javascript' then
            vim.keymap.set('n', '<leader>rr',
                '<CMD>terminal node %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
            vim.keymap.set('n', '<leader>rf',
                "<CMD>!prettier --write '**/*.js'<CR>", {
                    silent = true,
                    desc = 'Run prettier'
            })
            vim.keymap.set('n', '<leader>re',
                '<CMD>terminal npx eslint src/<CR>', {
                    silent = true,
                    desc = 'Run eslint'
            })
        elseif vim.bo[opts.buf].filetype == 'haskell' then
            vim.keymap.set('n', '<leader>rr',
                '<CMD>terminal ghci<CR>i:l ' .. vim.fn.expand('%') .. '<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
            vim.keymap.set('n', '<leader>rf',
                '<CMD>!ormolu --mode inplace *.hs<CR>', {
                    silent = true,
                    desc = 'Run ormolu'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal hlint *.hs<CR>', {
                    silent = true,
                    desc = 'Run hlint'
            })
        end
    end
})
