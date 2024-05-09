return {
  'rebelot/heirline.nvim',
  event = 'UiEnter',
  config = function()
    require('heirline').setup {
      statusline = require 'user.statusline',
      opts = {
        colors = require('kanagawa.colors').setup(),
      },
    }
  end,
}
