if not pcall(vim.cmd, 'colorscheme everforest') then
  print("colorscheme not loaded")
  return
end

vim.opt.termguicolors = true
vim.cmd("set background=dark")
vim.cmd("let g:everforest_disable_italic_comment = 1")
vim.cmd("let g:everforest_background='hard'")
vim.cmd("let g:everforest_ui_contrast='high'")
vim.cmd("let g:everforest_diagnostic_virtual_text='colored'")
-- vim.cmd("let g:everforest_transparent_background = 1")
vim.cmd('colorscheme everforest')
