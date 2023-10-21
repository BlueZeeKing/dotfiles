return {
	{
		"phaazon/hop.nvim",
		config = true,
		keys = {
			{
				"f",
				function()
					require("hop").hint_char1({
						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
						current_line_only = true,
					})
				end,
			},
			{
				"F",
				function()
					require("hop").hint_char1({
						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
						current_line_only = true,
					})
				end,
			},

			{
				"t",
				function()
					require("hop").hint_char1({
						direction = require("hop.hint").HintDirection.AFTER_CURSOR,
						current_line_only = true,
						hint_offset = -1,
					})
				end,
			},
			{
				"T",
				function()
					require("hop").hint_char1({
						direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
						current_line_only = true,
						hint_offset = -1,
					})
				end,
			},
			{
				"<leader>hh",
				function()
					vim.ui.input({ prompt = "", length = 2, width = 5 }, function(response)
						local hop = require("hop")
						local jump_target = require("hop.jump_target")

						hop.hint_with(
							jump_target.jump_targets_by_scanning_lines(
								jump_target.regex_by_case_searching(response, true, hop.opts)
							),
							hop.opts
						)
					end)
				end,
			},
			{
				"<leader>hw",
				"<cmd>HopWord<cr>",
			},
		},
	},
}
