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

}
