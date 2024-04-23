return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local which_key = require 'which-key'
    which_key.setup()
    which_key.register {
      ['<leader>f'] = { name = 'Find' },
      ['<leader>b'] = { name = 'Buffer' },
      ['<leader>t'] = { name = 'Toggle' },
    }
  end,
}
