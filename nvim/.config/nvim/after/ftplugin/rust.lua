vim.keymap.set("n", "<leader>rd", function()
	vim.cmd.RustLsp("openDocs")
end)
