local utils = require 'heirline.utils'

local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local Mode = {
  static = {

    modes = setmetatable({
      ['n'] = { long = 'Normal', short = '' },
      ['v'] = { long = 'Visual', short = '' },
      ['V'] = { long = 'V-Line', short = '' },
      [CTRL_V] = { long = 'V-Block', short = '' },
      ['s'] = { long = 'Select', short = '' },
      ['S'] = { long = 'S-Line', short = '' },
      [CTRL_S] = { long = 'S-Block', short = '' },
      ['i'] = { long = 'Insert', short = '' },
      ['R'] = { long = 'Replace', short = '' },
      ['c'] = { long = 'Command', short = '' },
      ['r'] = { long = 'Prompt', short = '' },
      ['!'] = { long = 'Shell', short = '' },
      ['t'] = { long = 'Terminal', short = '' },
    }, {
      -- By default return 'Unknown' but this shouldn't be needed
      __index = function()
        return { long = '', short = '' }
      end,
    }),
  },

  init = function(self)
    self.mode = vim.fn.mode()
  end,

  provider = function(self)
    return ' ' .. self.modes[self.mode].long
  end,
}

local MacroRec = {
  condition = function()
    return vim.fn.reg_recording() ~= '' and vim.o.cmdheight == 0
  end,
  provider = function()
    return string.format('󰻃 [%s] ', vim.fn.reg_recording())
  end,
  update = {
    'RecordingEnter',
    'RecordingLeave',
  },
}

local ShowCmd = {
  condition = function()
    return vim.o.cmdheight == 0
  end,
  provider = ' :%3.5(%S%)',
}

local ModeBlock = {
  hl = function()
    return { fg = utils.get_highlight('Statusline').bg, bold = true }
  end,

  MacroRec,
  Mode,
  ShowCmd,
}

return utils.surround({ '█', '' }, function(self)
  return self:mode_color()
end, ModeBlock)
