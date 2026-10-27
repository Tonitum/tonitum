return {
  -- debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { { "nvim-neotest/nvim-nio" } }
  },

  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")
      require("dapui").setup(
        {
          layouts = {
            {
              position = "left",
              size = 40,
              elements = {
                {
                  id = "stacks",
                  size = 0.50
                },
                {
                  id = "scopes",
                  size = 0.3,
                },
                {
                  id = "breakpoints",
                  size = 0.2
                },
              },
            },
            {
              position = "bottom",
              size = 20,
              elements = {
                {
                  id = "repl",
                  size = 0.50
                },
                {
                  id = "console",
                  size = 0.50
                },
              },
            }
          },
        })
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end)
      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end)
      vim.keymap.set("n", "<leader>ds", function()
        dap.step_into()
      end)
      vim.keymap.set("n", "<leader>dn", function()
        dap.step_over()
      end)
      vim.keymap.set("n", "<leader>di", function()
        require("dapui").toggle({ reset = true })
      end)
      vim.keymap.set("n", "<leader>dv", function()
        require("dapui").toggle(1, { reset = true })
      end)
      vim.keymap.set("n", "<leader>dr", function()
        require("dapui").toggle(2, { reset = true })
      end)
      vim.keymap.set("n", "<leader>dh", function()
        require("dapui").float_element("scopes")
      end)
      -- Setting breakpoints via :lua require"dap".toggle_breakpoint().
      -- Launching debug sessions and resuming execution via :lua require"dap".continue().
      -- Stepping through code via :lua require"dap".step_over() and :lua require"dap".step_into().
      -- Inspecting the state via the built-in REPL: :lua require"dap".repl.open() or using the widget UI (:help dap-widgets)
      -- nnoremap <silent> <leader>dn :lua require("dap-python").test_method()<CR>
      -- nnoremap <silent> <leader>df :lua require("dap-python").test_class()<CR>
      -- vnoremap <silent> <leader>ds <ESC>:lua require("dap-python").debug_selection()<CR>
    end,
    dependencies = { { "leoluz/nvim-dap-go" } }
  },
  {
    "leoluz/nvim-dap-go",
    lazy = true,
    config = function()
      require('dap-go').setup {
        -- Additional dap configurations can be added.
        -- dap_configurations accepts a list of tables where each entry
        -- represents a dap configuration. For more details do:
        -- :help dap-configuration
        dap_configurations = {
          {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        -- delve configurations
        delve = {
          -- the path to the executable dlv which will be used for debugging.
          -- by default, this is the "dlv" executable on your PATH.
          path = "dlv",
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port.
          -- if you set a port in your debug configuration, its value will be
          -- assigned dynamically.
          port = "${port}",
          -- additional args to pass to dlv
          args = {},
          -- the build flags that are passed to delve.
          -- defaults to empty string, but can be used to provide flags
          -- such as "-tags=unit" to make sure the test suite is
          -- compiled during debugging, for example.
          -- passing build flags using args is ineffective, as those are
          -- ignored by delve in dap mode.
          -- avaliable ui interactive function to prompt for arguments get_arguments
          build_flags = {},
          -- whether the dlv process to be created detached or not. there is
          -- an issue on delve versions < 1.24.0 for Windows where this needs to be
          -- set to false, otherwise the dlv server creation will fail.
          -- avaliable ui interactive function to prompt for build flags: get_build_flags
          detached = vim.fn.has("win32") == 0,
          -- the current working directory to run dlv from, if other than
          -- the current working directory.
          cwd = nil,
        },
        -- options related to running closest test
        tests = {
          -- enables verbosity when running the test.
          verbose = false,
        },
      }
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      -- require("dap-python").setup()
      require("dap-python").setup("uv", {
        include_configs = true,
        console = "integratedTerminal",
      })
      local dap = require("dap")
      local opts = { silent = true }
      vim.keymap.set("n", "<leader>df", "<cmd>lua require('dap-python').test_class()<cr>", opts)
      vim.keymap.set("n", "<leader>dm", "<cmd>lua require('dap-python').test_method()<cr>", opts)
      vim.keymap.set("n", "<leader>b", function()
        dap.toggle_breakpoint()
      end)

      require("dap-python").test_runner = "pytest"
    end
  }
}
