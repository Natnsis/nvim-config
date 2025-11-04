return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},

	opts = {
		filesystem = {
			filtered_items = {
				visible = true,        -- show filtered items (like dotfiles)
				hide_dotfiles = false, -- don't hide dotfiles
				hide_gitignored = false, -- don't hide gitignored files
			},

			window = {
				position = "right",
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
