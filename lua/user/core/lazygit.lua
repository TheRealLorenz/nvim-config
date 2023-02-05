local utils = require("user.core.utils")

if not utils.is_available("toggleterm.nvim") then
  return
end

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "curved",
  },
})

return lazygit
