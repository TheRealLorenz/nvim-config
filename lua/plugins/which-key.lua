return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local which_key = require 'which-key'
    which_key.setup()
    which_key.add {
      { '<leader>f', group = 'Find' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>t', group = 'Toggle' },
    }
  end,
}
