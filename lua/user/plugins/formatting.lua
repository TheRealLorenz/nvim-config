return {
  'stevearc/conform.nvim',
  config = function()
    vim.g.auto_format = true

    require('conform').setup {
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        lua = { 'stylua' },
        python = { 'black' },
      },
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
  event = 'BufReadPre',
  keys = {
    {
      '<leader>tf',
      function()
        vim.g.auto_format = vim.g.auto_format or false
        vim.g.auto_format = not vim.g.auto_format
        vim.notify('Auto format: ' .. tostring(vim.g.auto_format))
      end,
      desc = 'Auto Format',
    },
  },
}
