-- lua/configs/lspconfig.lua

-- Load NvChad's default LSP settings
require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  ["ts_ls"] = {},
  ["gopls"] = {},
  ["html"] = { filetypes = { "html" } },
  ["css"] = { filetypes = { "css", "scss", "less" } },
  ["emmet_language_server"] = {
    filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript", "vue" },
  },
  ["tailwindcss"] = {
    filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact" },
  },
}

for server, opts in pairs(servers) do
  vim.lsp.config(
    server,
    vim.tbl_deep_extend("force", {
      on_attach = on_attach,
      capabilities = capabilities,
    }, opts)
  )
end

vim.lsp.enable(vim.tbl_keys(servers))
