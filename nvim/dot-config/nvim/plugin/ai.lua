vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/olimorris/codecompanion.nvim",
})

require("codecompanion").setup({
	opts = {
		log_level = "TRACE",
	},
	adapters = {
		http = {
			openai_compatible = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						api_key = "sk-bf937ef0bed24c309db6f8aaae9eb27d",
						url = "https://genai.rcac.purdue.edu",
						chat_url = "/api/chat/completions",
						models_endpoint = "/api/models",
					},
				})
			end,
		},
	},
	interactions = {
		chat = {
			adapter = {
				name = "openai_compatible",
				model = "llama4:latest",
			},
		},
		inline = {
			adapter = {
				name = "openai_compatible",
				model = "llama4:latest",
			},
		},
		cmd = {
			adapter = {
				name = "openai_compatible",
				model = "llama4:latest",
			},
		},
	},
})
