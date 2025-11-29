vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = event.buf, desc = "Hover" })
		vim.keymap.set(
			"n",
			"gd",
			"<cmd>lua vim.lsp.buf.definition()<cr>",
			{ buffer = event.buf, desc = "Go to definition" }
		)
		vim.keymap.set(
			"n",
			"gD",
			"<cmd>lua vim.lsp.buf.declaration()<cr>",
			{ buffer = event.buf, desc = "Go to declaration" }
		)
		vim.keymap.set(
			"n",
			"gi",
			"<cmd>lua vim.lsp.buf.implementation()<cr>",
			{ buffer = event.buf, desc = "Go to implementation" }
		)
		vim.keymap.set(
			"n",
			"go",
			"<cmd>lua vim.lsp.buf.type_definition()<cr>",
			{ buffer = event.buf, desc = "Go to type definition" }
		)
		vim.keymap.set(
			"n",
			"gr",
			"<cmd>lua vim.lsp.buf.references()<cr>",
			{ buffer = event.buf, desc = "Find references" }
		)
		vim.keymap.set(
			"n",
			"gs",
			"<cmd>lua vim.lsp.buf.signature_help()<cr>",
			{ buffer = event.buf, desc = "Open signature help" }
		)
		vim.keymap.set(
			"n",
			"gl",
			"<cmd>lua vim.diagnostic.open_float()<cr>",
			{ buffer = event.buf, desc = "Open diagnostic" }
		)
		vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = event.buf, desc = "Rename" })
		vim.keymap.set(
			"n",
			"<leader>ca",
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			{ buffer = event.buf, desc = "Open code actions" }
		)
	end,
})

vim.lsp.config("texlab", {
	settings = {
		texlab = {
			build = {
				onSave = true,
				forwardSearchAfter = true,
			},
			forwardSearch = {
				executable = "okular",
				args = { "--unique", "file:%p#src:%l%f" },
			},
		},
	},
})
vim.lsp.config("elixirls", {
	cmd = { "/usr/bin/elixir-ls" },
})
