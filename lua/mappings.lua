require "nvchad.mappings"

-- remove theme switching
vim.keymap.del("n", "<leader>th")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader><leader>", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

