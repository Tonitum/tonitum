local utils = require("utils") -- utility functions
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap

vim.g.mapleader = " " -- set leader key to space

nmap("<leader>hw", "<cmd>echo 'Hello World'<CR>")

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


-- apply suggested fix
nmap("<leader>ap", "<cmd>:lua vim.lsp.buf.code_action()<CR>")

-- vim-commentary
-- map("x", "<C-/>", "<Plug>Commentary")
-- nmap("<C-/>", "<Plug>Commentary")
-- map("o", "<C-/>", "<Plug>Commentary")
-- map("o", "<C-//>", "<Plug>Commentary")

-- telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- this requires ripgrep, which may not be available to me
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

