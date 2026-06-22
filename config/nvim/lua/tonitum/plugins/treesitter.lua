return {
  -- Highlight, edit, and navigate code using a fast incremental parsing library.
  -- Treesitter is used by nvim for various things,
  -- but among others, for syntax coloring.
  -- Make sure that any themes you install support treesitter!
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      -- A list of parser names, or "all"
      ensure_installed = {
        "vimdoc",
        "cpp",
        "python",
        "vim",
        "c",
        "lua",
        "rust",
        "markdown",
        "markdown_inline",
        "html",
        "yaml",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
      auto_install = true,
      textobjects = { enable = true },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      local query = require("vim.treesitter.query")

      local aliases = {
        ex = "elixir",
        pl = "perl",
        sh = "bash",
        ts = "typescript",
        uxn = "uxntal",
      }

      local function first_node(match, id)
        local node = match[id]
        if type(node) == "table" then
          return node[1]
        end
        return node
      end

      -- Neovim 0.12 passes directive captures as TSNode[]; nvim-treesitter
      -- currently expects a TSNode here.
      query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
        local node = first_node(match, pred[2])
        if not node then
          return
        end

        local lang = vim.treesitter.get_node_text(node, bufnr):lower()
        metadata["injection.language"] = vim.filetype.match({
          filename = "a." .. lang,
        }) or aliases[lang] or lang
      end, { force = true })
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      local opts = {
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = { query = "@function.outer", desc = "Select all of function" },
              ["if"] = { query = "@function.inner", desc = "Select all of function" },
              ["ac"] = { query = "@class.outer", desc = "Select inner part of a class region" },
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
          }
        }
      }
      require("nvim-treesitter-textobjects").setup(opts)
    end,
  }, -- Additional textobjects for treesitter.
}
