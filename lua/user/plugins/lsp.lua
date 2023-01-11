return {

    {
        'williamboman/mason.nvim',
        config = true,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
          "williamboman/mason.nvim"
        },
        config = function()
            require('mason-lspconfig').setup()
            require('mason-lspconfig').setup_handlers(require('user.lsp'))
        end,
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        },
    },
    
}
