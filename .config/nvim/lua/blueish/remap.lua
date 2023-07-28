vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set('t', '<Esc>', "<C-\\><C-n><C-w>h", { silent = true })

vim.keymap.set("n", "<C-M-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-M-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)

vim.keymap.set("n", "<leader>hh", function()
    vim.ui.input({ prompt = "Hop 2 char", length = 2 }, function(response)
        local hop = require('hop')
        local jump_target = require('hop.jump_target')

        hop.hint_with(
            jump_target.jump_targets_by_scanning_lines(jump_target.regex_by_case_searching(response, true, hop.opts)),
            hop.opts)
    end)
end)
vim.keymap.set("n", "<leader>hw", vim.cmd.HopWord)

vim.keymap.set("n", "<leader>so", vim.cmd.SymbolsOutline)

vim.keymap.set("n", "<Esc>", "")
