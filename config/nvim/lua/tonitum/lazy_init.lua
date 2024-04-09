local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_plugins = {
  -- Highlight, edit, and navigate code using a fast incremental parsing library.
  -- Treesitter is used by nvim for various things,
  -- but among others, for syntax coloring.
  -- Make sure that any themes you install support treesitter!
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"nvim-tree/nvim-web-devicons",
    lazy = false,
    tag = "v0.99",
    config = function()
      require'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          }
        };
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true;
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true;
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
          }
        };
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
          }
        };
      }
    end
  },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects", -- Additional textobjects for treesitter.
  "nvim-treesitter/playground",

  -- file tree
  {"preservim/nerdtree",
    dependencies = {"ryanoasis/vim-devicons"},
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>e", ":NERDTreeFocus<CR>")
      vim.keymap.set("n", "<leader>nE", "<cmd>NERDTreeToggle<CR>")
      vim.keymap.set("n", "<leader>nf", "<cmd>NERDTreeFind<CR>")

      -- vim.cmd("let g:NERDTreeFileLines = 1")
      vim.cmd("let NERDTreeShowHidden=1")
      vim.cmd("let NERDTreeNaturalSort=1")
      vim.cmd("let NERDTreeMinimalUI=1")
      vim.cmd("let NERDTreeMinimalMenu=1")
      vim.cmd("let NERDTreeCascadeSingleChildDir=0")
      vim.cmd("let NERDTreeWinSize=40")
      vim.cmd("let NERDTreeWinPos='left'")
      vim.cmd("let g:webdevicons_enable_nerdtree = 1")
      vim.cmd("let g:devicons_conceal_nerdtree_brackets = 1")
      vim.cmd("let g:webdevicons_conceal_nerdtree_brackets = 1")
      vim.cmd[[call webdevicons#refresh()]]

      -- Start NERDTree. If a file is specified, move the cursor to its window.
      -- vim.cmd( "autocmd StdinReadPre * let s:std_in=1 \
      -- autocmd VimEnter * NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif" )

      -- Exit Vim if NERDTree is the only window remaining in the only tab.
      -- vim.cmd( "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" )

      -- Close the tab if NERDTree is the only window remaining in it.
      vim.cmd( "autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" )
    end
  },
  {"tiagofumo/vim-nerdtree-syntax-highlight"},
  {"PhilRunninger/nerdtree-buffer-ops"},
  {"PhilRunninger/nerdtree-visual-selection"},
  {"ryanoasis/vim-devicons", lazy = false,
    config = function()
      vim.cmd[[call webdevicons#refresh()]]
    end
    },

  -- git
  {"lewis6991/gitsigns.nvim"},
  {"tpope/vim-fugitive"}, -- git commands in vim

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
      require('dap-python').setup()
      -- require('dap-python').setup(".venv/bin/python3",{
      --   include_configs = true,
      --   console = 'integratedTerminal',
      -- })
      local opts = {silent = true}
      vim.keymap.set('n', '<leader>df', "<cmd>lua require('dap-python').test_class()<cr>", opts)
      vim.keymap.set('n', '<leader>dm', "<cmd>lua require('dap-python').test_method()<cr>", opts)

      require('dap-python').test_runner = 'pytest'

    end
  },
  {"mfussenegger/nvim-jdtls", ft = "java"},

  -- testing
  {'rcasia/neotest-java', ft = "java"},
  {"alepez/vim-gtest"},

  -- note taking
  {"renerocksai/calendar-vim"},
  {"renerocksai/telekasten.nvim"},
  {'cacalabs/toilet'},
  {'jbyuki/venn.nvim'},

  -- color schemes
  {"sainnhe/everforest",
    dependencies = "vim-airline/vim-airline",
    config = function()
      vim.opt.termguicolors = true
      vim.cmd("set background=dark")
      vim.cmd("let g:everforest_disable_italic_comment = 1")
      vim.cmd("let g:everforest_background='hard'")
      vim.cmd("let g:everforest_ui_contrast='high'")
      vim.cmd("let g:everforest_diagnostic_virtual_text='colored'")
      -- vim.cmd("let g:everforest_transparent_background = 1")
      vim.cmd("AirlineTheme everforest")
    end
  }, -- everforest color scheme

  {"rose-pine/neovim",
    name = "rose-pine",
    dependencies = "vim-airline/vim-airline",
    config = function ()
      vim.cmd("AirlineTheme luna")
    end
  }, -- rose pine color scheme

  {'bluz71/vim-nightfly-colors',
    config = function ()
      vim.opt.termguicolors = true
      vim.cmd("set background=dark")
      vim.g.nightflyCursorColor = true
      vim.g.nightflyItalics = false
      vim.g.nightflyTransparent = true
      vim.g.nightflyUnderlineMatchParen = true
    end
  },

  {"theprimeagen/harpoon",
    config = function ()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

      vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
      vim.keymap.set("n", "<C-h>", function() ui.nav_file(4) end)
    end
  },
  {"towolf/vim-helm", ft = "helm"},
  {"tpope/vim-commentary"}, -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  {"tpope/vim-surround"}, -- change text wrappers e.g. " " ()

  -- status bar
  {"vim-airline/vim-airline",
    config = function()
      vim.cmd[[  if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
      ]]

      vim.cmd[[
        " powerline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.colnr = ' ℅:'
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ' :'
        let g:airline_symbols.maxlinenr = '☰ '
      ]]

      vim.cmd('let g:airline_powerline_fonts = 1')
      vim.cmd('let g:airline_highlighting_cache = 1')
    end
  }, -- fancy status bar
  {"vim-airline/vim-airline-themes"}, -- fancy status bar

  {"folke/zen-mode.nvim"},
  {"ojroques/nvim-osc52"},
  -- trouble
  {"folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = true,
        mode = "quickfix",
      })
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "<leader>q", "<cmd>Trouble<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle telescope<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        {silent = true, noremap = true}
      )
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
        {silent = true, noremap = true}
      )
    end
  },

  -- telescope
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-tree/nvim-web-devicons"},
    }
  },
  -- lsp-zero
  {"VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lua"},

      -- Snippets
      { "L3MON4D3/LuaSnip"},
      {"rafamadriz/friendly-snippets"},
    }
  },
  -- neotest
  {"nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python"
    }
  },

  -- whichkey
  {"folke/which-key.nvim",
    build = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  },

  -- install without yarn or npm
  {"iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function ()
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_port = 24603
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_open_ip = '127.0.0.1'
      vim.g.mkdp_auto_start = 1
    end
  },
  {"Chaitanyabsprip/present.nvim",
    ft = "markdown",
    build = function()
      require('present').setup{}
    end
  },
  {"kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
       { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  },
}

require("lazy").setup({
    lazy_plugins
})
