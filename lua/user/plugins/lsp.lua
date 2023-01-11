return {

    {
        'williamboman/mason.nvim',
        config = true,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
          "williamboman/mason.nvim",
          'neovim/nvim-lspconfig',
        },
        config = function()
            require('mason-lspconfig').setup()
            require('mason-lspconfig').setup_handlers(require('user.lsp'))
        end,
    },

    {
        'neovim/nvim-lspconfig',
        lazy = true,
    },

    {
        'jay-babu/mason-null-ls.nvim',
        dependencies = {
          "williamboman/mason.nvim",
        },
        config = function()
            require('mason-null-ls').setup({
                automatic_setup = true,
            })
            require('mason-null-ls').setup_handlers()
        end,
        lazy = true,
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
            'jay-babu/mason-null-ls.nvim',
        },
        config = true,
    },

}
