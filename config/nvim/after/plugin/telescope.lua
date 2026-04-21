local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>gr', builtin.lsp_references)

require('telescope').setup({
  pickers = {
    lsp_references = {
      theme = "cursor"
    },
    find_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    },
    quickfix = {
      theme = "ivy"
    },
    git_files = {
      theme = "ivy"
    }
  }
})
