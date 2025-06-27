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
      ensure_installed = { "vimdoc", "cpp", "python", "vim", "c", "lua", "rust" },

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
    }
  },
  "nvim-treesitter/nvim-treesitter-context",
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      local opts = {
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = {query = "@function.outer", desc = "Select all of function"},
              ["if"] = {query = "@function.inner", desc = "Select all of function"},
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
      require("nvim-treesitter.configs").setup(opts)
    end,
  }, -- Additional textobjects for treesitter.
  "nvim-treesitter/playground",
}
