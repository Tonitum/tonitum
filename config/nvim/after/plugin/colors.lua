-- local colorscheme = "nightfly"
-- local colorscheme = "rose-pine"
local colorscheme = "everforest"
if not pcall(vim.cmd, "colorscheme " ..colorscheme ) then
  print(colorscheme .. " not loaded")
  return
end

if colorscheme == "nightfly" then
  vim.opt.termguicolors = true
  vim.cmd("set background=dark")
  vim.g.nightflyCursorColor = true
  vim.g.nightflyItalics = false
  vim.g.nightflyTransparent = true
  vim.g.nightflyUnderlineMatchParen = true
elseif colorscheme == "everforest" then
  vim.opt.termguicolors = true
  vim.cmd("set background=dark")
  vim.cmd("let g:everforest_disable_italic_comment = 1")
  vim.cmd("let g:everforest_background='hard'")
  vim.cmd("let g:everforest_ui_contrast='high'")
  vim.cmd("let g:everforest_diagnostic_virtual_text='colored'")
  vim.cmd("let g:everforest_transparent_background = 1")
  vim.cmd("AirlineTheme everforest")
elseif colorscheme == "rose-pine" then
  vim.cmd("AirlineTheme luna")
end
vim.cmd("colorscheme " .. colorscheme)
