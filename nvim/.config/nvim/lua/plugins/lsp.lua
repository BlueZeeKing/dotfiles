return {
	{ "neovim/nvim-lspconfig" },
	{
		"saghen/blink.cmp",
		dependencies = { {
			"Kaiser-Yang/blink-cmp-git",
		} },
		version = "*",
		opts = {
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
		},
		-- opts_extend = { "sources.default" },
	},
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
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>dl",
				function()
					require("dap").step_into()
				end,
			},
			{
				"<leader>dj",
				function()
					require("dap").step_over()
				end,
			},
			{
				"<leader>dh",
				function()
					require("dap").step_out()
				end,
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
			},
			{
				"<leader>dq",
				function()
					require("dap").terminate()
				end,
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
			},
			{
				"<leader>dw",
				function()
					local widgets = require("dap.ui.widgets")
					local left_bar = widgets.sidebar(widgets.frames, {}, "45 vsplit")
					left_bar.open()
					local right_bar = widgets.sidebar(widgets.scopes, {}, "belowright 45 vsplit")
					right_bar.open()
				end,
			},
			{
				"<leader>dk",
				function()
					require("dap.ui.widgets").hover()
				end,
			},
		},
	},
}
