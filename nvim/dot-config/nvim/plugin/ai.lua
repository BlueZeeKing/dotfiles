vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/olimorris/codecompanion.nvim",
})

local file = io.open('/var/lib/secrets/genai', 'r')
local key = file:read()
file:close()

require("codecompanion").setup({
	opts = {
		log_level = "TRACE",
	},
	adapters = {
		http = {
			openai_compatible = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						api_key = key,
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
				model = "qwen3.8:27b",
			},
		},
		inline = {
			adapter = {
				name = "openai_compatible",
				model = "qwen3.8:27b",
			},
		},
		cmd = {
			adapter = {
				name = "openai_compatible",
				model = "qwen3.8:27b",
			},
		},
	},
})
