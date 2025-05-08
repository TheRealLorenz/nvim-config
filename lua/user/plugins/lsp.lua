return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'j-hui/fidget.nvim', config = true },

    { 'folke/lazydev.nvim', ft = 'lua', config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local lsp_map = function(keys, func, desc)
          vim.keymap.set(
            'n',
            keys,
            func,
            { buffer = args.buf, desc = 'LSP: ' .. desc }
          )
        end

        lsp_map(
          'gd',
          require('telescope.builtin').lsp_definitions,
          'Goto Definition'
        )
        lsp_map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        lsp_map(
          'gI',
          require('telescope.builtin').lsp_implementations,
          'Goto Implementations'
        )
        lsp_map(
          '<leader>D',
          require('telescope.builtin').lsp_type_definitions,
          'Type Definition'
        )
        lsp_map(
          '<leader>fs',
          require('telescope.builtin').lsp_document_symbols,
          'Find Symbols'
        )
        lsp_map(
          '<leader>fS',
          require('telescope.builtin').lsp_dynamic_workspace_symbols,
          'Find Symbols (Workspace)'
        )

        -- Toggle Inlay Hints
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable()
          lsp_map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
          end, 'Inlay Hints')
        end

        -- Highlight symbol under cursor
        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = args.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    vim.lsp.enable { 'lua_ls', 'clangd', 'rust_analyzer', 'ts_ls', 'tinymist' }
  end,
}
