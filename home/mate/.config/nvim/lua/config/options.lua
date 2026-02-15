local opt = vim.opt

-- Appearance
opt.termguicolors = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 30
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.pumheight = 10
opt.pumwidth = 30
opt.pumblend = 20
opt.list = true
opt.splitright = true
opt.splitbelow = true
opt.shortmess:append("I")
vim.wo.wrap = false
vim.g.netrw_banner = 0
opt.statusline = "%=%t"
opt.winborder = "single"

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true
opt.expandtab = true
opt.shiftwidth = 0
opt.tabstop = 4

-- Time
opt.updatetime = 200
opt.timeoutlen = 500

-- Fold
opt.foldenable = true
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Diff
opt.diffopt:append("iwhite")
opt.diffopt:append("linematch:60")

-- Saving
opt.confirm = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undolevels = 10000

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Input / output
opt.mouse = ""
opt.vb = true
opt.clipboard:append(vim.env.SSH_TTY and "" or "unnamedplus")
vim.g.mapleader = vim.keycode("<space>")
