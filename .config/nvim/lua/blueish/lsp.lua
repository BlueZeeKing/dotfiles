local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"taplo",
		"gopls",
	},
	handlers = {
		lsp_zero.default_setup,
		rust_analyzer = lsp_zero.noop,
		jdtls = lsp_zero.noop,
	},
})

require("cmp").setup({
	mapping = {
		["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
	},
})

lsp_zero.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["rust_analyzer"] = { "rust" },
	},
})
