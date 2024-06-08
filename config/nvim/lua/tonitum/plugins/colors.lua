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
  -- {"sainnhe/everforest",
  --   dependencies = "vim-airline/vim-airline",
  --   lazy = true,
  --   config = function()
  --     vim.cmd("let g:everforest_disable_italic_comment = 1")
  --     vim.cmd("let g:everforest_background='hard'")
  --     vim.cmd("let g:everforest_ui_contrast='high'")
  --     vim.cmd("let g:everforest_diagnostic_virtual_text='colored'")
  --     vim.cmd("let g:everforest_transparent_background = 1")
  --     ColorMyPencils()
  --   end
  -- }, -- everforest color scheme
  {
  "neanias/everforest-nvim",
  lazy = true,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      background = "hard",
      ---How much of the background should be transparent. 2 will have more UI
      ---components be transparent (e.g. status line background)
      transparent_background_level = 0,
      disable_italic_comments = true,
    }
    )
    ColorMyPencils("everforest")
    require("everforest").load()
  end,
  },

  {"rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    dependencies = "vim-airline/vim-airline",
    config = function ()
      require("rose-pine").setup({
        styles = {
          italic = false,
          transparency = true,
        },
      })
      vim.cmd("AirlineTheme luna")
      ColorMyPencils("rose-pine")
    end
  }, -- rose pine color scheme

  {'bluz71/vim-nightfly-colors',
    lazy = true,
    config = function ()
      vim.opt.termguicolors = true
      vim.g.nightflyCursorColor = true
      vim.g.nightflyItalics = false
      vim.g.nightflyTransparent = true
      vim.g.nightflyUnderlineMatchParen = true
    end
  }
}

