return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mfussenegger/nvim-lint',
    'stevearc/conform.nvim',

    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    { 'j-hui/fidget.nvim', config = true },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local lsp_map = function(keys, func, desc)
          vim.keymap.set(
            'n',
            keys,
            func,
            { buffer = event.buf, desc = 'LSP: ' .. desc }
          )
        end

        lsp_map(
          'gd',
          require('telescope.builtin').lsp_definitions,
          'Goto Definition'
        )
        lsp_map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        lsp_map(
          'gr',
          require('telescope.builtin').lsp_references,
          'Goto References'
        )
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
        lsp_map('<leader>r', vim.lsp.buf.rename, 'Rename Symbol')
        lsp_map('<leader>a', vim.lsp.buf.code_action, 'Code Action')
        lsp_map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- Toggle Inlay Hints
        if
          client
          and client.server_capabilities.inlayHintProvider
          and vim.lsp.inlay_hint
        then
          lsp_map('<leader>th', function()
            vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
          end, 'Inlay Hints')
        end

        -- Highlight symbol under cursor
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend(
      'force',
      capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    require('mason').setup()

    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}

          server.capabilities = vim.tbl_deep_extend(
            'force',
            {},
            capabilities,
            server.capabilities or {}
          )
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    local mason_helper = require 'user.mason-helper'
    require('lint').linters_by_ft = mason_helper.linters_by_ft()
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })

    vim.g.auto_format = true
    vim.keymap.set('n', '<leader>tf', function()
      vim.g.auto_format = not vim.g.auto_format
      vim.notify('Auto format: ' .. tostring(vim.g.auto_format))
    end, { desc = 'Auto Format' })

    require('conform').setup {
      formatters_by_ft = mason_helper.formatters_by_ft(),
    }
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        if vim.g.auto_format then
          require('conform').format { bufnr = args.buf }
        end
      end,
    })
  end,
}
