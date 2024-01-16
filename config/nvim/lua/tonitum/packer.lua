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
  use("vim-airline/vim-airline-themes") -- fancy status bar
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
  use({"rose-pine/neovim", as = "rose-pine"})
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("mfussenegger/nvim-dap-python")
  use("mfussenegger/nvim-jdtls")
  use("folke/zen-mode.nvim")
  use("renerocksai/telekasten.nvim")
  use("renerocksai/calendar-vim")
  use("towolf/vim-helm")
  use("lewis6991/gitsigns.nvim")

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
  use{"theprimeagen/harpoon"
  }
  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
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
      { "L3MON4D3/LuaSnip"},
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

  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
  'Chaitanyabsprip/present.nvim',
  config = function()
    require('present').setup{
      -- ... your config here
    }
  end}

  use({'cacalabs/toilet'})
  use({'bluz71/vim-nightfly-colors'})
  use({'jbyuki/venn.nvim'})
end)
