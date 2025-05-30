vim.g.mapleader = " "

vim.keymap.set("n", "<C-M-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-M-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("X", "x", {})

vim.keymap.set("n", "<C-w>-", "<cmd>split<CR>")
vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<CR>")
