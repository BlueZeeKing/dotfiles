local defaults = require("formatter.filetypes")
local util = require("formatter.util")

require("formatter").setup({
	filetype = {
		rust = defaults.rust.rustfmt(),
		lua = defaults.lua.stylua(),
		toml = defaults.toml.taplo(),
		java = function()
			return {
				exe = "./gradlew spotlessApply",
                cwd = util.get_cwd(),
                no_append = true,
                stdin = true,
                args = {
                    "-PspotlessIdeHookUseStdOut",
                    "-PspotlessIdeHookUseStdIn",
                    "-PspotlessIdeHook="..util.escape_path(util.get_current_buffer_file_path()),
                    "--quiet",
                }
			}
		end,
	},
})

local format_group = vim.api.nvim_create_augroup("FormatAutogroup", {
clear = false,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = format_group,
	callback = function()
		vim.cmd.FormatWriteLock()
	end,
})
