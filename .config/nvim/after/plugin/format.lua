local defaults = require("formatter.filetypes")

require("formatter").setup {
    filetype = {
        rust = defaults.rust.rustfmt(),
        lua = defaults.lua.stylua(),
        toml = defaults.toml.taplo(),
        java = {
            exe = "./gradlew spotlessApply"
        }
    }
}

local format_group = vim.api.nvim_create_augroup("FormatAutogroup", {
    clear = false
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = format_group,
    callback = function()
        vim.cmd.FormatWrite()
    end
})
