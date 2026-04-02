vim.pack.add({
	"https://github.com/mbbill/undotree",
	"https://github.com/catppuccin/nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/mrjones2014/smart-splits.nvim",
})

require("catppuccin").setup({
	integrations = { mini = { indentscope_color = "surface0" } },
})

vim.cmd.colorscheme("catppuccin-mocha")

require("snacks").setup({
	picker = {},
	dim = {
		filter = function(buf)
			return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
		end,
	},
	input = {},
	notifier = {},
})

require("mini.surround").setup()
require("mini.comment").setup()
require("mini.bracketed").setup()
require("mini.icons").setup()
require("mini.basics").setup()
require("mini.jump").setup()
require("mini.indentscope").setup({
	draw = {
		delay = 0,
		animation = require("mini.indentscope").gen_animation.none(),
	},
	symbol = "│",
})

require("oil").setup({
	float = {
		padding = 6,
		max_width = 175,
		max_height = 70,
	},
	keymaps = {
		["'"] = "actions.parent",
		["<CR>"] = "actions.select",
	},
})
