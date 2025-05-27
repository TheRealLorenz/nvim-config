local colors = require 'user.statusline.colors'

local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)

local M = {}

local modes = setmetatable({
  ['n'] = { 'Normal', colors.highlights['red-bg'] },
  ['v'] = { 'Visual', colors.highlights['blue-bg'] },
  ['V'] = { 'V-Line', colors.highlights['blue-bg'] },
  [CTRL_V] = { 'V-Block', colors.highlights['blue-bg'] },
  ['s'] = { 'Select', colors.highlights['mauve-bg'] },
  ['S'] = { 'S-Line', colors.highlights['mauve-bg'] },
  [CTRL_S] = { 'S-Block', colors.highlights['mauve-bg'] },
  ['i'] = { 'Insert', colors.highlights['green-bg'] },
  ['R'] = { 'Replace', colors.highlights['peach-bg'] },
  ['c'] = { 'Command', colors.highlights['peach-bg'] },
  ['r'] = { 'Prompt', colors.highlights['peach-bg'] },
  ['!'] = { 'Shell', colors.highlights['red-bg'] },
  ['t'] = { 'Terminal', colors.highlights['green-bg'] },
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
