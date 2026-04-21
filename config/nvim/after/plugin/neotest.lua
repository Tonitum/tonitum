require("neotest").setup({
  quickfix = {
    enabled = true,
    open = function ()
      vim.cmd("TroubleToggle quickfix")
    end
  },
  adapters = {
    require("neotest-python")({
      dap = {
        justMyCode = false,
    },
    }),
    -- Runner to use. Will use pytest if available by default.
    -- Can be a function to return dynamic value.
    runner = "python-unittest",
    -- require("neotest-plenary"),
    -- require("neotest-vim-test")({
    --   ignore_file_types = { "python", "vim", "lua" },
    -- }),
  },
})

local run = require("neotest").run

-- todo: autocommand to load these on python/lua/not cpp
vim.keymap.set("n", "<leader>tt", run.run)
vim.keymap.set("n", "<leader>ta", function ()
  run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>td", function ()
  run.run({vim.fn.expand("%"), strategy = "dap"})
end)

-- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
