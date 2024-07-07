local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	local opts = { buffer = bufnr }

	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
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

-- require("lspconfig").sourcekit.setup({
-- 	cmd = { "/Library/Developer/CommandLineTools/usr/bin/sourcekit-lsp" },
-- })

require("lspconfig").tailwindcss.setup({
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"templ",
		"rust",
	},
	init_options = {
		userLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
			templ = "html",
			rust = "html",
		},
	},
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern(
			"tailwind.config.js",
			"tailwind.config.cjs",
			"tailwind.config.mjs",
			"tailwind.config.ts"
		)(fname)
	end,
	settings = {
		tailwindCSS = {
			includeLanguages = {
				rust = "html",
			},
			classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = false,
		},
	},
})
