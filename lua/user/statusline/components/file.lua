local M = {}

local utils = require 'user.utils'
local colors = require 'user.statusline.colors'

---@return string
M.flags = function()
  return (vim.bo.modified and ' [+]' or '')
    .. ((not vim.bo.modifiable or vim.bo.readonly) and ' ' or '')
end

local format = function()
  return vim.bo.fileformat == 'dos' and 'CRLF'
    or vim.bo.fileformat == 'unix' and 'LF'
    or 'CR'
end

local encoding = function()
  return vim.bo.fileencoding or vim.bo.encoding
end

---@param filetype string
---@return string, string
local icon_hl = function(filetype)
  local ok, icons = pcall(require, 'mini.icons')
  if not ok then
    return '', ''
  end

  return icons.get('filetype', filetype)
end

---@return string
M.info = function()
  if vim.bo.filetype == '' or vim.bo.buftype ~= '' then
    return ''
  end

  local ft = vim.bo.filetype
  local icon, hl = icon_hl(ft)

  return colors.set_hl(icon .. ' ' .. ft, hl)
    .. ' '
    .. encoding()
    .. ' '
    .. format()
end

---@return string
M.name = function()
  -- In terminal always use plain name
  if vim.bo.buftype == 'terminal' then
    return '%t'
  end

  -- Compute unique buf name
  local full_path = vim.api.nvim_buf_get_name(0)

  if full_path == '' then
    return '%f'
  end

  local name = vim.iter(utils.buf_unique_names()):find(function(item)
    return string.find(full_path, item) ~= nil
  end) or full_path

  return name
end

return M
