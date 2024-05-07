local servers = {
    'clangd',
    'csharp_ls',
    'jdtls',
    'pyright',
    'bashls',
    'html',
    'cssls',
    'tsserver',
    'rust_analyzer',
    'gopls',
    'zls'
    -- 'phpactor'
}

-- Cursorline
vim.o.cursorline = true

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

-- Center cursorline
vim.o.scrolloff = 30

-- Border column
vim.o.colorcolumn = '80'

-- Update time
vim.o.updatetime = 1000
vim.o.timeoutlen = 1000

-- No word wrap
vim.wo.wrap = false

-- System clipboard
vim.o.clipboard = 'unnamedplus'

-- Disable mouse
vim.o.mouse = nil

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

-- Leader
vim.g.mapleader = ' '

-- General keymaps
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CMD>buffer #<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {
    silent = true, 
    desc = 'Move selected line down in visual mode' 
})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {
    silent = true,
    desc = 'Move selected line up in visual mode' 
})

vim.keymap.set('x', '<leader>p', [["_dP]], {
    silent = true, 
    desc = 'Paste without yank' 
})
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

-- LSP Keymaps
vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, {
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
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {
    silent = true, 
    desc = 'Format file' 
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

-- Fuzzy finder
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

-- Harpoon
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

-- Note taking
vim.keymap.set('n', '<leader>md', '<CMD>MarkdownPreviewToggle<CR>', { 
    silent = true,
    desc = 'Toggle MarkdownPreview' 
})

-- Decenter buffer
vim.keymap.set('n', '<leader>dc', '<CMD>NoNeckPain<CR>', {
    silent = true,
    desc = 'Center/decenter buffer'
})

-- Jump around codebase
vim.keymap.set({'n', 'x', 'o'}, 's', 
    function() require('flash').jump() end, {
        silent = true,
        desc = 'Flash'
})
vim.keymap.set({'n', 'x', 'o'}, 'S', 
    function() require('flash').treesitter() end, {
        silent = true,
        desc = 'Flash Treesitter'
})
vim.keymap.set('o', 'r', 
    function() require('flash').remote() end, {
        silent = true,
        desc = 'Remote Flash'
})
vim.keymap.set({'o', 'x'}, 'R', 
    function() require('flash').treesitter_search() end, {
        silent = true,
        desc = 'Treesitter Search'
})
vim.keymap.set('c', '<C-s>',
    function() require('flash').toggle() end, {
        silent = true,
        desc = 'Toggle Flash Search'
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
require('lazy').setup({
    {
        'nvim-lua/plenary.nvim'
    },
    { 
        'nvimdev/dashboard-nvim',
        'projekt0n/github-nvim-theme',
        'nvim-lualine/lualine.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
        'windwp/nvim-ts-autotag',
        'shortcuts/no-neck-pain.nvim'
    },
    {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig'
    },
    {
        'L3MON4D3/LuaSnip',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'dcampos/cmp-emmet-vim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path'
    },
    {
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'ThePrimeagen/harpoon',
    },
    {
        'folke/flash.nvim',
        'kylechui/nvim-surround',
        'Exafunction/codeium.nvim',
        'ray-x/lsp_signature.nvim',
        'windwp/nvim-autopairs',
        'numToStr/Comment.nvim',
        'lewis6991/gitsigns.nvim',
        'zanadoman/speedrun.nvim'
    },
    {
        'tpope/vim-dadbod',
        'kristijanhusak/vim-dadbod-ui',
        'kristijanhusak/vim-dadbod-completion'
    },
    {
        'iamcco/markdown-preview.nvim',
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
})

-- Startup screen
require('dashboard').setup({
    shortcut_type = 'number',
    config = {
        disable_move = true,
		header = {
        	[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		 	[[                                                 ]],
		 	[[                                                 ]],
		
		},
		shortcut = {
            {
                icon = ' ',
                desc = 'New',
                key = 'n',
                action = 'enew'
            },
            {
                icon = ' ',
                desc = 'Open',
                key = 'o',
                action = 'Telescope file_browser'
            },
            {
                icon = ' ',
                desc = 'DB',
                key = 'd',
                action = 'bdelete | DBUI'
            },
            {
                icon = ' ',
                desc = 'Update',
                key = 'u',
                action = 'Lazy update | MasonUpdate'
            },
            {
                icon = ' ',
                desc = 'Config',
                key = 'c',
                action = 'edit ' .. vim.fn.stdpath('config') .. '/init.lua'
            },
            {
                icon = '󰩈 ',
                desc = 'Quit',
                key = 'q',
                action = 'quit' 
            }
        },
        packages = { enable = false },
        project = { enable = false },
        mru = { limit = 20 },
        footer = {}
    }
})

-- Theme
require('github-theme').setup({
    options = {
        transparent = true,
        terminal_colors = true
    },
})
vim.cmd.colorscheme 'github_dark'

vim.cmd("hi EndOfBuffer guifg=#1e1e2e")
vim.cmd("hi WinSeparator guifg=#1e1e2e")

-- Status line
require('lualine').setup({
    options = {
        globalstatus = true
    }
})

-- Treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'c_sharp',
        'javascript',
        'php',
        'python',
        'java',
        'bash',
        'html',
        'css',
        'sql',
        'go',
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

-- Center buffer
require('no-neck-pain').setup({
    autocmds = {
        enableOnVimEnter = true
    }
})

-- Install servers
require('mason').setup({})

require('mason-lspconfig').setup({ ensure_installed = servers })

-- Start servers
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
end

require('lspconfig').phpactor.setup{
    on_attach = on_attach,
    init_options = {
        ['language_server_phpstan'] = true,
        ['language_server_psalm'] = true
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
}

-- Autocompletion
require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'emmet_vim', option = { filetypes = { 'html', 'css', 'php' } } },
        { name = 'vim-dadbod-completion' },
        { name = 'codeium' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
    },
    mapping = {
        ['<C-Up>'] = require('cmp').mapping.select_prev_item(),
        ['<C-Down>'] = require('cmp').mapping.select_next_item(),
        ['<C-f>'] = require('cmp').mapping.confirm({select = true}),
        ['<C-e>'] = require('cmp').mapping.abort(),
        ['<A-Up>'] = require('cmp').mapping.scroll_docs(-1),
        ['<A-Down>'] = require('cmp').mapping.scroll_docs(1)
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

vim.diagnostic.config({
    update_in_insert = true,
})

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = 'rounded'
-- })

require('cmp').setup.cmdline(':', {
    sources = {{name = 'cmdline'}},
})

require('cmp').setup.cmdline('/', {
    sources = {{name = 'buffer'}},
})

require('cmp').setup.cmdline('!', {
    sources = {{name = 'path'}},
})

vim.o.pumheight = 10
vim.o.pumwidth = 30

-- Fuzzy finder
require('telescope').setup({
    extensions = {
        file_browser = {
            hijack_netrw = true
        }
    }
})

require('telescope').load_extension('file_browser')

-- Jump around codebase
require('harpoon').setup({
    global_settings = {
        save_on_toggle = true
    }
})

-- LSP hints
require('lsp_signature').setup({
    bind = true,
    -- handler_opts = { border = 'rounded' },
    hint_prefix = '■ '
})

-- Surround tool
require('nvim-surround').setup()

-- Codeium AI
require('codeium').setup()

-- Autopairs
require('nvim-autopairs').setup()

-- Comment
require('Comment').setup()
require('Comment.ft').set('plsql', '--%s')

-- Git integration
require('gitsigns').setup({
    on_attach = function()
        vim.keymap.set('n', '<leader>h', ':Gitsigns\n', {
            silent = true,
            desc = 'Gitsigns'
        })

        vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk_inline\n', {
            silent = true,
            desc = 'Gitsigns preview hunk'
        })

        vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk\n', {
            silent = true,
            desc = 'Gitsigns stage hunk'
        })

        vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk\n', {
            silent = true,
            desc = 'Gitsigns unstage hunk'
        })

        vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk\n', {
            silent = true,
            desc = 'Gitsigns reset hunk'
        })

        vim.keymap.set('n', '<leader>hS', ':Gitsigns stage_buffer\n', {
            silent = true,
            desc = 'Gitsigns stage buffer'
        })

        vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer\n', {
            silent = true,
            desc = 'Gitsigns reset buffer'
        })

        vim.keymap.set('n', '<leader>hb', ':Gitsigns toggle_current_line_blame\n', {
            silent = true,
            desc = 'Gitsigns toggle blame'
        })
    end
})

-- Code runner
require('speedrun').setup({
    keymap = '<leader>sr',
    langs = {
        rust = {
            cmd = 'cargo run --release'
        }
    }
})

-- Fix lsp floating window
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.max_width = opts.max_width or 80
    opts.max_height = opts.max_height or 15
    if opts.width ~= nil and opts.width < 0 then
        opts.width = opts.width or 80
        opts.height = opts.height or 15
    end
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--Code runner
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function(opts)
        if vim.bo[opts.buf].filetype == 'c' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal gcc -std=c99' .. 
                ' -O3 -Werror -Wall -Wextra -Wpedantic % && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙱 '
            })
        elseif vim.bo[opts.buf].filetype == 'cpp' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal g++ -std=c++11 -O3 ' ..
                '-Werror -Wall -Wextra -Wpedantic % && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙲 '
            })
        elseif vim.bo[opts.buf].filetype == 'cs' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal dotnet run<CR>', {
                    silent = true,
                    desc = 'Run 󰌛 '
            })
        elseif vim.bo[opts.buf].filetype == 'java' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal java %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'python' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal python3 %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'sh' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal ./%<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'go' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal go run .<CR>', {
                    silent = true,
                    desc = 'Run 󰟓  '
            })
        elseif vim.bo[opts.buf].filetype == 'rust' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal cargo run --release<CR>', {
                    silent = true,
                    desc = 'Run 󱘗  '
            })
            vim.keymap.set('n', '<leader>rc', 
                '<CMD>terminal cargo clippy<CR>', {
                    silent = true,
                    desc = 'Run clippy'
            })
        elseif vim.bo[opts.buf].filetype == 'zig' then
            vim.keymap.set('n', '<leader>rr', 
                '<CMD>terminal zig run %<CR>', {
                    silent = true,
                    desc = 'Run  '
            })
        end
    end
})
