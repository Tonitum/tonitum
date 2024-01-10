local lsp_module_name = "lsp-zero"
if not pcall(require, lsp_module_name) then
  print("lsp-zero not loaded")
  return
end
local lsp = require("lsp-zero")

lsp.ensure_installed({
  'rust_analyzer',
  'pyright',
  'clangd',
  'yamlls',
})

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    set_lsp_keymaps = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "D", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>da", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
-- local words = {}

-- for word in io.open(path, "r"):lines() do
-- 	table.insert(words, word)
-- end

-- require('lspconfig').ltex.setup {
--    settings = {
--     ltex = {
--       configurationTarget = {
--           dictionary = path,
--       },
--       dictionary = { ["en-US"] = words },
--       java = {
--         path = "/usr/lib/jvm/java-17-openjdk-amd64/"
--       },
--     },
--    },
-- }

require('lspconfig').clangd.setup {
   filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

-- require('lspconfig').yamlls.setup {
--    filetypes = {"yaml"},
-- }


lsp.skip_server_setup({'jdtls'})

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
