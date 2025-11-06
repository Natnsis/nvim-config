return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "darker", -- options: dark, darker, cool, deep, warm, warmer, light
			transparent = false,
			code_style = {
				comments = "italic",
				keywords = "italic",
				functions = "none",
				strings = "none",
				variables = "none",
			},
		})
		require("onedark").load()
	end,
}
