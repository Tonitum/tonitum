function ColorMyPencils(color)
  color = color or "everforest"
  vim.opt.termguicolors = true
  vim.cmd("set background=dark")

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.cmd.colorscheme(color)
end

return {
  -- color schemes
  {
    "neanias/everforest-nvim",
    lazy = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn"t called.
    config = function()
      require("everforest").setup({
        background = "hard",
        ---How much of the background should be transparent. 2 will have more UI
        ---components be transparent (e.g. status line background)
        transparent_background_level = 3,
        disable_italic_comments = true,
      }
      )
      ColorMyPencils("everforest")
      require("everforest").load()
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false,
          transparency = true,
        },
      })
      ColorMyPencils("rose-pine")
    end
  }, -- rose pine color scheme

  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    config = function()
      vim.opt.termguicolors = true
      vim.g.nightflyCursorColor = true
      vim.g.nightflyItalics = false
      vim.g.nightflyTransparent = false
      vim.g.nightflyUnderlineMatchParen = true
    end
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        no_italic = true,              -- Force no italic
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = false,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },

  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn"t called.
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day",    -- The theme is used when the background is set to light
      transparent = false,    -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark",   -- style for floating windows
      },
    }
  },

  {
    "maxmx03/solarized.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or "light"
      require("solarized").setup({
        transparent = false,    -- enable transparent background
        styles = {
          comments = { italic = false, bold = false },
          functions = { italic = false },
          variables = { italic = false },
        }
      })
    end
  },

  {
    'l-snq/tr100.vim',
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme tr100')
    end,
  }
}
