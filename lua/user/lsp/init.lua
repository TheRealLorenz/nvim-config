local on_attach = function(_, bufnr)
  require("which-key").register({
    g = {
      D = { vim.lsp.buf.declaration, "Go to Declaration" },
      d = { vim.lsp.buf.definition, "Go to Definition" },
      i = { vim.lsp.buf.implementation, "Go to Implementation" },
      r = { vim.lsp.buf.references, "Go to References" },
    },
    K = { vim.lsp.buf.hover, "Hover" },
    ["<leader>l"] = {
      name = "Lsp",
      f = {
        function()
          vim.lsp.buf.format({ async = true })
        end,
        "Format",
      },
      r = { vim.lsp.buf.rename, "Rename" },
      a = { vim.lsp.buf.code_action, "Code Action" },
      d = { vim.diagnostic.open_float, "Hover diagnostics" },
    },
  }, {
    prefix = "",
    buffer = bufnr,
    silent = true,
    noremap = true,
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function get_custom_settings(server_name)
  local ok, settings = pcall(require, "user.lsp.servers." .. server_name)
  if ok then
    return settings
  else
    return {}
  end
end

local lsp_settings = {
  function(server_name)
    local settings = get_custom_settings(server_name)

    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      settings = settings,
      capabilities = capabilities,
    })
  end,
}

return lsp_settings
