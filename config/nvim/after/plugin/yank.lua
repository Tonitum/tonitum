vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

local function copy()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
    require('osc52').copy_register('+')
  end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

