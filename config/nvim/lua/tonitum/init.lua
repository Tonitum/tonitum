require("tonitum.options")
require("tonitum.keymap")
require("tonitum.autocommands")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local TonitumGroup = augroup("Tonitum", {})
local YankGroup = augroup("HighlightYank", {})

-- what does this do?
-- function R(name)
--   require("plenary.reload").reload_module(name)
-- end

autocmd('TextYankPost', {
  group = YankGroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- what does this do?
-- autocmd({"BufWritePre"}, {
--   group = TonitumGroup,
--   pattern = "*",
--   command = "%s/\\s\\+$//e"
-- })

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
