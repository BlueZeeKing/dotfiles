vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set('t', '<Esc>', "<C-\\><C-n><C-w>h",{silent = true})

vim.keymap.set("n", "<C-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- vim.keymap.set("n", "x", "d")
-- vim.keymap.set("n", "z", "a")
-- vim.keymap.set("n", "d", "w")
-- vim.keymap.set("n", "w", "k")
-- vim.keymap.set("n", "s", "j")
-- vim.keymap.set("n", "a", "b")
-- vim.keymap.set("n", "q", "h")
-- vim.keymap.set("n", "e", "l")
--
-- vim.keymap.set("v", "x", "d")
-- vim.keymap.set("v", "z", "a")
-- vim.keymap.set("v", "d", "w")
-- vim.keymap.set("v", "w", "k")
-- vim.keymap.set("v", "s", "j")
-- vim.keymap.set("v", "a", "b")
-- vim.keymap.set("v", "q", "h")
-- vim.keymap.set("v", "e", "l")
