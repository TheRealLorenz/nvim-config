local M = {}

---Capitalize a string
---@param s string
---@return string
M.capitalize = function(s)
  return (s:gsub('^%l', string.upper))
end

return M
