-- essential vim settings
-- tabs / indents
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.o.smarttab = true

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false
vim.opt.wrap = false
vim.wo.cursorline = true

-- swapfile/history
-- I don't really know what these do
    -- vim.opt.swapfile = false
    -- vim.opt.backup = false
    -- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    -- vim.opt.undofile = true

-- search options
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- this breaks on the windows terminal
-- vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- performance options
vim.o.complete = "i"
vim.o.lazyredraw = true

-- folding
vim.o.foldmethod = "indent"
vim.o.foldenable = false

-- performance
vim.o.autoread = true

-- colors
vim.cmd("colorscheme solarized")
vim.opt.colorcolumn = "80"
-- transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
