return {
  {
    "folke/zen-mode.nvim",
    lazy = true,
    keys = {
      { "<leader>Z", function() require("zen-mode").toggle() end, desc = "LazyGit" }
    },

    config = function()
      require("zen-mode").setup {
        window = {
          width = 120,
          options = {}
        },
      }
      -- vim.keymap.set("n", "<leader>Z", function()
      --   require("zen-mode").toggle()
      -- end)
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      })
      local opts = {
        sections = {
          lualine_c = {
          }
        }
      }

      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
      require("lualine").setup(
        opts
      )
    end,
  }
}
