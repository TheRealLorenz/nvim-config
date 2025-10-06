return {
  'echasnovski/mini.nvim',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require 'plugins.mini.ai'
    require 'plugins.mini.bufremove'
    require 'plugins.mini.clue'
    require 'plugins.mini.extra'
    require 'plugins.mini.files'
    require 'plugins.mini.hipatterns'
    require 'plugins.mini.icons'
    require 'plugins.mini.notify'
    require 'plugins.mini.pairs'
    require 'plugins.mini.pick'
    require 'plugins.mini.surround'
    require 'plugins.mini.tabline'
  end,
}
