return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      'Find Files'
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').live_grep()
      end,
      'Find Word'
    },
  }
}
