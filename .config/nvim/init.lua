local servers = {
    'clangd',
    'csharp_ls',
    'jdtls',
    'pyright',
    'bashls',
    'html',
    'cssls',
    'tsserver',
    'intelephense',
    'sqlls',
    'gopls',
    'rust_analyzer'
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
vim.o.updatetime = 500
vim.o.timeoutlen = 500

-- No word wrap
vim.o.wrap = false

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

-- Leader
vim.g.mapleader = ' '

-- General keymaps
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
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {
    silent = true, 
    desc = 'Format file' 
})
vim.keymap.set('n', '<leader>ld', 
    function() require('telescope.builtin').lsp_definitions() end, {
        silent = true,
        desc = 'Go to definition'
})
vim.keymap.set('n', '<leader>lr', 
    function() require('telescope.builtin').lsp_references() end, {
        silent = true,
        desc = 'Go to definition'
})
vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, {
    silent = true,
    desc = 'Rename'
})
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {
    silent = true,
    desc = 'Show diagnostic for line'
})

-- Fuzzy finder
vim.keymap.set('n', '<leader>ff', '<CMD>Telescope file_browser<CR>', {
    silent = true,
    desc = 'Fuzzy find files in current directory'
})
vim.keymap.set('n', '<leader>fc', '<CMD>Telescope grep_string<CR>', {
    silent = true,
    desc = 'Fuzzy find string under cursor in current directory'
})
vim.keymap.set('n', '<leader>fs', 
    "<CMD>lua require('telescope.builtin').live_grep({grep_open_files = false})<CR>", {
        silent = true,
        desc = 'Fuzzy find string in current directory'
})

-- Harpoon
vim.keymap.set('n', '<leader>ha', '<CMD>lua require(\'harpoon.mark\').add_file()<CR>', {
    silent = true,
    desc = 'Mark file to harpoon'
})
vim.keymap.set('n', '<leader>hm', '<CMD>Telescope harpoon marks<CR>', {
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
        'folke/tokyonight.nvim',
        'nvim-lualine/lualine.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
        'windwp/nvim-ts-autotag'
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
        'ggandor/leap.nvim',
    },
    {
        'windwp/nvim-autopairs',
        'numToStr/Comment.nvim',
        'kylechui/nvim-surround',
        'lewis6991/gitsigns.nvim'
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
    },
    {
        'Exafunction/codeium.nvim'
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
require('tokyonight').setup({
    transparent = true,
    style = 'night',
    terminal_colors = true,
    styles = {
        sidebars = 'dark',
        floats = 'transparent'
    },
})
vim.cmd('colorscheme tokyonight')

-- Status line
require('lualine').setup({
    options = {
        theme = 'tokyonight',
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

-- Install servers
require('mason').setup({
    window = { border = 'rounded' }
})

require('mason-lspconfig').setup({ ensure_installed = servers })

-- Start servers
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
end

-- Autocompletion
require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vim-dadbod-completion' },
        { name = 'codeium' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'emmet_vim', option = { filetypes = { 'html', 'css', 'php' } } }
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
    experimental = {
        ghost_text = true
    }
})

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

-- Fuzzy finder
require('telescope').setup({
    extensions = {
        file_browser = {
            theme = 'dropdown',
            hijack_netrw = true
        }
    }
})

require('telescope').load_extension('file_browser')

require('telescope').load_extension('harpoon')

-- Jump around codebase
require('harpoon').setup({
    global_settings = {
        save_on_toggle = true
    }
})

-- Jump around file
require('leap').add_default_mappings()

-- Autopairs
require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' }
    }
})

-- Commenting
require('Comment').setup()
require('Comment.ft').set('plsql', '--%s')

-- Surround
require('nvim-surround').setup()

-- Git integration
require('gitsigns').setup({
    on_attach = function()
        vim.keymap.set('n', '<leader>g', ':Gitsigns\n', {
            silent = true,
            desc = 'Gitsigns'
        })

        vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk_inline\n', {
            silent = true,
            desc = 'Gitsigns preview hunk'
        })

        vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk\n', {
            silent = true,
            desc = 'Gitsigns stage hunk'
        })

        vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk\n', {
            silent = true,
            desc = 'Gitsigns unstage hunk'
        })

        vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk\n', {
            silent = true,
            desc = 'Gitsigns reset hunk'
        })

        vim.keymap.set('n', '<leader>gS', ':Gitsigns stage_buffer\n', {
            silent = true,
            desc = 'Gitsigns stage buffer'
        })

        vim.keymap.set('n', '<leader>gR', ':Gitsigns reset_buffer\n', {
            silent = true,
            desc = 'Gitsigns reset buffer'
        })

        vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame\n', {
            silent = true,
            desc = 'Gitsigns toggle blame'
        })
    end
})

-- Codeium AI
require('codeium').setup()

-- Diagnostic config
vim.api.nvim_create_autocmd({ 
    'CursorHold', 
    'CursorHoldI' 
}, {
    callback = function()
        if vim.lsp.buf.server_ready() and not require('cmp').visible() then
            vim.lsp.buf.hover()
        end
    end
})

vim.diagnostic.config({
    update_in_insert = true,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    focusable = false,
    border = 'rounded'
})

--Code runner
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function(opts)
        if vim.bo[opts.buf].filetype == 'c' then
            if vim.fn.filereadable('compile_flags.txt') then
                vim.keymap.set('n', '<leader>rr', '<CMD>terminal gcc % ' ..
                               '$(cat compile_flags.txt) && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙱 '
                })
            else
                vim.keymap.set('n', '<leader>rr', '<CMD>terminal gcc -std=c99 -O3 ' ..
                               '-Werror -Wall -Wextra -Wpedantic % && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙱 '
                })
            end
        elseif vim.bo[opts.buf].filetype == 'cpp' then
            if vim.fn.filereadable('compile_flags.txt') then
                vim.keymap.set('n', '<leader>rr', '<CMD>terminal g++ % ' ..
                               '$(cat compile_flags.txt) && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙲 '
                })
            else
                vim.keymap.set('n', '<leader>rr', '<CMD>terminal g++ -std=c++11 -O3 ' ..
                               '-Werror -Wall -Wextra -Wpedantic % && ./a.out<CR>', {
                    silent = true,
                    desc = 'Run 󰙲 '
                })
            end
        elseif vim.bo[opts.buf].filetype == 'cs' then
            vim.keymap.set('n', '<leader>rr', '<CMD>terminal dotnet run<CR>', {
                silent = true,
                desc = 'Run 󰌛 '
            })
        elseif vim.bo[opts.buf].filetype == 'java' then
            vim.keymap.set('n', '<leader>rr', '<CMD>terminal java %<CR>', {
                silent = true,
                desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'python' then
            vim.keymap.set('n', '<leader>rr', '<CMD>terminal python3 %<CR>', {
                silent = true,
                desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'sh' then
            vim.keymap.set('n', '<leader>rr', '<CMD>terminal ./%<CR>', {
                silent = true,
                desc = 'Run  '
            })
        elseif vim.bo[opts.buf].filetype == 'go' then
            vim.keymap.set('n', '<leader>rr', '<CMD>terminal go run .<CR>', {
                silent = true,
                desc = 'Run 󰟓  '
            })
        elseif vim.bo[opts.buf].filetype == 'rs' then
            vim.keymap.set('n', '<leader>rr', '<CMD>terminal cargo run<CR>', {
                silent = true,
                desc = 'Run 󱘗  '
            })
        end
    end
})
