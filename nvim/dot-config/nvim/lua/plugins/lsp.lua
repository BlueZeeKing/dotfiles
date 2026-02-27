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
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function(_, opts)
			require("dapui").setup()

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
			  dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
			  dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
			  dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
			  dapui.close()
			end
		end,
	},
}
