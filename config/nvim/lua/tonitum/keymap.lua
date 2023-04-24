vim.g.mapleader = " " -- set leader key to space

vim.keymap.set("n", "Q", "<nop>") -- disable shift Q

vim.keymap.set("n", "<leader>sp", "z=1<CR><CR>") -- automatically apply best spelling guess
vim.keymap.set("n", "<leader>ss", "z=") -- open spelling corrections list

-- move cursor to active window
vim.keymap.set("n", "<leader>w", "<cmd>wincmd l<CR>")

vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

-- easier line navigation
-- visual mode
vim.keymap.set("v", "J", "}")
vim.keymap.set("v", "K", "{")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

-- normal mode
vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- clarity while jumping
-- center screen when jumping pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center screen on search term and open any folds
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfixlist navigation
vim.keymap.set("n", "<leader>cj", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>ck", "<cmd>cprev<CR>zz")

-- greatest remap ever: that does what?
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : again, what?
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- vim config options
vim.keymap.set("n", "<leader>vs", "<cmd>so ~/.config/nvim/init.lua<CR>") -- re-source the config
vim.keymap.set("n", "<leader>ve", "<cmd>tabedit ~/.config/nvim/lua/tonitum/init.lua<CR>") -- edit the config
vim.keymap.set("n", "<leader>vk", "<cmd>tabedit ~/.config/nvim/lua/tonitum/keymap.lua<CR>") -- edit the keymaps
vim.keymap.set("n", "<leader>vo", "<cmd>tabedit ~/.config/nvim/lua/tonitum/packer.lua<CR>") -- edit the plugins
vim.keymap.set("n", "<leader>vE", "<cmd>tabedit ~/.config/nvim/<CR>") -- open the vim config folder

-- close all unopen buffers
vim.keymap.set("n", "<leader>bc", "<cmd>%bd|e#<CR>")

-- auto-increment numbers
vim.keymap.set("x", "<leader>i", "g<C-a>")

-- sort lines from visual selection
vim.keymap.set("x", "<leader>so", "<cmd>'<,'>sort<CR>")

-- find/replace all instances
vim.keymap.set("n", "<leader><C-d>", ":%s//")

-- paste last yanked
vim.keymap.set("n", "<leader>p", '"0p')
vim.keymap.set("n", "<leader>P", '"0P')

vim.keymap.set("n", "<leader>fw",  "^<down>v$<left>y<up>A <esc>p<down>dd<up>^")
vim.keymap.set("n", "y",  "\"*y")

-- find/replace all 
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- add execute to file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
