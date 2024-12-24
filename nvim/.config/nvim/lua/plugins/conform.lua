return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 10000,
					lsp_fallback = false,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt", "rustywind", "leptosfmt" },
					toml = { "taplo" },
					javascript = { "biome" },
					javascriptreact = { "biome" },
					typescript = { "biome" },
					typescriptreact = { "biome" },
					vue = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					less = { "prettier" },
					html = { "biome" },
					htmldjango = { "biome" },
					json = { "biome" },
					jsonc = { "prettier" },
					yaml = { "prettier" },
					["markdown.mdx"] = { "prettier" },
					graphql = { "prettier" },
					handlebars = { "prettier" },
					svelte = { "prettier" },
					java = { "google-java-format" },
					haskell = { "ormolu" },
				},
				formatters = {
					leptosfmt = {
						command = "leptosfmt",
						args = { "--stdin" },
					},
					rustfmt = {
						args = { "--emit=stdout", "--edition=2021" },
					},
					rustywind = {
						require_cwd = true,
						cwd = require("conform.util").root_file({
							"tailwind.config.js",
							"tailwind.config.cjs",
							"tailwind.config.mjs",
							"tailwind.config.ts",
						}),
					},
				},
			})
		end,
	},
}
