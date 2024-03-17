vim.g.mapleader = " "

vim.keymap.set("n", "<C-M-[>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-M-]>", vim.cmd.tabnext)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)

vim.keymap.set("n", "<Esc>", "")

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("X", "x", {})

local set_opfunc = vim.fn[vim.api.nvim_exec(
	[[
  func s:set_opfunc(val)
    let &opfunc = a:val
  endfunc
  echon get(function('s:set_opfunc'), 'name')
]],
	true
)]

vim.keymap.set("n", "'", function()
	_G.blueish_paste = function()
		local start = vim.api.nvim_buf_get_mark(0, "[")
		local finish = vim.api.nvim_buf_get_mark(0, "]")

		local reg = vim.api.nvim_exec([[echo getreg()]], true)

		vim.api.nvim_buf_set_text(0, start[1], start[2] - 1, finish[1], finish[2] - 1, { reg })
	end

	vim.go.operatorfunc = "v:lua.blueish_paste"

	vim.api.nvim_feedkeys("g@", "n", false)
end)
