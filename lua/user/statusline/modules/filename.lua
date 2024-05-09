local user_utils = require 'user.utils'
local utils = require 'heirline.utils'

local FileName = {
  provider = function()
    -- In terminal always use plain name
    if vim.bo.buftype == 'terminal' then
      return '%t'
    end

    -- Compute unique buf name
    local full_path = vim.api.nvim_buf_get_name(0)

    if full_path == '' then
      return '%f'
    end

    local name = user_utils.tbl_find(function(item)
      return string.find(full_path, item) ~= nil
    end, user_utils.buf_unique_names()) or full_path

    return name
  end,
}

local FileModified = {
  condition = function()
    return vim.bo.modified
  end,

  hl = function()
    return { fg = utils.get_highlight('String').fg, bold = true }
  end,

  provider = ' [+]',
}

local FileReadonly = {
  condition = function()
    return not vim.bo.modifiable or vim.bo.readonly
  end,

  hl = function()
    return { fg = utils.get_highlight('diffDeleted').fg, bold = true }
  end,

  provider = ' ',
}

local FilenameBlock = {
  FileName,
  FileModified,
  FileReadonly,
}

return FilenameBlock
