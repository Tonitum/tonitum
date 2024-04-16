local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

local lazy_plugins = {

  -- testing
  {'rcasia/neotest-java'},
  {"alepez/vim-gtest"},


  {"theprimeagen/harpoon",
    config = function ()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-h>", function() ui.nav_file(4) end)
    end
  },

  -- status bar
  {"vim-airline/vim-airline",
    config = function()
      vim.cmd[[  if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
      ]]

      vim.cmd[[
        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.colnr = ' ℅:'
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ' :'
        let g:airline_symbols.maxlinenr = '☰ '
      ]]

      vim.cmd('let g:airline_powerline_fonts = 1')
      vim.cmd('let g:airline_highlighting_cache = 1')
    end
  }, -- fancy status bar
  {"vim-airline/vim-airline-themes"}, -- fancy status bar

  {"folke/zen-mode.nvim"},
  {"tpope/vim-commentary"}, -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  {"tpope/vim-surround"}, -- change text wrappers e.g. " " ()
  {"ojroques/nvim-osc52"},
}

require("lazy").setup("tonitum.plugins")
-- require("lazy").setup({
--     lazy_plugins
-- })
