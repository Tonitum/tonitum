require('plugins')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

HOME = os.getenv("HOME")
 -- set Packet to auto reload
vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]


-- essential vim settings
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.o.hlsearch = false
-- colors
vim.cmd("colorscheme solarized")
-- transparency
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
