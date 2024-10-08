return {
  -- Detected tabstop and shiftwidth
  'tpope/vim-sleuth',

  -- Icons support
  'nvim-tree/nvim-web-devicons',

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- Better UI
  {
    'stevearc/dressing.nvim',
    opts = {},
    event = 'UiEnter',
  },
}
