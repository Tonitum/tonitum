return {
  "folke/trouble.nvim",
  -- trouble
  tag = "v3.5.1",
  cmd = "Trouble",
  opts = {
    focus = true,
    open_no_results = true,
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics focus<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xd",
      "<cmd>Trouble diagnostics focus filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist focus<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>q",
      "<cmd>Trouble qflist focus<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  lazy = true
  -- tag = "v2.10.0",
  -- config = function()
  --   require("trouble").setup({
  --     icons = true,
  --     mode = "quickfix",
  --   })
  --   vim.keymap.set("n", "<leader>q", "<cmd>Trouble<cr>",
  --     {silent = true, noremap = true}
  --   )
  --   vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  --     {silent = true, noremap = true}
  --   )
  --   vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  --     {silent = true, noremap = true}
  --   )
  --   vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  --     {silent = true, noremap = true}
  --   )
  --   vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle telescope<cr>",
  --     {silent = true, noremap = true}
  --   )
  --   vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  --     {silent = true, noremap = true}
  --   )
  --   vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  --     {silent = true, noremap = true}
  --   )
  -- end
}
