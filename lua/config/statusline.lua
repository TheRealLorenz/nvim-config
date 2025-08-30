---@class Modules
local M = {}

---@param s string input string
---@param hl string highlight group
---@return string
M.set_hl = function(s, hl)
  return string.format('%%#%s#%s%%#%s#', hl, s, 'StatusLine')
end

M.git = function()
  if
    not (vim.bo.buftype == '' and vim.b.gitsigns_head and vim.b.gitsigns_status)
  then
    return ''
  end

  local status = vim.b.gitsigns_status ~= '' and ' ' .. vim.b.gitsigns_status
    or ''
  return M.set_hl(
    string.format(' %s%s ', vim.b.gitsigns_head, status),
    'GitSignsChange'
  )
end

---@param filetype string
---@return string, string
M.icon_hl = function(filetype)
  local ok, icons = pcall(require, 'mini.icons')
  if not ok then
    return '', ''
  end

  return icons.get('filetype', filetype)
end

---@return string
M.fileinfo = function()
  if vim.bo.filetype == '' or vim.bo.buftype ~= '' then
    return ''
  end

  local ft = vim.bo.filetype
  local icon, hl = M.icon_hl(ft)
  local encoding = vim.bo.fileencoding or vim.bo.encoding
  local format = vim.bo.fileformat == 'dos' and 'CRLF'
    or vim.bo.fileformat == 'unix' and 'LF'
    or 'CR'

  return M.set_hl(icon .. ' ' .. ft, hl) .. ' ' .. encoding .. ' ' .. format
end

---@return string
function Statusline()
  ---@type string[]
  local components = {
    '%f%m%h ',
    M.git(),
    ' ',
    '%<', -- Truncate
    '%=', -- Align
    vim.diagnostic.status(),
    ' ',
    M.fileinfo(),
    ' ',
    M.set_hl(' %l:%v ', 'PmenuSel'),
  }

  return table.concat(components)
end

vim.o.statusline = '%!luaeval("Statusline()")'
