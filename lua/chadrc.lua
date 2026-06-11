-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  hl_override = {
    Normal = { bg = "#000000", fg = "#ffffff" },
    Comment = { fg = "#a6e3a1" },
    String = { fg = "#a6e3a1" },
    Constant = { fg = "#a6e3a1" },
    Keyword = { fg = "#89b4fa" },
    Function = { fg = "#89b4fa" },
    Type = { fg = "#89b4fa" },
    Identifier = { fg = "#89b4fa" },
    LineNr = { fg = "#ffffff" },
    CursorLineNr = { fg = "#89b4fa" },
    Visual = { bg = "#89b4fa", fg = "#000000" },
    -- light orange
    ["@constant.builtin"] = { fg = "#fab387" },
    ["@type.builtin"] = { fg = "#fab387" },
    ["@function.builtin"] = { fg = "#fab387" },
    ["@property"] = { fg = "#fab387" },
    ["@attribute"] = { fg = "#fab387" },
    ["@string.special"] = { fg = "#fab387" },
    -- light purple
    ["@parameter"] = { fg = "#cba6f7" },
    ["@variable"] = { fg = "#cba6f7" },
    ["@field"] = { fg = "#cba6f7" },
    ["@constructor"] = { fg = "#cba6f7" },
    ["@include"] = { fg = "#cba6f7" },
    ["@operator"] = { fg = "#cba6f7" },
  },
}

M.nvdash = {
  load_on_startup = function()
    return vim.fnargc() == 0
  end,
  header = {
    "",
    "    ╔══════════════════════════════════╗",
    "    ║  ███╗   ██╗███████╗██████╗ ██╗  ║",
    "    ║  ████╗  ██║██╔════╝██╔══██╗██║  ║",
    "    ║  ██╔██╗ ██║█████╗  ██████╔╝██║  ║",
    "    ║  ██║╚██╗██║██╔══╝  ██╔══██╗██║  ║",
    "    ║  ██║ ╚████║███████╗██║  ██║██║  ║",
    "    ║  ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ║",
    "    ╚══════════════════════════════════╝",
    "",
    "             Build till We Win!",
    "",
  },
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.loaded .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    { txt = "", hl = "NvDashFooter", no_gap = true },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nvdash",
  callback = function(args)
    vim.keymap.set("n", "q", function()
      vim.cmd "enew"
      vim.api.nvim_buf_delete(args.buf, { force = true })
    end, { buffer = args.buf, desc = "close dashboard, open empty buffer" })
  end,
})

return M
