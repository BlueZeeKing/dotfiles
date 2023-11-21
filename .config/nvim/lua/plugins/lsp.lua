return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		opts = {
			inlay_hints = {
				show_parameter_hints = false,
			},
		},
		config = function(_, opts)
			local rust_tools = require("rust-tools")
			rust_tools.setup(opts)
			rust_tools.inlay_hints.enable()
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
}
