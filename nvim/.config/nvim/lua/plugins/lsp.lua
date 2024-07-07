return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		lazy = false,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 10,
				},
			},
		},
		config = function(_, opts)
			require("fidget").setup(opts)
			vim.notify = require("fidget").notify
		end,
	},
	{
		"wojciech-kulik/xcodebuild.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("xcodebuild").setup({
				-- put some options here or leave it empty to use default settings
			})
		end,
	},
}
