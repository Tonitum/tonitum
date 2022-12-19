require("tonitum.set")
require("tonitum.remap")

local augroup = vim.api.nvim_create_group
local tonitum_group = augroup('Tonitum', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = autocmd('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end


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

autocmd({"BufWritePre"}, {
    group = tonitum_group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
