local on_attach = function(client, bufnr)
    require('which-key').register({
        gd = { vim.lsp.buf.declaration, "Go to declaration" },
    }, { 
        prefix = "",
        buffer = bufnr,
        silent = true,
        noremap = true,
    })
end

return on_attach
