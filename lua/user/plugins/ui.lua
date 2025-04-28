return {
  -- Detected tabstop and shiftwidth
  {
    'Darazaki/indent-o-matic',
    config = true,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
