local utils = require 'heirline.utils'

local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local Statuslines = {
  fallthrough = false,

  static = {
    _mode_colors = setmetatable({
      ['n'] = utils.get_highlight('diffDeleted').fg,
      ['v'] = utils.get_highlight('Title').fg,
      ['V'] = utils.get_highlight('Title').fg,
      [CTRL_V] = utils.get_highlight('Title').fg,
      ['s'] = utils.get_highlight('Folded').fg,
      ['S'] = utils.get_highlight('Folded').fg,
      [CTRL_S] = utils.get_highlight('Folded').fg,
      ['i'] = utils.get_highlight('String').fg,
      ['R'] = utils.get_highlight('diffChanged').fg,
      ['c'] = utils.get_highlight('diffChanged').fg,
      ['r'] = utils.get_highlight('diffChanged').fg,
      ['!'] = utils.get_highlight('diffDeleted').fg,
      ['t'] = utils.get_highlight('String').fg,
    }, {
      -- By default return 'Unknown' but this shouldn't be needed
      __index = function()
        return 'purple'
      end,
    }),
    mode_color = function(self)
      local mode = vim.fn.mode()
      return self._mode_colors[mode]
    end,
  },

  hl = {
    bg = utils.get_highlight('StatusLine').bg,
    fg = utils.get_highlight('StatusLine').fg,
  },

  require 'user.statusline.inactive',
  require 'user.statusline.dapui',
  require 'user.statusline.default',
}

return Statuslines
