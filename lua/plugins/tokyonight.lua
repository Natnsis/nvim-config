return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- mocha, macchiato, frappe, latte
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
        functions = {},
        variables = {},
        strings = {},
      },
      color_overrides = {},
      highlight_overrides = {
        mocha = {
          -- optional: tweak specific colors
          Normal = { bg = "#1e1e2e" }, -- like VSCode dark
          Comment = { fg = "#6c7086", style = { "italic" } },
        },
      },
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
