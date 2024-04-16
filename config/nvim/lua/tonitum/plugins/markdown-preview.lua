-- install without yarn or npm
return  {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function ()
    vim.g.mkdp_open_to_the_world = 1
    vim.g.mkdp_port = 24603
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_open_ip = '127.0.0.1'
    vim.g.mkdp_auto_start = 1
  end
}
