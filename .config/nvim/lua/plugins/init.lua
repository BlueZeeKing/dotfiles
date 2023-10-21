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
	"wakatime/vim-wakatime",
	{
		"simrat39/symbols-outline.nvim",
		config = true,
		keys = {
			{ "<leader>so", "<cmd>SymbolsOutline<cr>" },
		},
	},
	{
		"echasnovski/mini.nvim",
		config = function(_, _)
			require("mini.surround").setup()
			require("mini.comment").setup()
		end,
	},
	"BlueZeeKing/dressing.nvim",
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
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
	"rcarriga/nvim-notify",
	{ "folke/trouble.nvim", config = true },
	"mhartington/formatter.nvim",
}
