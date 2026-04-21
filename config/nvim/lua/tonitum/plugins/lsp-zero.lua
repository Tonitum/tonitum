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
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      require("fidget").setup()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "yamlls",
          -- "pyright",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities
            })
          end,
          ["jdtls"] = lsp.noop,
          ["clangd"] = function()
            local opts = {
              filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
            }
            require("lspconfig").clangd.setup(opts)
          end,
          ["lua_ls"] = function()
            local lua_opts = lsp.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
          ["jqls"] = function()
            local lua_opts = {
              filetypes = { "jq", "avsc", "json" }
            }
            require("lspconfig").jqls.setup(lua_opts)
          end,
          ["yamlls"] = function()
            local lua_opts = {
              filetypes = { "yaml" },
            }
            require("lspconfig").yamlls.setup(lua_opts)
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
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "path" },
          { name = "luasnip" }, -- For luasnip users.
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
          error = "E",
          warn = "W",
          hint = "H",
          info = "I"
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
    ft = "java",
    config = function()
      local java_cmds = vim.api.nvim_create_augroup("java_cmds", { clear = true })
      local cache_vars = {}

      -- `nvim-jdtls` will look for these files/folders
      -- to determine the root directory of your project
      local root_files = {
        ".git",
        "mvnw",
        "gradlew",
        "pom.xml",
        "build.gradle",
      }

      local features = {
        -- change this to `true` to enable codelens
        codelens = false,

        -- change this to `true` if you have `nvim-dap`,
        -- `java-test` and `java-debug-adapter` installed
        debugger = true,
      }

      local function get_jdtls_paths()
        if cache_vars.paths then
          return cache_vars.paths
        end

        local path = {}

        path.data_dir = vim.fn.stdpath("cache") .. "/nvim-jdtls"

        local jdtls_install = require("mason-registry")
            .get_package("jdtls")
            :get_install_path()
        -- local jdtls_root = vim.env.HOME .. "/.local/share/jdtls/"
        -- local jdtls_install = jdtls_root .. "/jdtls-v1.28.0"
        -- local jdtls_install = jdtls_root .. "/jdtls-v1.27.1"

        path.java_agent = jdtls_install .. "/lombok.jar"
        path.launcher_jar = vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar")

        if vim.fn.has("mac") == 1 then
          path.platform_config = jdtls_install .. "/config_mac"
        elseif vim.fn.has("unix") == 1 then
          path.platform_config = jdtls_install .. "/config_linux"
        elseif vim.fn.has("win32") == 1 then
          path.platform_config = jdtls_install .. "/config_win"
        end

        path.bundles = {}

        ---
        -- Include java-test bundle if present
        ---
        local java_test_path = require("mason-registry")
            .get_package("java-test")
            :get_install_path()

        local java_test_bundle = vim.split(
          vim.fn.glob(java_test_path .. "/extension/server/*.jar"),
          "\n"
        )

        if java_test_bundle[1] ~= "" then
          vim.list_extend(path.bundles, java_test_bundle)
        end

        ---
        -- Include java-debug-adapter bundle if present
        ---
        local java_debug_path = require("mason-registry")
            .get_package("java-debug-adapter")
            :get_install_path()

        local java_debug_bundle = vim.split(
          vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
          "\n"
        )

        if java_debug_bundle[1] ~= "" then
          vim.list_extend(path.bundles, java_debug_bundle)
        end

        ---
        -- Useful if you"re starting jdtls with a Java version that"s
        -- different from the one the project uses.
        ---
        path.runtimes = {
          -- Note: the field `name` must be a valid `ExecutionEnvironment`,
          -- you can find the list here:
          -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
          --
          -- This example assume you are using sdkman: https://sdkman.io
          -- {
          --   name = "JavaSE-17",
          --   path = vim.fn.expand("~/.sdkman/candidates/java/17.0.6-tem"),
          -- },
        }

        cache_vars.paths = path
        return path
      end

      local function enable_debugger(bufnr)
        require("jdtls").setup_dap({ hotcodereplace = "auto" })
        require("jdtls.dap").setup_dap_main_class_configs()

        local opts = { buffer = bufnr }
        vim.keymap.set("n", "<leader>df", "<cmd>lua require('jdtls').test_class()<cr>", opts)
        vim.keymap.set("n", "<leader>dm", "<cmd>lua require('jdtls').test_nearest_method()<cr>", opts)
      end

      local function jdtls_on_attach(client, bufnr)
        ---
        -- This function will be executed everytime jdtls
        -- gets attached to a file.
        -- Here we will create the keybindings.
        ---
        if features.debugger then
          enable_debugger(bufnr)
        end

        -- The following mappings are based on the suggested usage of nvim-jdtls
        -- https://github.com/mfussenegger/nvim-jdtls#usage
        -- vim.keymap.set("n", "<A-o>", "<cmd>lua require("jdtls").organize_imports()<cr>", opts)
        -- vim.keymap.set("n", "crv", "<cmd>lua require("jdtls").extract_variable()<cr>", opts)
        -- vim.keymap.set("x", "crv", "<esc><cmd>lua require("jdtls").extract_variable(true)<cr>", opts)
        -- vim.keymap.set("n", "crc", "<cmd>lua require("jdtls").extract_constant()<cr>", opts)
        -- vim.keymap.set("x", "crc", "<esc><cmd>lua require("jdtls").extract_constant(true)<cr>", opts)
        -- vim.keymap.set("x", "crm", "<esc><Cmd>lua require("jdtls").extract_method(true)<cr>", opts)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "D", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>jc", "<cmd>JdtCompile<CR>", opts)
      end


      local function jdtls_setup(event)
        local jdtls = require("jdtls")

        local path = get_jdtls_paths()
        local data_dir = path.data_dir .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        if cache_vars.capabilities == nil then
          jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

          local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
          cache_vars.capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            ok_cmp and cmp_lsp.default_capabilities() or {}
          )
        end

        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        local cmd = {
          "/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. path.java_agent,
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          path.launcher_jar,
          "-configuration",
          path.platform_config,
          "-data",
          data_dir,
        }

        local lsp_settings = {
          java = {
            jdt = {
              ls = {
                java = {
                  home = "/usr/lib/jvm/java-11-openjdk-amd64/"
                },
              },
            },
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
              runtimes = path.runtimes,
            },
            maven = {
              downloadSources = true,
              globalSettings = jdtls.setup.find_root(root_files) .. "/.m2/settings.xml",
              userSettings = jdtls.setup.find_root(root_files) .. "/.m2/settings-security.xml"
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            format = {
              enabled = true,
            }
          },
          signatureHelp = {
            enabled = true,
          },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
          },
          contentProvider = {
            preferred = "fernflower",
          },
          extendedClientCapabilities = jdtls.extendedClientCapabilities,
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            }
          },
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
          },
        }

        -- This starts a new client & server,
        -- or attaches to an existing client & server depending on the `root_dir`.
        jdtls.start_or_attach({
          cmd = cmd,
          settings = lsp_settings,
          on_attach = jdtls_on_attach,
          capabilities = cache_vars.capabilities,
          root_dir = jdtls.setup.find_root(root_files),
          flags = {
            allow_incremental_sync = true,
          },
          init_options = {
            bundles = path.bundles,
          },
        })
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = java_cmds,
        pattern = { "java" },
        desc = "Setup jdtls",
        callback = jdtls_setup,
      })
    end
  },
  { "rafamadriz/friendly-snippets" }
}
