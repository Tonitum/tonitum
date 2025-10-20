return {
  { "tpope/vim-commentary" }, -- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
  { "tpope/vim-surround" },   -- change text wrappers e.g. " " ()
  {
    "ojroques/nvim-osc52",

    keys = {
      { "<leader>c",  nil, expr = true },
      { "<leader>cc", nil, remap = true },
      { "<leader>cc", nil, mode = "v" }
    },
    config = function()
      vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
      vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
      vim.keymap.set("v", "<leader>c", require("osc52").copy_visual)
      local function copy()
        if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
          require("osc52").copy_register("+")
        end
      end

      -- vim.api.nvim_create_autocmd("TextYankPost", {callback = copy})
    end
  },
  {
    -- whichkey
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },
  {
    "mbbill/undotree",

    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
  -- {
  --   "Chaitanyabsprip/present.nvim",
  --   ft = "markdown",
  --   build = function()
  --     require("present").setup {}
  --   end
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "npx --yes yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_auto_start = 0
    end
  }
}
