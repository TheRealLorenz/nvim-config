local color = require 'user.statusline.colors'
local highlights = require 'user.highlights'

local diagnostic_levels = {
  [vim.diagnostic.severity.ERROR] = {
    sign = '',
    hl = highlights['red'],
  },
  [vim.diagnostic.severity.WARN] = {
    sign = '',
    hl = highlights['yellow'],
  },
  [vim.diagnostic.severity.INFO] = {
    sign = '',
    hl = highlights['blue'],
  },
  [vim.diagnostic.severity.HINT] = {
    sign = '',
    hl = highlights['blue'],
  },
}

---@return string
local diagnostics_for = function(severity)
  local count = vim.diagnostic.count(0)[severity] or 0
  if count == 0 then
    return ''
  end

  local icon = color.set_hl(
    diagnostic_levels[severity].sign,
    diagnostic_levels[severity].hl
  )

  return string.format('%s %d ', icon, count)
end

---@return string
local function diagnostics()
  if vim.bo.buftype ~= '' or #vim.lsp.get_clients { bufnr = 0 } == 0 then
    return ''
  end

  return table.concat {
    diagnostics_for(vim.diagnostic.severity.ERROR),
    diagnostics_for(vim.diagnostic.severity.WARN),
    diagnostics_for(vim.diagnostic.severity.INFO),
    diagnostics_for(vim.diagnostic.severity.HINT),
  }
end

return diagnostics
