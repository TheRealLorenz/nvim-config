local utils = require 'heirline.utils'

local Position = {
  provider = '%2l:%-2v',

  hl = function()
    return { fg = utils.get_highlight('Statusline').bg, bold = true }
  end,
}

return utils.surround({ '', '█' }, function(self)
  return self:mode_color()
end, Position)
