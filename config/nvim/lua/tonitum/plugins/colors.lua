return {
  -- color schemes
  {"sainnhe/everforest",
    lazy = true,
    dependencies = "vim-airline/vim-airline",
    config = function()
      vim.opt.termguicolors = true
      vim.cmd("set background=dark")
      vim.cmd("let g:everforest_disable_italic_comment = 1")
      vim.cmd("let g:everforest_background='hard'")
      vim.cmd("let g:everforest_ui_contrast='high'")
      vim.cmd("let g:everforest_diagnostic_virtual_text='colored'")
      -- vim.cmd("let g:everforest_transparent_background = 1")
      vim.cmd("AirlineTheme everforest")
    end
  }, -- everforest color scheme

  {"rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    dependencies = "vim-airline/vim-airline",
    config = function ()
      vim.cmd("AirlineTheme luna")
    end
  }, -- rose pine color scheme

  {'bluz71/vim-nightfly-colors',
    lazy = true,
    config = function ()
      vim.opt.termguicolors = true
      vim.cmd("set background=dark")
      vim.g.nightflyCursorColor = true
      vim.g.nightflyItalics = false
      vim.g.nightflyTransparent = true
      vim.g.nightflyUnderlineMatchParen = true
    end
  }
}
