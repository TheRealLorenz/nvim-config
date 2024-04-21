return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>f',
      function()
        require('telescope.builtin').find_files()
      end,
      'Find Files'
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').live_grep()
      end,
      'Live Grep'
    },
  }
}
