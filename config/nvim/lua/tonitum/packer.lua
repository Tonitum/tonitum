-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use{"wbthomason/packer.nvim", opt = true}
  use("tpope/vim-fugitive") -- git commands in vim
  use("tpope/vim-commentary") -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  use("tpope/vim-surround") -- change text wrappers e.g. " " ()
  use("vim-airline/vim-airline") -- fancy status bar
  use("preservim/nerdtree")
  use("alepez/vim-gtest")
  use("ojroques/nvim-osc52")

  -- Highlight, edit, and navigate code using a fast incremental parsing library.
  -- Treesitter is used by nvim for various things,
  -- but among others, for syntax coloring.
  -- Make sure that any themes you install support treesitter!
  use({"nvim-treesitter/nvim-treesitter"}, {run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("nvim-treesitter/nvim-treesitter-textobjects") -- Additional textobjects for treesitter.
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-tree/nvim-web-devicons")

  use{"sainnhe/everforest"} -- everforest color scheme
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("mfussenegger/nvim-dap-python")
  use("folke/zen-mode.nvim")
  use("renerocksai/telekasten.nvim")

  -- troupe
  use({
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup {
            icons = true,
        }
    end
  })
  -- harpoon
  use{"theprimeagen/harpoon",
    commit="6138ff7096bc50f0b6b40b607196232e1b90d6b6"
  }
  -- telescope
  use({
    "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
  })
  -- lsp-zero
  use{
    "VonHeikemen/lsp-zero.nvim",
    requires = {
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
      { "L3MON4D3/LuaSnip",
        commit ="94f192cf5f0a1931b3035c2d8affdebec460968c"},
      {"rafamadriz/friendly-snippets"},
    }
  }
  -- neotest
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python"
    }
  })
  -- whichkey
  use({
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  })

end)
