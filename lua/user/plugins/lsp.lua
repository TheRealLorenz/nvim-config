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

        lsp_map('gd', function()
          require('mini.extra').pickers.lsp { scope = 'definition' }
        end, 'Goto Definition')
        lsp_map('gD', function()
          require('mini.extra').pickers.lsp { scope = 'declaration' }
        end, 'Goto Declaration')
        lsp_map('gt', function()
          require('mini.extra').pickers.lsp { scope = 'type_definition' }
        end, 'Goto Implementations')

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

    vim.lsp.enable {
      'lua_ls',
      'clangd',
      'pyright',
      'rust_analyzer',
      'ts_ls',
      'tinymist',
      'emmet_language_server',
      'cssls',
      'tailwindcss',
      'angularls',
    }
  end,
}
