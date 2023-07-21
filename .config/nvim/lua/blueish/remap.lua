vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set('t', '<Esc>', "<C-\\><C-n><C-w>h",{silent = true})

vim.keymap.set("n", "<C-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)

vim.keymap.set("n", "<leader>hh", vim.cmd.HopChar2)
vim.keymap.set("n", "<leader>hw", vim.cmd.HopWord)

