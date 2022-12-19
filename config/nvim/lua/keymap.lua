local utils = require("utils") -- utility functions
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap

vim.g.mapleader = " " -- set leader key to space

-- mark navigation
nmap("<leader>m", "`")
nmap("<leader>A", "`A")
nmap("<leader>S", "`S")
nmap("<leader>D", "`D")
nmap("<leader>F", "`F")

-- move cursor to active window
nmap("<leader>w", "<cmd>wincmd l<CR>")

-- easier line navigation
-- visual mode
vmap("L", "$")
vmap("H", "^")
vmap("J", "}")
vmap("K", "{")

-- normal mode
nmap("L", "$")
nmap("H", "^")
-- nmap("J", "<C-d>zz")
-- nmap("K", "<C-u>zz")
nmap("J", "}")
nmap("K", "{")

-- clarity while jumping
-- center screen while searching
nmap("n", "nzz")
nmap("N", "Nzz")

-- center screen while jumping
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")

-- more convenient esc
imap("jf", "<esc>")
imap("fj", "<esc>")

-- open notes
nmap("<leader>nt", "<cmd>tabedit ~/Documents/notes/notes.md<CR>")

-- reload the config
nmap("<leader>vs", "<cmd>so ~/.config/nvim/init.lua<CR>") -- re-source the config
nmap("<leader>ve", "<cmd>tabedit ~/.config/nvim/init.lua<CR>") -- edit the config
nmap("<leader>vk", "<cmd>tabedit ~/.config/nvim/lua/keymap.lua<CR>") -- edit the keymaps
nmap("<leader>vE", "<cmd>tabedit ~/.config/nvim/<CR>") -- open the vim config folder

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

-- close all unopen buffers
nmap("<leader>bc", "<cmd>%bd|e#<CR>")

-- auto-increment numbers
map("x", "<leader>i", "g<C-a>")

-- sort lines from visual selection
map("x", "<leader>so", "<cmd>'<,'>sort<CR>")

-- find/replace all instances
nmap("<leader><C-d>", ":%s//")

-- paste last yanked
nmap("<leader>p", '"0p')
nmap("<leader>P", '"0P')

function searchLastYank()
  vim.cmd([[
    let search=escape(@0,'$.*/\[]')
    execute 'normal! /'.search
    let @/=search
  ]])
end
-- search last yank (register 0)
nmap("<leader>sy", "<cmd>lua searchLastYank()<CR>")

-- bracket completion
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
-- nmap("<leader>C", "<Plug>Commentary w")
nmap("<C-_>", "<Plug>Commentary w")
vmap("<C-_>", "<Plug>Commentary w")

-- telescope bindings
ignored_dirs = {
  "_build",
  ".git",
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {file_ignore_patterns = ignored_dirs})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
-- this requires ripgrep, which may not be available to me
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


