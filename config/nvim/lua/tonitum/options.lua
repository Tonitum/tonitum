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

    wrap = false,

    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    -- search options
    hlsearch = false,
    ignorecase = true,
    incsearch = true,
    smartcase = true,

    termguicolors = true,

    scrolloff = 8,
    signcolumn = "yes",

    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    -- delays and poor user experience.
    updatetime = 50,
    -- timeoutlen = 1000,
    -- ttimeoutlen = 50,

    colorcolumn = "80",
    background = "dark",

    showtabline = 1,
    cmdheight = 1,-- Give more space for displaying messages.
    errorbells = false, -- no dings on error
    laststatus = 3, --
    pumheight = 10,
    scrolloff = 8,
    signcolumn = "yes",
    autoread = true,
    -- folding
    foldmethod = "indent", -- set a default fold method
    foldenable = false,
    complete = "i",
}

vim.opt.isfname:append("@-@")

for k, v in pairs(options) do
    vim.opt[k] = v
end
