return {
  {
    "VonHeikemen/lsp-zero.nvim",
    -- lsp-zero
    branch = "v3.x",
    event = "VeryLazy",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },

      -- ui
      { "j-hui/fidget.nvim", }
    },
    config = function()
      local lsp = require("lsp-zero")
      local cmp_lsp = require("cmp_nvim_lsp")
      local cmp = require('cmp')

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      require('fidget').setup()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'yamlls',
          -- 'pyright',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              capabilities = capabilities
            })
          end,
          ["jdtls"] = lsp.noop,
          ["clangd"] = function()
            local opts = {
              filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            }
            require('lspconfig').clangd.setup(opts)
          end,
          ["lua_ls"] = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
          ["jqls"] = function()
            local lua_opts = {
              filetypes = { "jq", "avsc", "json" }
            }
            require('lspconfig').jqls.setup(lua_opts)
          end,
          ["yamlls"] = function()
            local lua_opts = {
              filetypes = { "yaml" },
            }
            require('lspconfig').yamlls.setup(lua_opts)
          end
        },
      })

      lsp.preset("recommended")

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ['<Tab>'] = nil,
          ['<S-Tab>'] = nil
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'path' },
          { name = 'luasnip' }, -- For luasnip users.
        }),
        -- note: if you are going to use lsp-kind (another plugin)
        -- replace the line below with the function from lsp-kind
        formatting = lsp.cmp_format(),
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
      })

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
        virtual_text = true,
        document_highlight = {
          enabled = true,
        },
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
        local opts = { buffer = bufnr, remap = false }
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
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format() end, opts)
      end)

      lsp.setup()
    end
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "towolf/vim-helm",
    ft = "helm"
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java"
  },
}
