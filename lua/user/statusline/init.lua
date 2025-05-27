local misc = require 'user.statusline.components.misc'
local mode = require 'user.statusline.components.mode'
local position = require 'user.statusline.components.position'
local git = require 'user.statusline.components.git'
local file = require 'user.statusline.components.file'
local diagnostics = require 'user.statusline.components.diagnostics'

---@return string
function Statusline()
  ---@type string[]
  local components = {
    mode.name(),
    misc.padding(),
    file.name(),
    file.flags(),
    misc.padding(),
    git(),
    misc.padding(),
    misc.truncate,
    misc.separator,
    diagnostics(),
    file.info(),
    misc.padding(),
    position(),
  }

  return table.concat(components)
end

vim.o.statusline = '%!luaeval("Statusline()")'
