local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local Statuslines = {
  fallthrough = false,

  static = {
    _mode_colors = setmetatable({
      ['n'] = 'red',
      ['v'] = 'blue',
      ['V'] = 'blue',
      [CTRL_V] = 'blue',
      ['s'] = 'mauve',
      ['S'] = 'mauve',
      [CTRL_S] = 'mauve',
      ['i'] = 'green',
      ['R'] = 'orange',
      ['c'] = 'orange',
      ['r'] = 'orange',
      ['!'] = 'red',
      ['t'] = 'green',
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
    bg = 'mantle',
    fg = 'text',
  },

  require 'user.statusline.inactive',
  require 'user.statusline.dapui',
  require 'user.statusline.default',
}

return Statuslines
