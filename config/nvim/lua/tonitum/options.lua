local options = {
    guicursor = "",

    -- line numbers
    nu = true,
    relativenumber = true,

    -- tabs / indents
    -- shiftround = true,
    -- smarttab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    smartindent = true,

    wrap = true,
    linebreak = true,
    breakindent = true,

    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    -- search options
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    smartcase = true,

    spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",

    termguicolors = true,

    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience.
    updatetime = 50,
    timeoutlen = 1000,
    ttimeoutlen = 50,

    colorcolumn = "80",
    background = "dark",

    showtabline = 1,
    mouse = "",
    clipboard = "unnamedplus",
    cmdheight = 1,-- Give more space for displaying messages.
    errorbells = false, -- no dings on error
    laststatus = 3, --
    pumheight = 10,
    scrolloff = 8,
    signcolumn = "yes",
    autoread = true,
    splitright = true,

    -- folding
    foldmethod = "indent", -- set a default fold method
    foldenable = false,
    complete = "i",
    foldlevel = 99,
}

vim.opt.shortmess:append("c")
vim.opt.isfname:append("@-@")

for k, v in pairs(options) do
    vim.opt[k] = v
end
