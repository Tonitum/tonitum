local M = {}

-- keymapping
function M.map(mode, shortcut, command)
  -- default options
  options = { noremap = true,
              silent = true}
  vim.api.nvim_set_keymap(mode, shortcut, command, options) 
end

function M.nmap(shortcut, command)
  -- normal mode remampings
  M.map('n', shortcut, command)
end

function M.imap(shortcut, command)
  -- insert mode remampings
  M.map('i', shortcut, command)
end

function vmap(shortcut, command)
    -- visual mode remampings
    M.map('v', shortcut, command)
end

-- autocmd setup
M.augroup = vim.api.nvim_create_augroup
M.TonitumGroup = M.augroup("Tonitum",  {})
M.autocmd = vim.api.nvim_create_autocmd

return M
