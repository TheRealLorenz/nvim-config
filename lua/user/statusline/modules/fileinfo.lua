local Space = { provider = ' ' }

local FileIcon = {
  condition = function()
    local ok, _ = pcall(require, 'nvim-web-devicons')
    return ok
  end,

  init = function(self)
    local file_name, file_ext = vim.fn.expand '%:t', vim.fn.expand '%:e'

    self.icon, self.color = require('nvim-web-devicons').get_icon_color(
      file_name,
      file_ext,
      { default = true }
    )
  end,

  hl = function(self)
    return { fg = self.color }
  end,

  provider = function(self)
    return self.icon and (self.icon .. ' ')
  end,
}

local FileType = {
  provider = function()
    return vim.bo.filetype
  end,
}

local FileEncoding = {
  provider = function()
    return vim.bo.fileencoding or vim.bo.encoding
  end,
}

local FileFormat = {
  hl = { bold = true },

  provider = function()
    return vim.bo.fileformat == 'dos' and 'CRLF'
      or vim.bo.fileformat == 'unix' and 'LF'
      or 'CR'
  end,
}

local FileInfoBlock = {
  condition = function()
    return vim.bo.filetype ~= '' and vim.bo.buftype == ''
  end,

  FileIcon,
  FileType,
  Space,
  FileEncoding,
  Space,
  FileFormat,
}

return FileInfoBlock
