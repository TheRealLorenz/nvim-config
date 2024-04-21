return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Files'
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Word'
    },
  }
}
