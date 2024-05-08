local statusline = require 'mini.statusline'
local utils = require 'user.utils'

local section_fileinfo = function(args)
  local filetype = vim.bo.filetype

  -- Don't show anything if can't detect file type or not inside a "normal
  -- buffer"
  if (filetype == '') or vim.bo.buftype ~= '' then
    return ''
  end

  local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
  if not has_devicons then
    return ''
  end
  local file_name, file_ext = vim.fn.expand '%:t', vim.fn.expand '%:e'

  local icon = devicons.get_icon(file_name, file_ext, { default = true })
  if icon ~= '' then
    filetype = string.format('%s %s', icon, filetype)
  end

  if MiniStatusline.is_truncated(args.trunc_width) then
    return filetype
  end

  local encoding = vim.bo.fileencoding or vim.bo.encoding
  local format = vim.bo.fileformat == 'dos' and 'CRLF'
    or vim.bo.fileformat == 'unix' and 'LF'
    or 'CR'

  return string.format('%s %s %s', filetype, encoding, format)
end

local section_filename = function()
  -- In terminal always use plain name
  if vim.bo.buftype == 'terminal' then
    return '%t'
  end

  -- Compute unique buf name
  local full_path = vim.api.nvim_buf_get_name(0)

  local path = utils.tbl_find(function(item)
    return string.find(full_path, item) ~= nil
  end, utils.buf_unique_names()) or full_path

  -- Add modifiers
  if vim.bo.modified then
    path = path .. ' [+]'
  end
  if not vim.bo.modifiable or vim.bo.readonly then
    path = path .. ' '
  end

  return path
end

statusline.setup {
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
      local git = MiniStatusline.section_git { trunc_width = 75 }
      local diagnostics =
        MiniStatusline.section_diagnostics { trunc_width = 75 }
      local filename = section_filename()
      local fileinfo = section_fileinfo { trunc_width = 120 }
      local location = '%2l:%-2v'

      return MiniStatusline.combine_groups {
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { location } },
      }
    end,
  },
}
