-- highlight on yank
local augroup = vim.api.nvim_create_augroup
local tonitum_group = augroup("Tonitum", {})
local autocmd = vim.api.nvim_create_autocmd


-- TODO: move these to lua autocmds
-- tab types for c++ files
vim.cmd [[
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 commentstring=//\ %s
]]

vim.cmd [[
  autocmd FileType lua setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType cmake setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
]]

-- markdown settings
vim.cmd [[
  autocmd FileType markdown setlocal spell spelllang=en shiftwidth=2 tabstop=2
]]

-- tab types for bash/sh files
vim.cmd [[
  autocmd FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=4
]]

vim.cmd [[
  autocmd FileType bash setlocal shiftwidth=2 tabstop=2 softtabstop=4
]]

vim.cmd [[
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=4 commentstring=#\ %s
]]

vim.cmd [[
  autocmd FileType helm setlocal shiftwidth=2 tabstop=2 softtabstop=4 commentstring=#\ %s
]]

vim.cmd [[
  autocmd FileType proto setlocal shiftwidth=2 tabstop=2 softtabstop=2 commentstring=//\ %s
]]

-- what does this do again?
vim.api.nvim_create_autocmd('BufReadPost', {
  group = tonitum_group,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- TODO: move this to a keymap
-- vim.cmd [[
--   autocmd BufWritePre *.lua :%s/\s\+$//e
--   autocmd BufWritePre *.yaml :%s/\s\+$//e
--   autocmd BufWritePre *.yml :%s/\s\+$//e
--   autocmd BufWritePre *.py :%s/\s\+$//e
--   autocmd BufWritePre *.cc :%s/\s\+$//e
--   autocmd BufWritePre *.h :%s/\s\+$//e
--   autocmd BufWritePre *.proto :%s/\s\+$//e
-- ]]
