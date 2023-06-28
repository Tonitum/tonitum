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

