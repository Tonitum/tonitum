-- essential vim settings
-- for loop to set settings
local options = {
    -- tabs / indents
    expandtab = true,
    shiftwidth = 4,
    shiftround = true,
    smartindent = true,
    softtabstop = 4,
    tabstop = 4,
    smarttab = true,

    -- line
    nu = true,
    relativenumber = true,
    cursorline = false,
    showtabline = 0,

    -- search options
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    smartcase = true,

    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience.
    updatetime = 50,
    timeoutlen = 1000,
    ttimeoutlen = 50,

    -- performance options
    complete = "i",
    lazyredraw = true,
    autoread = true,
    compatible = false,

    -- folding
    foldmethod = "indent",
    foldenable = false,

    -- colors
    colorcolumn = "80",
    background = "dark",

    -- swapfile/history
    -- I don't really know what these do
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    -- this breaks on the windows terminal
    termguicolors = false,

    -- path
    path = vim.o.path .. ".config/nvim/",
    path = vim.o.path .. "/opt/tbs/include/",
    path = vim.o.path .. "/disk01/e416232/projects/dts",
    path = vim.o.path .. "/disk01/e416232/projects/dts/tbs_repo",
    -- path = path + "**", -- enable vanilla fuzzy find. have to see if this slows me down

    -- other
    -- clipboard = "unnamedplus", -- system clipboard (linux)
    cmdheight = 1,-- Give more space for displaying messages.
    errorbells = false, -- no dings on error
    guicursor = "", -- dunno, some gui thing
    guifont = "monospace:h17", -- see above
    laststatus = 3, --
    pumheight = 10,
    scrolloff = 8,
    signcolumn = "yes",
    title = true,
    numberwidth = 4,
    wrap = false,
    showtabline = 1,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- visual
vim.cmd("colorscheme NeoSolarized")
-- vim.cmd("colorscheme solarized")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE") -- transparency

-- path options

vim.opt.shortmess:append("c") -- what do these do?
vim.opt.isfname:append("@-@")
-- Manually set settings
-- [[
    -- essential vim settings
    -- -- tabs / indents
    -- vim.opt.expandtab = true
    -- vim.opt.shiftwidth = 4
    -- vim.opt.shiftround = true
    -- vim.opt.smartindent = true
    -- vim.opt.softtabstop = 4
    -- vim.opt.tabstop = 4
    -- vim.o.smarttab = true

    -- vim.opt.guicursor = ""
    -- vim.opt.nu = true
    -- vim.opt.relativenumber = true

    -- vim.opt.errorbells = false
    -- vim.opt.wrap = false
    -- vim.wo.cursorline = true

    -- -- swapfile/history
    -- -- I don't really know what these do
    --     -- vim.opt.swapfile = false
    --     -- vim.opt.backup = false
    --     -- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    --     -- vim.opt.undofile = true

    -- -- search options
    -- vim.opt.hlsearch = false
    -- vim.opt.ignorecase = true
    -- vim.opt.incsearch = true
    -- vim.opt.smartcase = true

    -- -- this breaks on the windows terminal
    -- -- vim.opt.termguicolors = true

    -- vim.opt.scrolloff = 8
    -- vim.opt.signcolumn = "yes"
    -- vim.opt.isfname:append("@-@")

    -- -- Give more space for displaying messages.
    -- vim.opt.cmdheight = 1

    -- -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- -- delays and poor user experience.
    -- vim.opt.updatetime = 50
    -- vim.opt.timeoutlen = 1000
    -- vim.opt.ttimeoutlen = 50

    -- -- Don't pass messages to |ins-completion-menu|.
    -- vim.opt.shortmess:append("c")

    -- -- performance options
    -- vim.o.complete = "i"
    -- vim.o.lazyredraw = true

    -- -- folding
    -- vim.o.foldmethod = "indent"
    -- vim.o.foldenable = false

    -- -- performance
    -- vim.o.autoread = true

    -- -- colors
    -- vim.cmd("colorscheme solarized")
    -- vim.opt.colorcolumn = "80"
    -- -- transparency
    -- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    -- ]]
