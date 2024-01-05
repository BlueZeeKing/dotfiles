return {
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>" },
		},
	},
	{
		"BlueZeeKing/onedark.nvim",
		opts = { style = "darker" },
		config = function(_, opts)
			require("onedark").setup(opts)
			require("onedark").load()
		end,
		priority = 1000,
	},
	{ "nvim-tree/nvim-web-devicons", config = true },
	{ "kdheepak/lazygit.nvim", keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>" },
	} },
	{ "lewis6991/gitsigns.nvim", config = true },
	{
		"echasnovski/mini.nvim",
		config = function(_, _)
			require("mini.surround").setup()
			require("mini.comment").setup()
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
	{
		"folke/trouble.nvim",
		opts = { position = "right" },
		keys = { {
			"<leader>xw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
		} },
	},
	"wakatime/vim-wakatime",
	"BlueZeeKing/dressing.nvim",
	{
		"rcarriga/nvim-notify",
		config = function(_, _)
			vim.notify = require("notify")
		end,
	},
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "InsertEnter",
	-- 	opts = {
	-- 		suggestion = { enabled = false },
	-- 		panel = { enabled = false },
	-- 	},
	-- },
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
}
