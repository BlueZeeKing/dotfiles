local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'taplo',
    'gopls',
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.skip_server_setup({ 'rust_analyzer', 'jdtls' })

lsp.setup()

local rust_tools = require('rust-tools')

rust_tools.setup()

require('rust-tools').inlay_hints.enable()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }
})
