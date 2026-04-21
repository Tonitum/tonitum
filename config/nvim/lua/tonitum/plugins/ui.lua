return {
  {
    "folke/zen-mode.nvim",
    lazy = true,
    keys = {
      { "<leader>Z", function() require("zen-mode").toggle() end, desc = "Zen Mode" }
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
    opts = function(_, opts)
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      opts.sections = opts.sections or {}
      opts.sections.lualine_c = opts.sections.lualine_c or {}
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
      return opts
    end,
  }
}
