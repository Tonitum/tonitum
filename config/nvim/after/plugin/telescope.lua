if not pcall(require, "telescope") then
  print("telescope not loaded")
  return
end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local ignored_dirs = {
  "_build",
  ".git",
}


vim.keymap.set('n', '<leader>gr', builtin.lsp_references)

require('telescope').setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        ["<CR>"] = actions.select_default,
	}
      },
  },
  file_ignore_patterns = {
      "_build/",
      "_release/",
      "_deploy/",
      "temp/",
  },
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
