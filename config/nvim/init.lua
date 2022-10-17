require('plugins')

-- essential vim settings
require("options")
require("netrw-tree")
local map = require("map").map
function nmap(shortcut, command)
    -- normal mode remampings
    map('n', shortcut, command)
end

function imap(shortcut, command)
    -- insert mode remampings
    map('i', shortcut, command)
end
nmap("L", "$")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.g.mapleader = ","

HOME = os.getenv("HOME")
 -- set Packer to auto reload
vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]

