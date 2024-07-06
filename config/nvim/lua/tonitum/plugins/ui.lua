return {
  {"folke/zen-mode.nvim"},
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
}
