-- highlight on yank
local augroup = vim.api.nvim_create_augroup
local tonitum_group = augroup("Tonitum", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- tab types for c++ files
autocmd("FileType", {
  group = tonitum_group,
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.commentstring = "// %s"
  end,
})

autocmd("FileType", {
  group = tonitum_group,
  pattern = { "lua", "cmake", "bash", "yaml", "sh", "proto", "json" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

autocmd("FileType", {
  group = tonitum_group,
  pattern = { "python" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

autocmd("FileType", {
  group = tonitum_group,
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.spelllang = "en"
    vim.opt_local.spell = true
  end,
})

vim.filetype.add({
  extension = {
    avsc = "json",
  },
})

-- This autocmd is trying to restore the cursor position to where you were last
-- editing the file, but only if the file is not a commit message and the last
-- cursor position is within the valid range of the buffer.
autocmd("BufReadPost", {
  group = tonitum_group,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
    local not_commit = vim.b[args.buf].filetype ~= "commit"

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

local yank_group = augroup("HighlightYank", { clear = true })
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})
