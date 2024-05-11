local Filename = require 'user.statusline.modules.filename'
local Mode = require 'user.statusline.modules.mode'
local Space = { provider = ' ' }

return {
  condition = function()
    return vim.bo.filetype and string.find(vim.bo.filetype, '^dap.-[-_]?.+')
  end,

  Mode,
  Space,
  Filename,
}
