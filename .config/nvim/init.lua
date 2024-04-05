local servers = {
    'clangd',
    'csharp_ls',
    'jdtls',
    'pyright',
    'bashls',
    'html',
    'cssls',
    'quick_lint_js',
    'intelephense',
    'sqlls'
}

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = ai

-- Leader
vim.g.mapleader = " "

-- Border column
vim.o.colorcolumn = '80'

-- No word wrap
vim.o.wrap = false

-- System clipboard
vim.o.clipboard = 'unnamedplus'

-- Disable mouse
vim.o.mouse = nil

-- Plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require("lazy").setup({
	-- GUI
	{ 'nvimdev/dashboard-nvim' },
	{ 'catppuccin/nvim',  priority = 1000 },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{ 'romgrk/barbar.nvim' },
	{ 'nvim-tree/nvim-tree.lua' },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- Language Server Protocol
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	-- Workflow
	{ 'nvim-telescope/telescope.nvim' },
	{ 'windwp/nvim-autopairs' },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'folke/which-key.nvim' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/cmp-path' },
	{
		'Exafunction/codeium.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	{ 'mattn/emmet-vim' },
	-- Oracle database management
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },
})

-- Theme
vim.cmd.colorscheme "catppuccin-mocha"

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
                action = 'NvimTreeFindFileToggle'
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
        packages = {enable = false},
        project = {enable = false},
        mru = {limit = 20},
        footer = {}
    }
})
-- Bracket autocompletion
require('nvim-autopairs').setup()

-- Status line
require('lualine').setup{
	options = {
		theme = "catppuccin"
	}
}

-- Buffer line
require('barbar').setup({
    animation = false,
    icons = {
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = {enabled = true},
            [vim.diagnostic.severity.WARN] = {enabled = true}
        },
        gitsigns = {
            added = {enabled = true},
            changed = {enabled = true},
            deleted = {enabled = true}
        }
    }
})

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "c_sharp", "javascript", "php", "python", "java", "bash", "html", "css", "sql" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
	additional_vim_regex_highlighting = false,
  },
}

-- File explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  view = {
    width = 20,
	side = "right",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer' })

-- Help
require('which-key').setup()

-- Autocompletion
require('cmp').setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'vim-dadbod-completion'},
        {name = 'codeium'},
        {name = 'buffer'},
        {name = 'path'}
    },
    mapping = {
        ['<Up>'] = require('cmp').mapping.select_prev_item(),
        ['<Down>'] = require('cmp').mapping.select_next_item(),
        ['<Tab>'] = require('cmp').mapping.confirm({select = true}),
        ['<Escape>'] = require('cmp').mapping.abort(),
        ['<C-Up>'] = require('cmp').mapping.scroll_docs(-1),
        ['<C-Down>'] = require('cmp').mapping.scroll_docs(1)
    },
    window = {
        completion = require('cmp').config.window.bordered(),
        documentation = require('cmp').config.window.bordered()
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

-- Codeium AI
require('codeium').setup()

-- Install servers
require('mason').setup()
require('mason-lspconfig').setup({ensure_installed = servers})

-- Start servers
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
end

-- Diagnostic config
vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
    callback = function()
        if vim.lsp.buf.server_ready() and not require('cmp').visible() then
            vim.cmd('silent! lua vim.lsp.buf.hover()')
            vim.cmd('silent! lua vim.diagnostic.open_float()')
        end
    end
})

vim.diagnostic.config({
    update_in_insert = true,
    float = {border = 'rounded'}
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    focusable = false,
    border = 'rounded'
})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
