return {
  'mfussenegger/nvim-lint',
  dependencies = {
    'williamboman/mason.nvim',
  },
  init = function()
    vim.api.nvim_create_user_command('LintInfo', function()
      vim.print(vim.inspect(require('lint').get_running()))
    end, {})
  end,
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
  event = 'BufWritePre',
}
