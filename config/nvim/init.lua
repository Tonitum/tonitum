-- Module Imports
require('plugins') -- install plugins
require("options") -- essential vim settings
require("netrw-tree") -- pseudo-nerdtree

-- Key Mappings
local map = require("map").map
vim.g.mapleader = " " -- set leader key to space
-- vim.g.mapleader = "," -- set leader key to space

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

-- reload the config
nmap("<leader>vs", "<cmd>so ~/.config/nvim/init.lua<CR>") -- re-source the config
nmap("<leader>ve", "<cmd>e ~/.config/nvim/init.lua<CR>") -- edit the config

-- tab navigation
nmap("<leader>th", "<cmd>tabfirst<CR>")
nmap("<leader>tk", "<cmd>tabnext<CR>")
nmap("<leader>tj", "<cmd>tabprev<CR>")
nmap("<leader>tl", "<cmd>tablast<CR>")
nmap("<leader>tt", ":tabedit<Space>")
nmap("<leader>tn", ":tabnew<Space>")
nmap("<leader>tm", ":tabm<Space>")
nmap("<leader>td", "<cmd>tabclose<CR>")

-- show/hide explorer window
nmap("<leader>Q", "<cmd>Lex %:p:h<CR>")
nmap("<leader>E", "<cmd>Lex<CR>")

-- buffer swapping
nmap("<leader>bp", "<cmd>bprevious<CR>")
nmap("<leader>bn", "<cmd>bnext<CR>")

-- sort lines from visual selection
map("x", "<leader>so", "<cmd>'<,'>!sort<CR>")

-- replace all instances
nmap("<leader><C-d>", ":%s//")

-- bracket completion
imap("{", "{}<left>")
imap("{{", "{")
imap("{}", "{}")

imap("(", "()<left>")
imap("((", "(")
imap("()", "()")

imap("[", "[]<left>")
imap("[[", "[")
imap("[]", "[]")

imap('"', '""<left>')
imap('""', '""')

imap("'", "''<left>")
imap("''", "''")

-- apply suggested fix
nmap("<leader>ap", "<cmd>:lua vim.lsp.buf.code_action()<CR>")
-- vim-commentary
-- map("x", "<C-/>", "<Plug>Commentary")
-- nmap("<C-/>", "<Plug>Commentary")
-- map("o", "<C-/>", "<Plug>Commentary")
-- map("o", "<C-//>", "<Plug>Commentary")

-- set Packer to auto reload
vim.cmd [[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

-- tab types for c++ files
vim.cmd [[
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType lua setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
]]
