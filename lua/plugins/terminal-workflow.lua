-- Terminal workflow
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      size = 20,
      open_mapping = [[<leader>t]],
      direction = "float",
      float_opts = { border = "curved" },
    }
  end,
}
