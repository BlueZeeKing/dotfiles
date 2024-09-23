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
		"jakemason/ouroboros",
		opts = {
			extension_preferences_table = {
				c = { h = 2, hpp = 1 },
				h = { c = 2, cpp = 1 },
				cpp = { hpp = 1, h = 2 },
				hpp = { cpp = 2, c = 1 },
			},
		},
		keys = {
			{
				"gh",
				function()
					require("ouroboros").switch()
				end,
			},
		},
	},
}
