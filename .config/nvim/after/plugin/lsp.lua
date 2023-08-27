local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'jdtls',
    'taplo',
    'gopls',
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
end)

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()

require('lspconfig').html.setup({
    on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
})

local rust_tools = require('rust-tools')

rust_tools.setup()

require('rust-tools').inlay_hints.enable()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
    }
})
