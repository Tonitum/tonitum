return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    provider = "openai",
    auto_suggestions_provider = "openai",
    openai = {
      api_key_name = "OPENAI_API_KEY",
      disable_tools = true,
      endpoint = os.getenv("OPENAI_API_URL"),
      model = "llama-3.3-70b-instruct", -- your desired model (or use gpt-4o, etc.)
      temperature = 0,
      timeout = 30000,                  -- Timeout in milliseconds, increase this for reasoning models
    },
    behaviour = {
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
      minimize_diff = true,
    },
    mappings = {
      ---@class AvanteConflictMappings
      suggestion = {
        accept = "<C-y>",
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-x>",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
