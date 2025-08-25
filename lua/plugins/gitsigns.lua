return {
  'lewis6991/gitsigns.nvim',
  keys = {
    {
      ']h',
      function()
        require('gitsigns').nav_hunk('next', {})
      end,
      desc = 'Next hunk',
    },
    {
      '[h',
      function()
        require('gitsigns').nav_hunk('prev', {})
      end,
      desc = 'Prev hunk',
    },
  },
}
