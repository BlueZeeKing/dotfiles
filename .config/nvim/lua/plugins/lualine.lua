local word_count_shown = false

local function words()
	if word_count_shown then
		local count = vim.fn.wordcount()
		if count.visual_words == nil then
			return count.words .. " words"
		else
			return count.visual_words .. " selected words"
		end
	else
		return ""
	end
end

vim.keymap.set("n", "<leader>wc", function()
	word_count_shown = not word_count_shown
end)

vim.api.nvim_create_autocmd({ "FileType" }, {
	callback = function(args)
		word_count_shown = vim.bo[args.buf].filetype == "markdown"
	end,
})

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
		opts = {
			options = {
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{ "diagnostics", symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " } },
				},
				lualine_c = {
					"filename",
					-- {
					-- 	"lsp_progress",
					-- 	display_components = { "lsp_client_name", { "title", "percentage" } },
					-- },
				},
				lualine_x = {
					{
						"tabs",
						mode = 3,

						fmt = function(name, context)
							-- Show + if buffer is modified in tab
							local buflist = vim.fn.tabpagebuflist(context.tabnr)
							local winnr = vim.fn.tabpagewinnr(context.tabnr)
							local bufnr = buflist[winnr]
							local mod = vim.fn.getbufvar(bufnr, "&mod")

							return name .. (mod == 1 and " +" or "")
						end,
					},
				},
				lualine_y = { words, "encoding", "filetype" },
				lualine_z = { "progress", "location" },
			},
		},
	},
	{ "arkav/lualine-lsp-progress" },
}
