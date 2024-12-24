return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>pf",
				function()
					require("telescope.builtin").git_files()
				end,
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				"<leader>ps",
				function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				"<leader>sc",
				function()
					require("telescope.builtin").spell_suggest()
				end,
			},
			{
				"<leader>ss",
				function()
					require("telescope.builtin").lsp_dynamic_workspace_symbols()
				end,
			},
			{
				"<leader>ld",
				function()
					require("telescope.builtin").diagnostics()
				end,
			},
			{
				"<leader>tr",
				function()
					require("telescope.builtin").resume()
				end,
			},
			{
				"<leader>tt",
				function()
					require("telescope.builtin").treesitter()
				end,
			},
			{
				"<leader>so",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
			},
		},
		config = function(_, _)
			require("telescope").setup({
				extensions = { ["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				} },
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
	"nvim-telescope/telescope-ui-select.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
