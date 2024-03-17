require("blueish.remap")
require("blueish.set")
require("blueish.tree")
require("blueish.lsp")

-- vim.api.nvim_command("autocmd BufWinLeave *.* mkview")
-- vim.api.nvim_command("autocmd BufWinEnter *.* silent! loadview")

vim.keymap.set("", "<C-!>", function()
	vim.lsp.stop_client(vim.lsp.get_active_clients({
		name = "rust_analyzer",
	}))
	vim.lsp.stop_client(vim.lsp.get_active_clients({
		name = "jdtls",
	}))
end)

vim.keymap.set("", "<C-#>", "<cmd>LspStart<cr>")
vim.lsp.set_log_level("off")
