-- neotest
return {
  -- testing
  {
    "rcasia/neotest-java",
    ft = "java"
  },
  {
    "fredrikaverpil/neotest-golang",
    version = "*",                                                            -- Optional, but recommended; track releases
    build = function()
      vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
    end,
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
        require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap", suite = false })
      end },

    },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      -- Neotest merges this partial config with its defaults.
      ---@diagnostic disable-next-line: missing-fields
      require("neotest").setup({
        log_level = 0,
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
          require("neotest-golang")({
            runner = "gotestsum", -- Optional, but recommended
          }),
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "fredrikaverpil/neotest-golang",
    }
  },
  {
    "nvim-neotest/neotest-python",
    commit = "2e83d2bc00acbcc1fd529dbf0a0e677cabfe6b50"
  }
}
