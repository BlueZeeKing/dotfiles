return {
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>" },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = { mini = { indentscope_color = "surface0" } },
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			picker = {},
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "startup" },
					function()
						require("mini.trailspace").unhighlight()
					end,
				},
			},
			notifier = {},
		},
	},
	{
		"echasnovski/mini.nvim",
		config = function(_, _)
			require("mini.surround").setup()
			require("mini.comment").setup()
			require("mini.bracketed").setup()
			require("mini.icons").setup()
			require("mini.basics").setup()
			require("mini.jump").setup()
			require("mini.clue").setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- Built-in completion
					{ mode = "i", keys = "<C-x>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					require("mini.clue").gen_clues.builtin_completion(),
					require("mini.clue").gen_clues.g(),
					require("mini.clue").gen_clues.marks(),
					require("mini.clue").gen_clues.registers(),
					require("mini.clue").gen_clues.windows(),
					require("mini.clue").gen_clues.z(),
				},
			})
			require("mini.indentscope").setup({
				draw = {
					delay = 0,
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = "│",
			})
			require("mini.trailspace").setup()
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
	"tpope/vim-sleuth",
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- {
	-- 	dir = "/home/brayden/Documents/Coding/Rust/code-statistics/code-statistics.nvim",
	-- 	opts = {},
	-- },
}
