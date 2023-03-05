-- highlight on yank
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
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

-- tab types for c++ files
vim.cmd [[
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
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
