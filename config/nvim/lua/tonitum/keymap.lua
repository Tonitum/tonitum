-------------------------------------------------------------------------------
------------ general ------------
-------------------------------------------------------------------------------
-- set leader key to space
vim.g.mapleader = " "

-- disable shift Q
vim.keymap.set("n", "Q", "<nop>")

-------------------------------------------------------------------------------
------------ navigation ------------
-------------------------------------------------------------------------------
-- move cursor to last active window
vim.keymap.set("n", "<leader>w", "<cmd>wincmd p<CR>")

-- set j/k to follow wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

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

-------------------------------------------------------------------------------
------------ text manipulation ------------
-------------------------------------------------------------------------------
-- paste last yanked in normal mode
vim.keymap.set("n", "<leader>p", '"0p')
vim.keymap.set("n", "<leader>P", '"0P')

-- paste last yanked item in visual mode
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>fw", "^<down>v$<left>y<up>A <esc>p<down>dd<up>^")

-- delete without overriding yank
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- auto-increment numbers
vim.keymap.set("x", "<leader>i", "g<C-a>")

-- sort lines from visual selection
vim.keymap.set("x", "<leader>so", "<cmd>'<,'>sort<CR>")

-- delete all trailing whitespaces
-- :%s/\s\+$//e
vim.keymap.set("n", "<leader>WS", ":%s/\\s\\+$//e<CR>")

vim.keymap.set("n", "<A-d>", "D")

-- find/replace all in file
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-------------------------------------------------------------------------------
------------ spelling ------------
-------------------------------------------------------------------------------
-- automatically apply best spelling guess
vim.keymap.set("n", "<leader>sp", "z=1<CR><CR>")
-- open spelling corrections list
vim.keymap.set("n", "<leader>ss", "z=")

-------------------------------------------------------------------------------
------------ vim config options ------------
-------------------------------------------------------------------------------
-- re-source the config
vim.keymap.set("n", "<leader>vs", "<cmd>so ~/.config/nvim/init.lua<CR>")
-- edit the config
vim.keymap.set("n", "<leader>ve", "<cmd>tabedit ~/.config/nvim/lua/tonitum/init.lua<CR>")
-- edit the keymaps
vim.keymap.set("n", "<leader>vk", "<cmd>tabedit ~/.config/nvim/lua/tonitum/keymap.lua<CR>")
-- edit the keymaps
vim.keymap.set("n", "<leader>vl", "<cmd>tabedit ~/.config/nvim/after/plugin/lsp.lua<CR>")
-- edit the plugins
vim.keymap.set("n", "<leader>vo", "<cmd>tabedit ~/.config/nvim/lua/tonitum/packer.lua<CR>")
-- open the vim config folder
vim.keymap.set("n", "<leader>vE", "<cmd>tabedit ~/.config/nvim/<CR>")

-------------------------------------------------------------------------------
------------ window/buffer management ------------
-------------------------------------------------------------------------------
-- close all unopen buffers
vim.keymap.set("n", "<leader>bc", "<cmd>%bd|e#<CR>")

-- diffing
vim.keymap.set("n", "<leader><C-d>s", "<cmd>windo diffthis<CR>", { silent = true })
vim.keymap.set("n", "<leader><C-d>e", "<cmd>windo diffoff<CR>", { silent = true })

-- execute a shell command
vim.keymap.set("n", "<leader>sh", ":!")

-------------------------------------------------------------------------------
------------ terminal/shell ------------
-------------------------------------------------------------------------------
-- add execute to file
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", "<cmd>!%<CR>", { silent = true })

-- protobuf linting
-- vim.keymap.set("n", "<leader>lp", "<cmd>!buf lint %<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>lf", "<cmd>!buf format % -w <CR>", { silent = true })

vim.keymap.set("n", "<leader>lp", "<cmd>!protolint %<CR>", { silent = true })
vim.keymap.set("n", "<leader>lf", "<cmd>!protolint -fix -auto_disable=next % <CR>", { silent = true })

-- execute a shell command
vim.keymap.set("n", "<leader>sh", ":!")

-- insert the result of a shell command
vim.keymap.set("n", "<leader>si", ":r!")
