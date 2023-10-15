local python_cmds = vim.api.nvim_create_augroup('python_cmds', {clear = true})

require('dap-python').setup()
-- require('dap-python').setup("/usr/bin/python3",{
--   include_configs = true,
--   console = 'integratedTerminal',
-- })

local function python_dap_setup(event)
  local opts = {silent = true}
  vim.keymap.set('n', '<leader>df', "<cmd>lua require('dap-python').test_class()<cr>", opts)
  vim.keymap.set('n', '<leader>dm', "<cmd>lua require('dap-python').test_method()<cr>", opts)
end

vim.api.nvim_create_autocmd('FileType', {
  group = python_cmds,
  pattern = {'python'},
  desc = 'Setup python',
  callback = python_dap_setup,
})
