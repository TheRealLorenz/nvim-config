local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'

local Filename = require 'user.statusline.modules.filename'

local Statusline = {
  condition = conditions.is_not_active,

  hl = {
    fg = utils.get_highlight('StatusLineNC').fg,
    bg = utils.get_highlight('StatusLineNC').bg,
  },

  Filename,
}

return Statusline
