return {
	{
		"simrat39/rust-tools.nvim",
        ft = "rust",
		config = function(_, _)
			local rust_tools = require("rust-tools")
			rust_tools.setup()
			rust_tools.inlay_hints.enable()
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function(_, _)
			local lsp = require("lsp-zero")
			lsp.extend_lspconfig()

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["tsserver"] = { "javascript", "typescript" },
					["rust_analyzer"] = { "rust" },
				},
			})
		end,
	},
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{
		"hrsh7th/nvim-cmp",
		events = "VeryLazy",
		config = function(_, _)
			require("cmp").setup({
				mapping = {
					["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
				},
			})
		end,
	},
	{ "L3MON4D3/LuaSnip", event = "VeryLazy" },
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		events = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", "VonHeikemen/lsp-zero.nvim" },
		config = function(_, _)
			local lsp = require("lsp-zero")
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"rust_analyzer",
					"taplo",
					"gopls",
				},
				handlers = {
					lsp.default_setup,
					rust_analyzer = lsp.noop,
					jdtls = lsp.noop,
				},
			})
		end,
	},
}
