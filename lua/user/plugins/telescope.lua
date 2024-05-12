return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  keys = {
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Files',
    },
    {
      '<leader>fw',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Word',
    },
    {
      '<leader>fb',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = 'Buffers',
    },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    require('telescope').load_extension 'ui-select'
  end,
}
