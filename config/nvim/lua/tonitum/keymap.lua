-- leader key to space
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
-- move cursor to active window
vim.keymap.set("n", "<leader>w", "<cmd>wincmd l<CR>")

-- easier horizontal line navigation
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")

vim.keymap.set("v", "J", "}")
vim.keymap.set("v", "K", "{")

-- move highlighted line up/down with shift J/K
-- vim.keymap.set("v", "<C-N>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-M>", ":m '<-2<CR>gv=gv")

-- center screen when jumping pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center screen on search term and open any folds
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever: that does what?
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : again, what?
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

-- reload the config
vim.keymap.set("n", "<leader>vs", "<cmd>so ~/.config/nvim/lua/tonitum/init.lua<CR>") -- re-source the config
vim.keymap.set("n", "<leader>ve", "<cmd>tabedit ~/.config/nvim/lua/tonitum/init.lua<CR>") -- edit the config
vim.keymap.set("n", "<leader>vk", "<cmd>tabedit ~/.config/nvim/lua/tonitum/keymap.lua<CR>") -- edit the keymaps
vim.keymap.set("n", "<leader>vE", "<cmd>tabedit ~/.config/nvim/<CR>") -- open the vim config folder

-- quick fix list navigation
vim.keymap.set("n", "<leader>dk", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>dj", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>fw",  "^<down>v$<left>y<up>A <esc>p<down>dd<up>^")
vim.keymap.set("n", "y",  "\"*y")

-- find/replace all 
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- add execute to file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
