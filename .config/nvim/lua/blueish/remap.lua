vim.g.mapleader = " "

vim.keymap.set("n", "<C-M-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-M-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set("v", "<M-c>", '"*y')
vim.keymap.set("v", "<M-v>", '"*p')

vim.keymap.set("n", "<Esc>", "")
