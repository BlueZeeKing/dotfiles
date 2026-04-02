vim.pack.add({
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>vs", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>vr", gs.reset_hunk, { desc = "Reset hunk" })
		map("n", "<leader>vu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		map("v", "<leader>vs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage hunk" })
		map("v", "<leader>vr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset hunk" })
		map("n", "<leader>vS", gs.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>vR", gs.reset_buffer, { desc = "Reset buffer" })
	end,
})
