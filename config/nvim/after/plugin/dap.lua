require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
local dap = require('dap')
vim.keymap.set("n", "<leader>db", function ()
  dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dc", function ()
  dap.continue()
end)
vim.keymap.set("n", "<leader>ds", function ()
  dap.step_over()
end)
vim.keymap.set("n", "<leader>di", function ()
  dap.repl.open()
end)
-- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
