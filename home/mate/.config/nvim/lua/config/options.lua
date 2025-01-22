local opt =
    vim.opt

-- Cursorline
opt.cursorline =
    true

-- Center cursorline
opt.scrolloff =
    30
opt.sidescrolloff =
    30

-- Line numbers
opt.number =
    true
opt.relativenumber =
    true

-- Indentation
opt.tabstop =
    4
opt.shiftwidth =
    4
opt.expandtab =
    true
opt.autoindent =
    true
opt.shiftround =
    true
opt.smartindent =
    true

-- Search settings
opt.ignorecase =
    true
opt.smartcase =
    true

-- Border column
opt.colorcolumn =
    "80"

-- Command line
opt.cmdheight =
    0

-- Update time
opt.updatetime =
    500
opt.timeoutlen =
    500

-- No word wrap
vim.wo.wrap =
    false

-- Folding
opt.foldmethod =
    "expr"
opt.foldexpr =
    "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart =
    99

-- System clipboard
opt.clipboard:append(
    vim.env.SSH_TTY
            and ""
        or "unnamedplus"
)

-- Infinite undo
opt.undofile =
    true

-- Disable mouse
opt.mouse =
    ""

-- Disable swap files
opt.swapfile =
    false
opt.backup =
    false

-- Appearance
opt.list =
    true
opt.termguicolors =
    true
opt.background =
    "dark"
opt.signcolumn =
    "yes"
opt.splitright =
    true
opt.splitbelow =
    true
opt.showmode =
    false
opt.hlsearch =
    false
opt.pumheight =
    10
opt.pumwidth =
    30

-- Beeping
opt.vb =
    true

-- Diffs
opt.diffopt:append(
    "iwhite"
)
opt.diffopt:append(
    "algorithm:histogram"
)
opt.diffopt:append(
    "indent-heuristic"
)
