-- Module Imports
require("plugins") -- install plugins
require("options") -- essential vim settings
require("keymap") -- alternate key maps
local utils = require("utils") -- utility functions
local nerdtree = require("plugin-opt.nerdtree")
-- local netrw = require('netrw-tree') -- pseudo-nerdtree

-- Key Mappings
-- These should probably be moved elsewhere, v0.0.4?
local map = utils.map
local nmap = utils.nmap
local imap = utils.imap
local augroup = utils.augroup
local autocmd = utils.autocmd

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
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
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
-- highlight on yank
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
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
