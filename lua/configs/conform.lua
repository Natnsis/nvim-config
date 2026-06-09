local options = {
    formatters_by_ft = {
        -- Lua
        lua = { "stylua" },

        -- JavaScript / TypeScript
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },

        -- Go
        go = { "gofumpt" },

    },

    format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
    },
}

return options
