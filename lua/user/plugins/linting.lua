return {
  'mfussenegger/nvim-lint',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('lint').linters_by_ft = {
      python = { 'flake8' },
      json = { 'jsonlint' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
