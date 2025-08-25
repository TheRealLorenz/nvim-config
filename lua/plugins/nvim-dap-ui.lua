return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    require('dapui').setup()
    vim.fn.sign_define('DapBreakpoint', { text = '•' })
  end,
  keys = {
    {
      '<leader>td',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debugger',
    },
  },
}
