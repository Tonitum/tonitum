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
    cursorline = true,
    -- showtabline = 0,
    showtabline = 1,

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
    foldmethod = "indent", -- set a default fold method
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
    title = false,
    numberwidth = 4,
    wrap = false,
    showmode = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- path
vim.o.path = vim.o.path .. ".config/nvim/,"
vim.o.path = vim.o.path .. "/opt/tbs/include/,"
vim.o.path = vim.o.path .. "/disk01/e416232/projects/dts,"
vim.o.path = vim.o.path .. "/disk01/e416232/projects/dts/tbs_repo,"
vim.o.path = vim.o.path .. "/disk01/e416232/projects/dts/tbs_repo/nondev/gmock_install/include/,"
vim.o.path = vim.o.path .. "/disk01/e416232/projects/dts/tbs_repo/nondev/gtest_install/include/,"

-- colorscheme, etc
-- vim.cmd("colorscheme NeoSolarized")
-- vim.cmd("colorscheme solarized")
vim.cmd("colorscheme gruvbox")
-- transparency
-- vim.cmd("hi Normal ctermfg=12 ctermbg=8 guifg=#839496 guibg=#002b36")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.opt.shortmess:append("c") -- what do these do?
vim.opt.isfname:append("@-@")

-- Plugin Settings
-- vim-airline
-- let g:airline_theme='<theme>'
-- vim.cmd('let g:airline#extensions#tabline#enabled = 1')
vim.cmd('let g:airline_powerline_fonts = 1')
-- vim.cmd [[
-- if !exists('g:airline_symbols')
--   let g:airline_symbols = {}
-- endif
-- ]]

-- -- " Unicode symbols
-- vim.cmd("let g:airline_left_sep = '»'")
-- vim.cmd("let g:airline_left_sep = '▶'")
-- vim.cmd("let g:airline_right_sep = '«'")
-- vim.cmd("let g:airline_right_sep = '◀'")
-- vim.cmd("let g:airline_symbols.linenr = '␊'")
-- vim.cmd("let g:airline_symbols.linenr = '␤'")
-- vim.cmd("let g:airline_symbols.linenr = '¶'")
-- vim.cmd("let g:airline_symbols.branch = '⎇'")
-- vim.cmd("let g:airline_symbols.paste = 'ρ'")
-- vim.cmd("let g:airline_symbols.paste = 'Þ'")
-- vim.cmd("let g:airline_symbols.paste = '∥'")
-- vim.cmd("let g:airline_symbols.whitespace = 'Ξ'")
-- gitgutter
vim.g.gitgutter_override_sign_column_highlight = 0
