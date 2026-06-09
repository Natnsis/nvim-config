-- lua/configs/blankline.lua
local ibl = require("ibl")

local colors = {
    "#ff6b6b",
    "#feca57",
    "#54a0ff",
    "#ff9f43",
    "#1dd1a1",
    "#a29bfe",
    "#00d2d3",
}

local highlights = {}
for i = 1, #colors do
    local hl_group = string.format("RainbowIndent%d", i)
    vim.api.nvim_command(string.format("highlight %s guifg=%s", hl_group, colors[i]))
    table.insert(highlights, hl_group)
end

ibl.setup({
    indent = {
        char = "│",
    },
    whitespace = {
        remove_blankline_trail = true,
    },
    scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = highlights,
    },
    exclude = {
        filetypes = {
            "help", "dashboard", "NvimTree", "lazy", "mason",
            "notify", "toggleterm", "alpha", "gitcommit"
        },
    },
})
