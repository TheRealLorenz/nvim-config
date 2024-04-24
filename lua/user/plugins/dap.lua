return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    require('mason-nvim-dap').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      },
    }
    require('dapui').setup()
    vim.fn.sign_define('DapBreakpoint', { text = '•' })
  end,
  keys = {
    {
      '<leader>tb',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Breakpoint',
    },
    {
      '<leader>td',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debugger',
    },
  },
}
