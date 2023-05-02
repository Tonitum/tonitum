-- mercurial ftw
vim.keymap.set("n", "<leader>hgs", ":G status<CR>") -- status
vim.keymap.set("n", "<leader>hgd", ":G diff<CR>") -- diff
vim.keymap.set("n", "<leader>hga", ":G add %<CR>") -- add the current file
vim.keymap.set("n", "<leader>hgc", ":G commit -m ''<left>") -- add the current file
vim.keymap.set("n", "<leader>hgq", ":G difftool<CR> :cclose<CR> :TroubleToggle quickfix<CR>") -- diff the current file
