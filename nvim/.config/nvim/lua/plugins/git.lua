return {
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function(_, _)
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					map("n", "<leader>vs", gs.stage_hunk)
					map("n", "<leader>vr", gs.reset_hunk)
					map("n", "<leader>vu", gs.undo_stage_hunk)
					map("v", "<leader>vs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("v", "<leader>vr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("n", "<leader>vS", gs.stage_buffer)
					map("n", "<leader>vR", gs.reset_buffer)
				end,
			})
		end,
	},
}
