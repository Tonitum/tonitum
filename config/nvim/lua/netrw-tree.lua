-- to give the included fileexplorer a NERDTree like experience
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
vim.cmd [[ augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
]]
