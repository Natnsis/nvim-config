require "nvchad.autocmds"

-- Close nvdash dashboard with q
vim.api.nvim_create_autocmd("FileType", {
  pattern = "Nvdash",
  callback = function()
    vim.keymap.set("n", "q", function()
      vim.cmd "bd"
    end, { buffer = true, desc = "Close nvdash dashboard" })
  end,
})
