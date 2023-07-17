-- mercurial ftw
vim.keymap.set("n", "<leader>gs", ":G status<CR>") -- status
vim.keymap.set("n", "<leader>gd", ":G diff<CR>") -- diff
vim.keymap.set("n", "<leader>gb", ":G blame<CR>") -- blame
vim.keymap.set("n", "<leader>ga", ":G add %<CR>") -- add the current file
vim.keymap.set("n", "<leader>gc", ":G commit -m ''<left>") -- add the current file
vim.keymap.set("n", "<leader>gq", ":G difftool<CR> :cclose<CR> :TroubleToggle quickfix<CR>") -- diff the current file
