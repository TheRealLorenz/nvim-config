local catppuccin_colors = require('catppuccin.palettes').get_palette 'mocha'

local highlights = setmetatable({}, {
  __index = function(self, index)
    local reverse = false
    if type(index) ~= 'string' then
      vim.notify(string.format('Invalid type for color: %s', type(index)))
      return nil
    end

    local value
    if index:match '%-bg' ~= nil then
      reverse = true
      value = catppuccin_colors[index:sub(1, #index - 3)]
    else
      value = catppuccin_colors[index]
    end

    if value == nil then
      vim.notify(string.format('Invalid color name: %s', index))
      return nil
    end

    local hl_name = string.format('StatusLine-%s', index)
    self[index] = hl_name
    vim.api.nvim_set_hl(
      0,
      hl_name,
      { fg = value, reverse = reverse, bold = reverse }
    )

    return hl_name
  end,
})

local M = {}

---@param s string input string
---@param hl string highlight group
---@return string
M.set_hl = function(s, hl)
  return string.format('%%#%s#%s%%#%s#', hl, s, 'StatusLine')
end

M.highlights = highlights

return M
