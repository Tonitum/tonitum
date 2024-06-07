return {"folke/trouble.nvim",
  -- trouble
  tag = "v2.10.0",
  config = function()
    require("trouble").setup({
      icons = true,
      mode = "quickfix",
    })
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "<leader>q", "<cmd>Trouble<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle telescope<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
      {silent = true, noremap = true}
    )
    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
      {silent = true, noremap = true}
    )
  end
}
