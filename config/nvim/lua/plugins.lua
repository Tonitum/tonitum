vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use
local home_dir = "/home/e416232/.config/nvim"

packer.startup(function()
    -- packer itself
    use(home_dir .. '/after/pack/packer/opt/packer.nvim')
    -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
    use(home_dir .. '/manual-plugins/vim-commentary-master')
    -- use "cs" to change wrappers e.g. " to '
    use(home_dir .. '/manual-plugins/vim-surround-master')
    -- Highlight, edit, and navigate code using a fast incremental parsing library.
    -- Treesitter is used by nvim for various things, but among others, for syntax coloring.
    -- Make sure that any themes you install support treesitter!
    use(home_dir .. '/manual-plugins/nvim-treesitter-master')
    -- Additional textobjects for treesitter.
    use(home_dir .. '/manual-plugins/nvim-treesitter-textobjects-master')
    -- Collection of configurations for builtin LSP client.
    use(home_dir .. '/manual-plugins/nvim-lspconfig-master')
    -- Autocompletion plugin
    use(home_dir .. '/manual-plugins/nvim-cmp-main')
    -- LSP source for nvim cmp
    use(home_dir .. '/manual-plugins/cmp-nvim-lsp-main')
    -- Snippets source for nvim cmp
    use(home_dir .. '/manual-plugins/cmp_luasnip-master')
    --  Snippets plugin
    use(home_dir .. '/manual-plugins/LuaSnip-master')
end)
-- if nil == packer["cmp_nvim_lsp"] then
--     -- failed to load plugins, are they installed?
--     print("failed to load cmp_nvim_lsp")
--     return
-- end
local cmp_module_name = "cmp_nvim_lsp"
if not pcall(require, cmp_module_name) then
    print(cmp_module_name .. " is not found")
    return
end
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pylsp' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup({
    capabilities = capabilities,
    -- cmd = {
    --   "clangd",
    --   "-completion-style=detailed",
    --   "--header-insertion=never",
    --   "-g -std=c++20"}
})

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-c>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      -- elseif has_words_before() then
      --   cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
}
