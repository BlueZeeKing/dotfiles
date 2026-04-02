vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.0") },
	"https://github.com/Kaiser-Yang/blink-cmp-git",
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/mfussenegger/nvim-jdtls",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/jakemason/ouroboros",
	"https://github.com/nvim-lua/plenary.nvim",
})

require("blink.cmp").setup({
	fuzzy = { implementation = "rust" },
	keymap = {
		preset = "default",
	},
	completion = { documentation = {
		auto_show = true,
		auto_show_delay_ms = 1000,
	} },
	sources = {
		default = { "git", "lsp", "path", "snippets", "buffer" },
		providers = {
			git = {
				module = "blink-cmp-git",
				name = "Git",
				opts = {},
			},
		},
	},
})

require("fidget").setup({
	notification = {
		window = {
			winblend = 10,
		},
	},
})

require("ouroboros").setup({
	extension_preferences_table = {
		c = { h = 2, hpp = 1 },
		h = { c = 2, cpp = 1 },
		cpp = { hpp = 1, h = 2 },
		hpp = { cpp = 2, c = 1 },
	},
})
