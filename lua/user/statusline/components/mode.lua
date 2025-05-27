local colors = require 'user.statusline.colors'
local highlights = require 'user.highlights'

local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local M = {}

local modes = setmetatable({
  ['n'] = { 'Normal', highlights['redBg'] },
  ['v'] = { 'Visual', highlights['blueBg'] },
  ['V'] = { 'V-Line', highlights['blueBg'] },
  [CTRL_V] = { 'V-Block', highlights['blueBg'] },
  ['s'] = { 'Select', highlights['mauveBg'] },
  ['S'] = { 'S-Line', highlights['mauveBg'] },
  [CTRL_S] = { 'S-Block', highlights['mauveBg'] },
  ['i'] = { 'Insert', highlights['greenBg'] },
  ['R'] = { 'Replace', highlights['peachBg'] },
  ['c'] = { 'Command', highlights['peachBg'] },
  ['r'] = { 'Prompt', highlights['peachBg'] },
  ['!'] = { 'Shell', highlights['redBg'] },
  ['t'] = { 'Terminal', highlights['greenBg'] },
}, {
  __index = function(value)
    return { '? ' .. value, '' }
  end,
})

---@return string
function M.name()
  local value = vim.fn.mode()
  local mode_value = modes[value]

  return colors.set_hl(' ' .. mode_value[1] .. ' ', mode_value[2])
end

---@return string
function M.color()
  local value = vim.fn.mode()
  return modes[value][2]
end

return M
