local M = {}

local default_colorscheme = require("user.options").default_colorscheme

M.set_default = function(colorschemes)
  for _, v in ipairs(colorschemes) do
    if v[1]:match(default_colorscheme) then
      v.priority = 1000
      v.lazy = false
      return colorschemes
    end
  end

  colorschemes[1].priority = 1000
  colorschemes[1].lazy = false

  return colorschemes
end

return M
