return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- formatter
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.prettier, -- js / ts / jsx / tsx
				null_ls.builtins.formatting.black, -- python
				null_ls.builtins.formatting.isort, -- python
				-- linter
				null_ls.builtins.diagnostics.eslint,
			},
		})

		-- manual format shortcuts
		vim.keymap.set("n", "<leader>w", vim.lsp.buf.format, {})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- ✅ format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
