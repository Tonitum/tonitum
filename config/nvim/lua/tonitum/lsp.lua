local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'D', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader>da', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>vf', function() vim.lsp.buf.format() end, opts)
end

-- lsp.set_preferences({
--   suggest_lsp_servers = false,
--   set_lsp_keymaps = false,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })

local cmp_lsp = require('cmp_nvim_lsp')
local cmp = require('cmp')
local capabilities = vim.tbl_deep_extend(
  'force',
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities())

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
  virtual_text = true,
})

require("fidget").setup()
require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_enable = {
    exclude = { "jdtls" },
  },
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  }),
  -- note: if you are going to use lsp-kind (another plugin)
  -- replace the line below with the function from lsp-kind
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText",
    },
  },
})

-- Configure language servers
vim.lsp.config['lua_ls'] = {
  -- Command and arguments to start the server.
  cmd = { 'lua-language-server' },
  capabilities = capabilities,
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  -- Sets the 'workspace' to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      runtime = {
        version = 'LuaJIT',
      }
    }
  }
}
vim.lsp.enable('lua_ls')

vim.lsp.config['clangd'] = {
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('clangd')

vim.lsp.config['yamlls'] = {
  settings = {
    yaml = {
      kubernetesCRDStore = {
        enabled = false
      }
    }
  },
  filetypes = { 'yaml', },
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('yamlls')

vim.lsp.config['jqls'] = {
  filetypes = { 'jq', 'avsc', 'json' },
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('jqls')

vim.lsp.config['helm-ls'] = {
  settings = {
    yamlls = {
      enabled = true,
      path = 'yaml-language-server',
      config = {
        kubernetesCRDStore = {
          enabled = true
        },
      }
    }
  },
  filetypes = { 'helm' },
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('helm-ls')

vim.lsp.config['gopls'] = {
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('gopls')

vim.lsp.config['basedpyright'] = {
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('basedpyright')
vim.lsp.config['ruff'] = {
  on_attach = on_attach,
  capabilities = capabilities,
}
vim.lsp.enable('ruff')
