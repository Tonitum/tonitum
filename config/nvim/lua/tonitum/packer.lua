-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')
  -- use( 'tpope/vim-fugitive' ) -- git commands in vim
  use('airblade/vim-gitgutter')
  use( 'tpope/vim-commentary' ) -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  use( 'tpope/vim-surround' ) -- change text wrappers e.g. " ' ()
  use('vim-airline/vim-airline') -- fancy status bar
  use('preservim/nerdtree')

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- -- Highlight, edit, and navigate code using a fast incremental parsing library.
  -- -- Treesitter is used by nvim for various things,
  -- -- but among others, for syntax coloring.
  -- -- Make sure that any themes you install support treesitter!
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-textobjects') -- Additional textobjects for treesitter.
  use('nvim-treesitter/playground')
  use( 'neovim/nvim-lspconfig' ) -- Collection of configurations for built-in LSP client.
  use( 'hrsh7th/nvim-cmp' ) -- Autocompletion plugin
  use( 'hrsh7th/cmp-nvim-lsp' ) -- LSP source for nvim-cmp
  use( 'saadparwaiz1/cmp_luasnip' ) -- Snippets source for nvim-cmp
  use( 'L3MON4D3/LuaSnip' ) -- Snippets plugin
  use({'ellisonleao/gruvbox.nvim',
      commit = 'cb7a8a867cfaa7f0e8ded57eb931da88635e7007',
      config = function()
        vim.cmd('colorscheme gruvbox')
      end
    }) -- gruvbox color scheme

  use('theprimeagen/harpoon')


  -- use {
	  -- 'VonHeikemen/lsp-zero.nvim',
	  -- requires = {
		  -- -- LSP Support
		  -- {'neovim/nvim-lspconfig'},
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- -- Autocompletion
		  -- {'hrsh7th/nvim-cmp'},
		  -- {'hrsh7th/cmp-buffer'},
		  -- {'hrsh7th/cmp-path'},
		  -- {'saadparwaiz1/cmp_luasnip'},
		  -- {'hrsh7th/cmp-nvim-lsp'},
		  -- {'hrsh7th/cmp-nvim-lua'},

		  -- -- Snippets
		  -- {'L3MON4D3/LuaSnip'},
		  -- {'rafamadriz/friendly-snippets'},
	  -- }
  -- }

  -- use("folke/zen-mode.nvim")
  -- use("github/copilot.vim")

end)
