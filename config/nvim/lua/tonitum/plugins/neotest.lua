-- neotest
return {
  -- testing
  {
    "rcasia/neotest-java",
    ft = "java"
  },
  { "nvim-neotest/neotest-jest" },
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
          require("neotest-jest")({
            jestConfigFile = "jest.config.ts",
            cwd = function(path)
              return vim.fn.getcwd()
            end,
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
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest"
    }
  },
  {
    "nvim-neotest/neotest-python",
    commit = "2e83d2bc00acbcc1fd529dbf0a0e677cabfe6b50"
  }
}
