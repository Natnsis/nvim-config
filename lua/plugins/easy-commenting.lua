-- Easy commenting
return {
  "numToStr/Comment.nvim",
  keys = { "gcc", "gbc" },
  config = function()
    require("Comment").setup {}
  end,
}
