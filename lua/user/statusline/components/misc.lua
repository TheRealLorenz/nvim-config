local M = {}

M.truncate = '%<'
M.separator = '%='

---@param n? number amount of spaces
---@return string
function M.padding(n)
  n = n or 1
  return string.rep(' ', n)
end

return M
