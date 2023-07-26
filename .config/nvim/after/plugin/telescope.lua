local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sc', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>ss', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})

-- require('telescope').setup {
-- 	extensions = {
-- 		file_browser = {
-- 			theme = "ivy",
-- 			hijack_netrw = true
-- 		}
-- 	}
-- }
--
-- require('telescope').load_extension "file_browser"

require('telescope').setup {
    extensions = { ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
    } }
}

require("telescope").load_extension("ui-select")
