return {
  "nvim-telescope/telescope.nvim",
  -- telescope
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "folke/trouble.nvim" },
  },
  keys = {
    {"<leader>ff", nil},
    {"<leader>fq", nil},
    {"<leader>fg", nil},
    {"<leader>fr", nil},
    {"<leader>fb", nil},
    {"<leader>fh", nil},
    {"<leader>fs", nil},
    {"<leader>gr", nil}
  },
  config = function()
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ff',
      function() builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } }) end, {})
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
    vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fr', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fs', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)

    vim.keymap.set('n', '<leader>gr', builtin.lsp_references)

    require('telescope').setup({
      defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " > ",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
          i = {
            ["<C-x>"] = false,
            ["<C-q>"] = actions.smart_send_to_qflist,
            ["<c-t>"] = require("trouble.sources.telescope").open,

            ["<CR>"] = actions.select_default,
          },
          n = {
            ["<C-q>"] = actions.smart_send_to_qflist,
            ["<leader>a"] = actions.toggle_selection,
            ["<c-t>"] = require("trouble.sources.telescope").open,
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
          -- theme = "ivy",
          hidden = true
        },
        live_grep = {
          -- theme = "ivy",
          hidden = true
        },
        -- quickfix = {
        --   theme = "ivy"
        -- },
        git_files = {
          -- theme = "ivy",
          hidden = true
        },
        -- git_branches = {
        --   theme = "dropdown"
        -- },
        git_status = {
          -- theme = "ivy",
          initial_mode = "normal"
        },
        git_commits = {
          -- theme = "ivy"
        },
        git_bcommits = {
          -- theme = "ivy"
        },
        git_stash = {
          -- theme = "ivy"
        }
      }
    })
  end
}
