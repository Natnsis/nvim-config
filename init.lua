vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true

-- indentation settings
vim.opt.tabstop = 2        -- Number of spaces tabs count for
vim.opt.shiftwidth = 2     -- Number of spaces used for each step of (auto)indent
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.smartindent = true -- Auto-indent new lines
vim.opt.autoindent = true  -- Copy indent from current line when starting a new one

-- leader key
vim.g.mapleader = " " -- set leader to space (you can change if you use another)

-- keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- <leader>kk to exit insert mode
keymap("i", "kk", "<Esc>", opts)

-- <leader>s to save
keymap("n", "<leader>w", ":w<CR>", opts)

-- <leader>q to quit
keymap("n", "<leader>q", ":q<CR>", opts)

-- optional: save + quit quickly
keymap("n", "<leader>wq", ":wq<CR>", opts)

--Terminal
-- Open floating terminal
vim.keymap.set("n", "<leader>T", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- Optional: toggle last terminal
vim.keymap.set("n", "<leader>TT", ":ToggleTermToggleAll<CR>", { noremap = true, silent = true })

--Github
-- Navigate hunks
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
-- Actions
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })

--Comment
-- Normal mode toggle comment
vim.keymap.set("n", "gcc", "<cmd>CommentToggle<CR>", { noremap = true, silent = true })
-- Visual mode toggle comment
vim.keymap.set("v", "gc", "<cmd>CommentToggle<CR>", { noremap = true, silent = true })

--Todo-Comments
-- Jump between TODOs
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { noremap = true, silent = true })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { noremap = true, silent = true })
-- Search TODOs in project (requires Telescope)
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true })

-- user commands
vim.api.nvim_create_user_command('NvimConfig', 'cd ~/.config/nvim', {})
vim.api.nvim_create_user_command('ZelConfig', 'cd ~/.config/zellij', {})
vim.api.nvim_create_user_command('AlaConfig', 'cd ~/.config/alacritty', {})
vim.api.nvim_create_user_command('CodiumConfig', 'cd ~/.config/VSCodium', {})
vim.api.nvim_create_user_command('CodeConfig', 'cd ~/.config/Code', {})
vim.api.nvim_create_user_command('Projects', 'cd ~/Documents', {})

--error show
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

require("config.lazy")
