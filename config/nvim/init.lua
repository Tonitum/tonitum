-- Module Imports
require("plugins") -- install plugins
require("plugin-opt.telescope") -- install plugins
require("options") -- essential vim settings
require("keymap") -- alternate key maps
local utils = require("utils") -- utility functions
local nerdtree = require("plugin-opt.nerdtree")
-- local netrw = require('netrw-tree') -- pseudo-nerdtree

-- Key Mappings
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap
local augroup = utils.augroup
local autocmd = utils.autocmd
local tonitum_group = augroup('Tonitum', {})

-- show/hide explorer window
if nerdtree ~= nil then
  nmap("<leader>e", ":NERDTreeFocus<CR>")
  nmap("<leader>nE", "<cmd>NERDTreeToggle<CR>")
  nmap("<leader>nf", "<cmd>NERDTreeFind<CR>")
  -- nmap("<leader><C-e>", "<cmd>NERDTree<CR>")
elseif netrw ~= nil then
  nmap("<leader>q", "<cmd>Lex %:p:h<CR>")
  nmap("<leader>e", "<cmd>Lex<CR>")
end

-- set Packer to auto reload
vim.cmd [[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

-- tab types for c++ files
vim.cmd [[
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 commentstring=//\ %s
]]

vim.cmd [[
  autocmd FileType lua setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType cmake setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
]]

vim.cmd [[
  autocmd FileType markdown setlocal spell spelllang=en shiftwidth=2 tabstop=2
]]

autocmd('BufRead', {
    group = tonitum_group,
    pattern = '*.md, *.log, *.txt',
    callback = function()
      vim.g.wrap = true
      vim.g.spelllang = 'en'
      vim.g.spell = true
    end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = tonitum_group,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- highlight on yank
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
