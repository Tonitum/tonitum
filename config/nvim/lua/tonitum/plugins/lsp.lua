return {
  {
    "towolf/vim-helm",
    ft = "helm"
  },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  -- ui
  { "j-hui/fidget.nvim", },
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
        codelens = false,
        debugger = true,
      }

      local function mason_package_path(package)
        local ok, registry = pcall(require, "mason-registry")
        if ok then
          local has_package, pkg = pcall(function()
            return registry.get_package(package)
          end)
          if has_package and pkg then
            local installed = true
            if type(pkg.is_installed) == "function" then
              installed = pkg:is_installed()
            end

            if installed then
              if type(pkg.get_install_path) == "function" then
                return pkg:get_install_path()
              end

              if type(pkg.install_path) == "string" then
                return pkg.install_path
              end
            end
          end
        end

        local fallback = vim.fn.stdpath("data") .. "/mason/packages/" .. package
        if (vim.uv or vim.loop).fs_stat(fallback) then
          return fallback
        end

        return nil
      end

      local function get_jdtls_paths()
        if cache_vars.paths then
          return cache_vars.paths
        end

        local path = {}

        path.data_dir = vim.fn.stdpath("cache") .. "/nvim-jdtls"

        local jdtls_install = mason_package_path("jdtls")
        if not jdtls_install then
          return nil
        end

        path.launcher_jar = vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar")

        if vim.fn.has("mac") == 1 then
          path.platform_config = jdtls_install .. "/config_mac"
        elseif vim.fn.has("unix") == 1 then
          path.platform_config = jdtls_install .. "/config_linux"
        elseif vim.fn.has("win32") == 1 then
          path.platform_config = jdtls_install .. "/config_win"
        end

        path.bundles = {}

        local java_test_path = mason_package_path("java-test")
        if java_test_path then
          local java_test_bundle = vim.split(
            vim.fn.glob(java_test_path .. "/extension/server/*.jar"),
            "\n"
          )

          if java_test_bundle[1] ~= "" then
            vim.list_extend(path.bundles, java_test_bundle)
          end
        end

        local java_debug_path = mason_package_path("java-debug-adapter")
        if java_debug_path then
          local java_debug_bundle = vim.split(
            vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
            "\n"
          )

          if java_debug_bundle[1] ~= "" then
            vim.list_extend(path.bundles, java_debug_bundle)
          end
        end

        cache_vars.paths = path
        return path
      end

      local function enable_debugger(bufnr)
        if not mason_package_path("java-debug-adapter") then
          return
        end

        require("jdtls").setup_dap({ hotcodereplace = "auto" })
        require("jdtls.dap").setup_dap_main_class_configs()

        local opts = { buffer = bufnr }
        vim.keymap.set("n", "<leader>df", "<cmd>lua require('jdtls').test_class()<cr>", opts)
        vim.keymap.set("n", "<leader>dm", "<cmd>lua require('jdtls').test_nearest_method()<cr>", opts)
      end

      local function jdtls_on_attach(client, bufnr)
        if features.debugger then
          enable_debugger(bufnr)
        end

        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "D", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>jc", "<cmd>JdtCompile<CR>", opts)
      end


      local function jdtls_setup(event)
        local jdtls = require("jdtls")

        local path = get_jdtls_paths()
        if not path then
          vim.notify("jdtls is not installed via Mason", vim.log.levels.WARN)
          return
        end

        local root_dir = jdtls.setup.find_root(root_files)
        if not root_dir then
          return
        end

        local data_dir = path.data_dir .. "/" .. vim.fs.basename(root_dir)

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
        local java_bin = vim.fn.exepath("java")
        if java_bin == "" then
          vim.notify("java executable not found in PATH", vim.log.levels.ERROR)
          return
        end

        local cmd = {
          java_bin,
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
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
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
            },
            maven = {
              downloadSources = true,
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
          root_dir = root_dir,
          flags = {
            allow_incremental_sync = true,
          },
          init_options = {
            bundles = path.bundles,
          },
        })
      end

      if vim.bo.filetype == "java" then
        jdtls_setup({ buf = vim.api.nvim_get_current_buf() })
      end

      vim.api.nvim_create_autocmd("BufEnter", {
        group = java_cmds,
        pattern = { "*.java" },
        desc = "Setup jdtls",
        callback = jdtls_setup,
      })
    end
  },
  { "rafamadriz/friendly-snippets" }
}
