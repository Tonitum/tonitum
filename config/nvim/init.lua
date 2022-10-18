-- Module Imports
require('plugins') -- install plugins
require("options") -- essential vim settings
require("netrw-tree") -- pseudo-nerdtree

-- Key Mappings
local map = require("map").map
vim.g.mapleader = " " -- set leader key to space

-- nmap("<leader><key>", "<cmd>Command<CR>")
function nmap(shortcut, command)
    -- normal mode remampings
    map('n', shortcut, command)
end
function imap(shortcut, command)
    -- insert mode remampings
    map('i', shortcut, command)
end
function vmap(shortcut, command)
    -- visual mode remampings
    map('v', shortcut, command)
end

-- easier line navigation
-- visual mode
vmap("L", "$")
vmap("H", "^")
vmap("J", "}")
vmap("J", "}")
-- normal mode
nmap("L", "$")
nmap("H", "^")
nmap("J", "}")
nmap("K", "{")

-- more convenient esc
imap("jk", "<esc>")

-- show/hide explorer window
nmap("<leader>E", "<cmd>Lex<CR>")

-- buffer swapping
nmap("<leader>bp", "<cmd>bprevious<CR>")
nmap("<leader>bn", "<cmd>bnext<CR>")

-- set Packer to auto reload
vim.cmd [[
    augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
]]
