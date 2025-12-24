return {
  "goolord/alpha-nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local theta = require("alpha.themes.theta")

    -- 🔥 Change ONLY the big text
    theta.header.val = {
      " ██████╗ ██████╗  ██████╗ █████╗ ",
      "██╔═══██╗██╔══██╗██╔════╝██╔══██╗",
      "██║   ██║██████╔╝██║     ███████║",
      "██║   ██║██╔══██╗██║     ██╔══██║",
      "╚██████╔╝██║  ██║╚██████╗██║  ██║",
      " ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝",
      "",
      "          O R C A - D E V          ",
    }

    -- optional: change color
    theta.header.opts.hl = "Type" -- try: "Constant", "Statement"

    alpha.setup(theta.config)
  end,
}
