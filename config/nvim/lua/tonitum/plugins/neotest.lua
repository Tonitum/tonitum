-- neotest
return {
  -- testing
  {
    'rcasia/neotest-java',
    ft = "java"
  },
  { "alepez/vim-gtest" },
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tt", function()
        require("neotest").run.run()
      end },
      { "<leader>ta", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end },
      { "<leader>td", function()
        require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
      end },

    },
    config = function()
      require("neotest").setup({
        quickfix = {
          enabled = true,
          open = function()
            vim.cmd("Trouble qflist focus")
          end
        },
        adapters = {
          require("neotest-python")({
            dap = {
              justMyCode = false,
            },
            -- Runner to use. Will use pytest if available by default.
            -- Can be a function to return dynamic value.
            runner = "pytest",
          }),
          -- require("neotest-vim-test"){
          --     -- ignore_file_types = { "python", "vim", "lua" },
          --     allow_file_types = {"java" } ,
          -- },
          -- require("neotest-plenary"),
          -- require("neotest-vim-test")({
          --   ignore_file_types = { "python", "vim", "lua" },
          -- }),
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python"
    }
  }
}
