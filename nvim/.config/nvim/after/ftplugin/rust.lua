vim.keymap.set("n", "<leader>rd", function()
	vim.cmd.RustLsp("openDocs")
end, { desc = "Open rust docs" })
