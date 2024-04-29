return {
  -- Detected tabstop and shiftwidth
  'tpope/vim-sleuth',

  -- Icons support
  'nvim-tree/nvim-web-devicons',

  -- Dracula theme
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },

  -- Better UI
  {
    'stevearc/dressing.nvim',
    opts = {},
    event = 'UiEnter',
  },

  -- Parse path:row:col
  'wsdjeg/vim-fetch',
}
