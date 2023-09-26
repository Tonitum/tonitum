vim.keymap.set("n", "<leader>gs", ":Telescope git_status<CR>") -- status
vim.keymap.set("n", "<leader>gst", ":Telescope git_stash<CR>") -- stash
vim.keymap.set("n", "<leader>gH", ":Telescope git_commits<CR>") -- all commits
vim.keymap.set("n", "<leader>gh", ":Telescope git_bcommits<CR>") -- file commits
vim.keymap.set("n", "<leader>gbr", ":Telescope git_branches<CR>") -- branches
vim.keymap.set("n", "<leader>gB", ":G blame<CR>") -- blame
vim.keymap.set("n", "<leader>ga", ":Gwrite<CR>") -- add the current file
vim.keymap.set("n", "<leader>gc", ":G commit -m ''<left>") -- add the current file
vim.keymap.set("n", "<leader>gPU", ":G push<CR>") -- add the current file

local function openDiffSplit()
    vim.cmd("Gvdiffsplit")
    vim.keymap.set('n', 'q', "<c-w>c", { buffer = 0 })
end
vim.keymap.set("n", "<leader>gd", openDiffSplit) -- view the diff of the current file in a split

