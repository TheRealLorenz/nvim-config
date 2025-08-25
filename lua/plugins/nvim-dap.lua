return {
  'mfussenegger/nvim-dap',
  keys = {
    {
      '<leader>tb',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Breakpoint',
    },
  },
}
