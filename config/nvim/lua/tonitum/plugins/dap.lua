return {
  -- debugging
  {"rcarriga/nvim-dap-ui",
    dependencies = { {"nvim-neotest/nvim-nio"} }
  },

  {"mfussenegger/nvim-dap",
  lazy = true,
  config = function()
    local dap = require('dap')
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
      require("dapui").toggle({reset=true})
    end)
    vim.keymap.set("n", "<leader>dv", function ()
      require("dapui").toggle(1,{reset=true})
    end)
    vim.keymap.set("n", "<leader>dr", function ()
      require("dapui").toggle(2,{reset=true})
    end)
    vim.keymap.set("n", "<leader>dh", function ()
      require("dapui").float_element("scopes")
    end)
    -- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
    -- Launching debug sessions and resuming execution via :lua require'dap'.continue().
    -- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
    -- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
    -- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
    -- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
    -- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
  end
  },

  {"mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      -- require('dap-python').setup()
      require('dap-python').setup("python3",{
        include_configs = true,
        console = 'integratedTerminal',
      })
      local opts = {silent = true}
      vim.keymap.set('n', '<leader>df', "<cmd>lua require('dap-python').test_class()<cr>", opts)
      vim.keymap.set('n', '<leader>dm', "<cmd>lua require('dap-python').test_method()<cr>", opts)

      require('dap-python').test_runner = 'pytest'

    end
  }
}
