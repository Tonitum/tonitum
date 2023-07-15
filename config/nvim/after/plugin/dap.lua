require('dap-python').setup('/usr/bin/python3')

-- require('dap-python').resolve_python = function()
--   return '/.virtualenvs/debugpy/bin/python'
-- end
local dap = require('dap')
require("dapui").setup(
  {
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "repl",
            size = 0.0
          },
          {
            id = "console",
            size = 0.5
          }
        },
        position = "bottom",
        size = 10
      } },
  }
)
vim.keymap.set("n", "<leader>b", function ()
  dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dc", function ()
  dap.continue()
end)
vim.keymap.set("n", "<leader>ds", function ()
  dap.step_into()
end)
vim.keymap.set("n", "<leader>dn", function ()
  dap.step_over()
end)
vim.keymap.set("n", "<leader>di", function ()
  require("dapui").toggle()
end)
-- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
