local on_attach = function(client, bufnr)

    require('which-key').register({
        g = {
            D = { vim.lsp.buf.declaration, "Go to Declaration" },
            d = { vim.lsp.buf.definition, "Go to Definition" },
            i = { vim.lsp.buf.implementation, "Go to Implementation" },
            r = { vim.lsp.buf.references, "Go to References" },
        },
        K = { vim.lsp.buf.hover, "Hover" },
        ["<leader>l"] = {
            name = "Lsp",
            f = { function() vim.lsp.buf.format({ async = true}) end, "Format" },
            r = { vim.lsp.buf.rename, "Rename" },
            a = { vim.lsp.bug.code_action, "Code Action" },
        },

    }, { 
        prefix = "",
        buffer = bufnr,
        silent = true,
        noremap = true,
    })
end

return on_attach
