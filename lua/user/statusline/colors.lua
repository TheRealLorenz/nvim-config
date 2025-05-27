local M = {}

---@param s string input string
---@param hl string highlight group
---@return string
M.set_hl = function(s, hl)
  return string.format('%%#%s#%s%%#%s#', hl, s, 'StatusLine')
end

return M
