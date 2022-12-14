vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use
local home_dir = "/home/e416232/.config/nvim"
require("plugin-opt.telescope")
require("plugin-opt.lsp")

-- work packer startup
-- packer.startup(function()
  -- -- packer itself
  -- use(home_dir .. '/after/pack/packer/opt/packer.nvim')
  -- -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  -- use(home_dir .. '/manual-plugins/vim-commentary-master')
  -- -- use "cs" to change wrappers e.g. " to '
  -- use(home_dir .. '/manual-plugins/vim-surround-master')
  -- -- Highlight, edit, and navigate code using a fast incremental parsing library.
  -- -- Treesitter is used by nvim for various things, but among others, for syntax coloring.
  -- -- Make sure that any themes you install support treesitter!
  -- use(home_dir .. '/manual-plugins/nvim-treesitter-master')
  -- -- Additional textobjects for treesitter.
  -- use(home_dir .. '/manual-plugins/nvim-treesitter-textobjects-master')
  -- -- Collection of configurations for builtin LSP client.
  -- use(home_dir .. '/manual-plugins/nvim-lspconfig-master')
  -- -- Autocompletion plugin
  -- use(home_dir .. '/manual-plugins/nvim-cmp-main')
  -- -- LSP source for nvim cmp
  -- use(home_dir .. '/manual-plugins/cmp-nvim-lsp-main')
  -- -- Snippets source for nvim cmp
  -- use(home_dir .. '/manual-plugins/cmp_luasnip-master')
  -- --  Snippets plugin
  -- use(home_dir .. '/manual-plugins/LuaSnip-master')
-- end)

-- home packer startup
packer.startup(function()
  use( 'wbthomason/packer.nvim' )-- Package manager itself.
  use( 'tpope/vim-commentary' ) -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  use( 'tpope/vim-surround' ) -- change text wrappers e.g. " ' ()
  -- use( 'tpope/vim-fugitive' ) -- git commands in vim
  use( 'vim-airline/vim-airline' ) -- fancy status bar
  use( 'airblade/vim-gitgutter' )
  use( 'preservim/nerdtree' )
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library.
  -- Treesitter is used by nvim for various things,
  -- but among others, for syntax coloring.
  -- Make sure that any themes you install support treesitter!
  use( 'nvim-treesitter/nvim-treesitter' )
  use( 'nvim-treesitter/nvim-treesitter-textobjects' ) -- Additional textobjects for treesitter.
  use( 'neovim/nvim-lspconfig' ) -- Collection of configurations for built-in LSP client.
  use( 'hrsh7th/nvim-cmp' ) -- Autocompletion plugin
  use( 'hrsh7th/cmp-nvim-lsp' ) -- LSP source for nvim-cmp
  use( 'saadparwaiz1/cmp_luasnip' ) -- Snippets source for nvim-cmp
  use( 'L3MON4D3/LuaSnip' ) -- Snippets plugin
  use( 'ellisonleao/gruvbox.nvim' ) -- gruvbox color scheme
end)


