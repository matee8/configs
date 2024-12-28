local servers = {
    clangd = {
        cmd = {
            'clangd', '--offset-encoding=utf-16', '--header-insertion=never' ,
        },
    },
    pyright = {},
    html = {},
    cssls = {},
    ts_ls = {},
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                cargo = {
                    allFeatures = true,
                },
                checkOnSave = {
                    allTargets = false,
                },
            },
        },
    },
}

-- Cursorline
vim.o.cursorline = true

-- Center cursorline
vim.o.scrolloff = 30
vim.o.sidescrolloff = 30

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.shiftround = true
vim.o.smartindent = true

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
vim.o.clipboard = vim.env.SSH_TTY and "" or 'unnamedplus'

-- Infinite undo
vim.opt.undofile = true

-- Disable mouse
vim.o.mouse = ''

-- Disable swap files
vim.o.swapfile = false
vim.o.backup = false

-- Appearance 
vim.o.list = true
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.signcolumn = 'yes'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.hlsearch = false
vim.o.background = 'dark'
vim.o.pumheight = 10
vim.o.pumwidth = 30

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
    command = 'silent! lua vim.highlight.on_yank({ timeout =  500 })',
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
vim.keymap.set('n', ';', ':', { silent = true })
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>')
vim.keymap.set('t', '<C-c>', '<C-\\><C-n><CMD>buffer #<CR><CMD>bd! term*<CR>', {
    desc = "Close and kill terminal buffer",
    silent = true,
})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CMD>buffer #<CR><CMD>bd! term*<CR>', {
    desc = "Close and kill terminal buffer",
    silent = true,
})

vim.keymap.set('v', 'J', ':m "<+1<CR>gv=gv', {
    silent = true, 
    desc = 'Move selected line down in visual mode',
})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {
    silent = true,
    desc = 'Move selected line up in visual mode',
})

vim.keymap.set('x', '<leader>p', [['_dP]], {
    silent = true, 
    desc = 'Paste without yank',
})
vim.keymap.set('n', '<leader>d', '"_dd', {
    silent = true, 
    desc = 'Paste without yank' ,
})
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })

-- Open file explorer
vim.keymap.set('n', '<leader>ee', function()
        require('oil').open_float()
    end, {
    silent = true,
    desc = 'Open file browser'
})

-- Close floating window
vim.keymap.set('n', '<leader>q', function() 
        if vim.api.nvim_get_current_win() ~= 1000 then
            vim.api.nvim_win_close(vim.api.nvim_get_current_win(), {}) 
        end
    end, {
        silent = true,
        desc = 'Close LSP docs',
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        -- LSP Keymaps
        vim.keymap.set('n', '<leader>h', function()
            vim.lsp.buf.hover({ focusable = false })
        end, {
            silent = true,
            desc = 'Open LSP docs',
        })
        vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, {
            silent = true,
            desc = 'Show diagnostic for line',
        })
        vim.keymap.set('n', '<leader>lf', function() 
                vim.lsp.buf.format({ async = true })
            end, {
            silent = true, 
            desc = 'Format file',
        })
        vim.keymap.set('n', '<leader>ld', '<CMD>FzfLua lsp_definitions<CR>', {
                silent = true,
                desc = 'Go to definitions',
        })
        vim.keymap.set('n', '<leader>lr', '<CMD>FzfLua lsp_references<CR>', {
                silent = true,
                desc = 'Go to references',
        })
        vim.keymap.set('n', '<leader>lld', 
            '<CMD>FzfLua diagnostics_workspace<CR>', {
                    silent = true,
                    desc = 'List diagnostics for all buffers',
        })
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, {
            silent = true,
            desc = 'Rename',
        })

        -- Fix LSP floating window
        local orig_util_open_floating_preview = 
            vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, 
            opts, ...)
            opts = opts or {}
            opts.max_width = opts.max_width or 80
            opts.max_height = opts.max_height or 15
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        -- Diagnostic
        vim.lsp.handlers['textDocument/hover'] = 
            vim.lsp.with(vim.lsp.handlers.hover, {
                border = 'rounded',
            })


        vim.diagnostic.config({
            virtual_text = false,
            update_in_insert = true,
            underline = false,
            float = { border = 'rounded' }
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
            {
                'nvim-lua/plenary.nvim',
                lazy = false,
            },
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
                            cmp = true,
                            fzf = true,
                            harpoon = true,
                            native_lsp = {
                                enabled = true,
                            }
                        },
                    })
                end,
            },
            {
                'echasnovski/mini.icons',
                lazy = false,
                opts = {
                    style = 'glyph',
                },
            },
            { 
                'nvim-lualine/lualine.nvim',
                lazy = false,
                opts = {
                    options = {
                        theme = 'auto',
                        globalstatus = true,
                    },
                },
            },
        },
        {
            {
                'williamboman/mason-lspconfig.nvim',
                dependencies = {
                    'neovim/nvim-lspconfig',
                    { 
                        'williamboman/mason.nvim',
                        run = { '<CMD>MasonUpdate<CR>' },
                        config = function()
                            require('mason').setup({ 
                                ui = { 
                                    border = 'rounded',
                                },
                            })
                        end
                    }
                },
                ft = {
                    'c', 
                    'cpp', 
                    'python', 
                    'bash', 
                    'html', 
                    'css', 
                    'javascript', 
                    'typescript', 
                    'rust', 
                },
                cmd = { 'Mason' },
                opts = {
                    ensure_installed = vim.tbl_keys(servers),
                    handlers = { 
                        function(server)
                            local opts = servers[server] or {}
                            opts.capabilities = 
                                require('cmp_nvim_lsp').default_capabilities()
                            require('lspconfig')[server].setup(opts)
                        end,
                    },
                }
            },
            { 
                'nvim-treesitter/nvim-treesitter', 
                event = 'VeryLazy',
                build = '<CMD>TSUpdate<CR>',
                opts = {
                    ensure_installed = {
                        'c',
                        'printf',
                        'lua',
                        'vimdoc',
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
                    highlight = { 
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                },
            },
            { 
                'hrsh7th/nvim-cmp',
                event = { 'InsertEnter', 'CmdlineEnter' },
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-cmdline',
                    'hrsh7th/cmp-path',
                },
                opts = function() 
                    local cmp = require('cmp')
                    local defaults = require('cmp.config.default')()

                    cmp.setup.cmdline(':', {
                        sources = { { name = 'cmdline', name = 'path' } },
                    })

                    cmp.setup.cmdline({'/', '?'}, {
                        sources = { { name = 'buffer' } },
                    })

                    cmp.setup.cmdline('!', {
                        sources = { { name = 'path' } },
                    })

                    return {
                        snippet = {
                            expand = function(args)
                                vim.snippet.expand(args.body)
                            end,
                        },
                        mapping = cmp.mapping.preset.insert({
                            ['<C-K>'] = 
                                require('cmp').mapping.select_prev_item(),
                            ['<C-J>'] = 
                                require('cmp').mapping.select_next_item(),
                            ['<C-f>'] = 
                                require('cmp').mapping.confirm({ 
                                    select = true,
                                }),
                        }),
                        sources = cmp.config.sources({
                            { name = 'nvim_lsp' },
                            { name = 'nvim_lsp_signature_help' },
                            { name = 'buffer' },
                            { name = 'path' },
                        }),
                        window = {
                            completion = 
                                require('cmp').config.window.bordered(),
                            documentation =
                                require('cmp').config.window.bordered(),
                        },
                        sorting = defaults.sorting,
                        formatting = {
                            format = function(_, vim_item)
                                vim_item.menu = nil
                                return vim_item
                            end,
                        },
                    }
                end,
            },
        },
        {
            {
                'stevearc/oil.nvim',
                lazy = false,
                opts = {
                    default_file_explorer = true,
                    view_options = {
                        show_hidden = true,
                    }
                },
            },
            {
                'ibhagwan/fzf-lua',
                event = 'VeryLazy',
                opts = { 
                    "default-title",
                    defaults = {
                        formatter = 'path.dirname_first',
                    },
                    files = {
                        cwd_prompt = false,
                    },
                },
                keys = {
                    {
                        "<leader>ff",
                        "<CMD>FzfLua files<CR>",
                        desc = 'Fuzzy find files',
                        silent = true,
                    },
                    {
                        '<leader>fs',
                        '<CMD>FzfLua grep_project<CR>',
                        desc = 'Fuzzy grep over files in project',
                        silent = true,
                    },
                }
            },
            { 
                'ThePrimeagen/harpoon', 
                branch = 'harpoon2',
                event = 'VeryLazy',
                opts = {
                    global_settings = {
                        save_on_toggle = true,
                        save_on_ui_close = true,
                    },
                },
                keys = function()
                    local keys = {
                        {
                            '<leader>ha', 
                            function() require('harpoon'):list():add() end,
                            desc = 'Add to harpoon list',
                            silent = true,
                        },
                        {
                            '<leader>hm',
                            function() 
                                local harpoon = require('harpoon')
                                harpoon.ui:toggle_quick_menu(harpoon:list()) 
                            end,
                            desc = 'Show harpoon list',
                            silent = true,
                        },
                    }

                    for i = 1, 9 do
                        table.insert(keys, {
                            '<A-' .. i .. '>',
                            function()
                                require('harpoon'):list():select(i)
                            end,
                            desc = 'Go to harpoon ' .. i,
                            silent = true,
                        })
                    end

                    return keys
                end,
            },
        },
        {
            { 
                'lewis6991/gitsigns.nvim',
                event = 'VeryLazy',
                opts = {
                    auto_attach = true,
                },
            },
            {
                "folke/flash.nvim",
                event = "VeryLazy",
                opts = {},
                keys = {
                    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
                    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
                },
            },
            {
                'echasnovski/mini.pairs',
                event = { 'InsertEnter', 'CmdlineEnter' },
                opts = {
                    modes = { insert = true, command = true },
                    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
                    skip_ts = { 'string' },
                    skip_unbalanced = true,
                    markdown = true
                }
            },
        },
    },
    {
        ui = { border = 'rounded' },
    }
)

-- Colorscheme
vim.cmd.colorscheme('catppuccin')

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
                '<CMD>!clang-format -i **/*.c **/*.hCR>', {
                    silent = true,
                    desc = 'Run clang-format'
            })
            vim.keymap.set('n', '<leader>rl',
                '<CMD>terminal clang-tidy **/*.c **/*.h<CR>', {
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
