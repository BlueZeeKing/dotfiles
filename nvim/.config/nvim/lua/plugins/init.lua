return {
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>" },
		},
	},
	{
		"navarasu/onedark.nvim",
		opts = { style = "darker" },
		config = function(_, opts)
			require("onedark").setup(opts)
			require("onedark").load()
		end,
		priority = 1000,
	},
	{ "nvim-tree/nvim-web-devicons", config = true },
	{
		"echasnovski/mini.nvim",
		config = function(_, _)
			require("mini.surround").setup()
			require("mini.comment").setup()
			require("mini.bracketed").setup()
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
	-- "wakatime/vim-wakatime",
	"stevearc/dressing.nvim",
	"folke/tokyonight.nvim",
	"tpope/vim-sleuth",
	{
		"letieu/btw.nvim",
		config = function()
			require("btw").setup({
				text = vim.fn.system({ "misfortune" }),
			})
		end,
	},
}
