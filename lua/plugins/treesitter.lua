return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts_configs = require("nvim-treesitter.configs")
    ts_configs.setup({
      ensure_installed = { "python", "java", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript" },
      sync_install     = false,
      auto_install     = true,
      highlight        = { enable = true },
      indent           = { enable = true },
    })
  end,
}
