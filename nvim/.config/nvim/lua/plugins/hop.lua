return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					jump_labels = true,
				},
			},
		},
		keys = {
			{
				"<C-h>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},
}
