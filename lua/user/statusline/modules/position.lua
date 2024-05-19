local utils = require 'heirline.utils'

local Position = { provider = '%2l:%-2v' }

local SearchCount = {
  condition = function()
    return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
  end,
  init = function(self)
    local ok, search = pcall(vim.fn.searchcount)
    if ok and search.total then
      self.search = search
    end
  end,
  provider = function(self)
    local search = self.search
    return string.format(
      '[%d/%d] ',
      search.current,
      math.min(search.total, search.maxcount)
    )
  end,
}

local PositionBlock = {
  hl = function()
    return { fg = utils.get_highlight('Statusline').bg, bold = true }
  end,

  SearchCount,
  Position,
}

return utils.surround({ '', '█' }, function(self)
  return self:mode_color()
end, PositionBlock)
