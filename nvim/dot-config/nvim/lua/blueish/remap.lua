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

vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
