local catppuccin_colors = require('catppuccin.palettes').get_palette 'mocha'
local utils = require 'user.utils'

local highlights = setmetatable({}, {
  __index = function(self, index)
    local reverse = false
    if type(index) ~= 'string' then
      vim.notify(string.format('Invalid type for color: %s', type(index)))
      return nil
    end

    local value
    if index:match '%Bg' ~= nil then
      reverse = true
      value = catppuccin_colors[index:sub(1, #index - 2)]
    else
      value = catppuccin_colors[index]
    end

    if value == nil then
      vim.notify(string.format('Invalid color name: %s', index))
      return nil
    end

    local hl_name = string.format('CustomHl%s', utils.capitalize(index))
    self[index] = hl_name
    vim.api.nvim_set_hl(
      0,
      hl_name,
      { fg = value, reverse = reverse, bold = reverse }
    )

    return hl_name
  end,
})

return highlights
