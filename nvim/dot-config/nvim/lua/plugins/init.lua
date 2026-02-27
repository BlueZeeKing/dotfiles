return {
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>" },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = { mini = { indentscope_color = "surface0" } },
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			picker = {},
			dim = {
				filter = function(buf)
					return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
				end,
			},
			input = {},
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "startup" },
					function()
						require("mini.trailspace").unhighlight()
					end,
				},
			},
			notifier = {},
		},
	},
	{
		"echasnovski/mini.nvim",
		config = function(_, _)
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
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			float = {
				padding = 6,
				max_width = 175,
				max_height = 70,
			},
			keymaps = {
				["'"] = "actions.parent",
				["<CR>"] = "actions.select",
			},
		},
		keys = {
			{
				"<leader>pv",
				function()
					require("oil").open_float()
				end,
			},
		},
	},
	"tpope/vim-sleuth",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "mrjones2014/smart-splits.nvim" },
	-- {
	-- 	dir = "/home/brayden/Documents/Coding/Rust/code-statistics/code-statistics.nvim",
	-- 	opts = {},
	-- },
}
