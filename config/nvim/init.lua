-- Module Imports
require("plugins") -- install plugins
require("options") -- essential vim settings
local utils = require("utils") -- utility functions
local nerdtree = require('plugin-opt.nerdtree')
-- local netrw = require('netrw-tree') -- pseudo-nerdtree

-- Key Mappings
-- These should probably be moved elsewhere, v0.0.4?
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap
local augroup = utils.augroup
local autocmd = utils.autocmd
local TonitumGroup = utils.TonitumGroup

vim.g.mapleader = " " -- set leader key to space
-- show/hide explorer window
if nerdtree ~= nil then
  nmap("<leader>e", ":NERDTreeFocus<CR>")
  nmap("<leader><C-e>", "<cmd>NERDTree<CR>")
  nmap("<leader>E", "<cmd>NERDTreeToggle<CR>")
  nmap("<leader>F", "<cmd>NERDTreeFind<CR>")
elseif netrw ~= nil then
  nmap("<leader>q", "<cmd>Lex %:p:h<CR>")
  nmap("<leader>e", "<cmd>Lex<CR>")
end

nmap("<leader>w", "<cmd>wincmd l<CR>")
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
imap("jf", "<esc>")
imap("fj", "<esc>")

-- open notes
nmap("<leader>nt", "<cmd>tabedit ~/Documents/notes/notes.md<CR>")
-- reload the config
nmap("<leader>vs", "<cmd>so ~/.config/nvim/init.lua<CR>") -- re-source the config
nmap("<leader>ve", "<cmd>tabedit ~/.config/nvim/init.lua<CR>") -- edit the config

-- tab navigation
nmap("<leader>th", "<cmd>tabfirst<CR>")
nmap("<leader>tk", "<cmd>tabnext<CR>")
nmap("<leader>tj", "<cmd>tabprev<CR>")
nmap("<leader>tl", "<cmd>tablast<CR>")
nmap("<leader>tt", ":tabedit<Space>")
nmap("<leader>tn", ":tabnew<Space>")
nmap("<leader>tm", ":tabm<Space>")
nmap("<leader>td", "<cmd>tabclose<CR>")


-- buffer swapping
nmap("<leader>bp", "<cmd>bprevious<CR>")
nmap("<leader>bn", "<cmd>bnext<CR>")

-- sort lines from visual selection
map("x", "<leader>so", "<cmd>'<,'>!sort<CR>")

-- replace all instances
nmap("<leader><C-d>", ":%s//")

-- -- bracket completion
-- imap("{", "{}<left>")
-- imap("{{", "{")
-- imap("{}", "{}")

-- imap("(", "()<left>")
-- imap("((", "(")
-- imap("()", "()")

-- imap("[", "[]<left>")
-- imap("[[", "[")
-- imap("[]", "[]")

-- imap('"', '""<left>')
-- imap('""', '""')

-- imap("'", "''<left>")
-- imap("''", "''")

-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- this requires ripgrep, which may not be available to me
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

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
  autocmd FileType cmake setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
]]
-- highlight on yank
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
