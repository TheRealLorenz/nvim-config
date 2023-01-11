local lsp_settings = {
    function(server_name)
        require('lspconfig')[server_name].setup({
            on_attach = require('user.lsp.on_attach')
        })
    end
}

return lsp_settings;
