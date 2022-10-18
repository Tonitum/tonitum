-- to give the included fileexplorer a NERDTree like experience
vim.g.netrw_banner = 0          -- hide top banner
vim.g.netrw_liststyle = 3       -- tree view
-- vim.g.netrw_browse_split = 0 -- no split
-- vim.g.netrw_browse_split = 2 -- horizontal split
vim.g.netrw_browse_split = 4    -- use previous window to open file
vim.g.netrw_altv = 1            -- left/right window splitting
vim.g.netrw_winsize = 25        -- absolute window size

-- auto show Vex on new windows/tabs
-- vim.cmd [[ augroup ProjectDrawer
--   autocmd!
--   autocmd VimEnter * :Vexplore
-- augroup END
-- ]]
