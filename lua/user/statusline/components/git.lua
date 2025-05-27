local colors = require 'user.statusline.colors'
local highlights = require 'user.highlights'

local git = function()
  if
    not (vim.bo.buftype == '' and vim.b.gitsigns_head and vim.b.gitsigns_status)
  then
    return ''
  end

  local status = vim.b.gitsigns_status ~= '' and ' ' .. vim.b.gitsigns_status
    or ''
  return colors.set_hl(
    string.format(' %s%s ', vim.b.gitsigns_head, status),
    highlights['peach']
  )
end

return git
