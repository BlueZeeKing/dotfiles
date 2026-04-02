vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local buf, filetype = args.buf, args.match

		local language = vim.treesitter.language.get_lang(filetype)
		if not language then
			return
		end

		if vim.treesitter.language.add(language) then
			vim.treesitter.start(buf, language)
		elseif vim.tbl_contains(require("nvim-treesitter").get_available(), language) then
			require("nvim-treesitter").install(language):await(function()
				vim.treesitter.start(buf, language)
			end)
		end
	end,
})
