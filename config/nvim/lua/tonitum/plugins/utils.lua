return {
  { "tpope/vim-commentary" }, -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  { "tpope/vim-surround" }, -- change text wrappers e.g. " " ()
  {
    "ojroques/nvim-osc52",

    keys = {
      { '<leader>c',  nil, expr = true },
      { '<leader>cc', nil, remap = true },
      { '<leader>cc', nil, mode = "v" }
    },
    config = function()
      vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true })
      vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true })
      vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
      local function copy()
        if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
          require('osc52').copy_register('+')
        end
      end

      -- vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
    end
  },
}
