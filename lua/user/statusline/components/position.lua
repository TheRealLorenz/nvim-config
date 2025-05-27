local colors = require 'user.statusline.colors'
local mode = require 'user.statusline.components.mode'

local function position()
  return colors.set_hl(' %l:%v ', mode.color())
end

return position
