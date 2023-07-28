-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('BlueZeeKing/onedark.nvim')
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons')
    use('neovim/nvim-lspconfig')
    use('simrat39/rust-tools.nvim')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use('ThePrimeagen/vim-be-good')
    use 'karb94/neoscroll.nvim'
    use 'dstein64/vim-startuptime'
    use 'kdheepak/lazygit.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'phaazon/hop.nvim'
    use 'wakatime/vim-wakatime'
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'echasnovski/mini.nvim'
    use 'BlueZeeKing/dressing.nvim'
end)
