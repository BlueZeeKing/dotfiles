vim.g.mapleader = " "

vim.keymap.set("n", "<C-M-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-M-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("X", "x", {})

vim.keymap.set("n", "<C-w>-", "<cmd>split<CR>")
vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<CR>")

vim.keymap.set("n", "<leader>pf", function()
	require("snacks").picker.git_files()
end, { desc = "Pick files with git" })

vim.keymap.set("n", "<C-p>", function()
	require("snacks").picker.files()
end, { desc = "Pick files" })

vim.keymap.set("n", "<leader>ps", function()
	require("snacks").picker.grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>tr", function()
	require("snacks").picker.resume()
end, { desc = "Resume picker" })

vim.keymap.set("n", "<leader>ld", function()
	require("snacks").picker.diagnostics()
end, { desc = "Pick diagnostic info" })

vim.keymap.set("n", "<leader>ss", function()
	require("snacks").picker.lsp_workspace_symbol()
end, { desc = "Pick from workspace symbols" })

vim.keymap.set("n", "<leader>so", function()
	require("snacks").picker.lsp_symbol()
end, { desc = "Pick from file symbols" })
