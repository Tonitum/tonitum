require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
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

