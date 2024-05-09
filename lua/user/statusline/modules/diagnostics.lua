local utils = require 'heirline.utils'

local diagnostics_for = function(severity)
  return {
    condition = function(self)
      return (self.diagnostic_count[vim.diagnostic.severity[severity]] or 0) > 0
    end,

    hl = function(self)
      return { fg = self.diagnostic_levels[severity].color }
    end,

    provider = function(self)
      return string.format(
        '%s %d ',
        self.diagnostic_levels[severity].sign,
        self.diagnostic_count[vim.diagnostic.severity[severity]]
      )
    end,
  }
end

local DiagnosticsBlock = {
  condition = function()
    return vim.bo.buftype == ''
      and #vim.lsp.get_active_clients { bufnr = 0 } > 0
  end,

  init = function(self)
    -- From mini.statusline
    self.diagnostic_count = {}
    for _, d in ipairs(vim.diagnostic.get(0)) do
      self.diagnostic_count[d.severity] = (
        self.diagnostic_count[d.severity] or 0
      ) + 1
    end
  end,

  static = {
    diagnostic_levels = {
      ERROR = { sign = '', color = utils.get_highlight('diffDeleted').fg },
      WARN = { sign = '', color = utils.get_highlight('diffChanged').fg },
      INFO = { sign = '', color = utils.get_highlight('Title').fg },
      HINT = { sign = '', color = utils.get_highlight('Title').fg },
    },
  },

  diagnostics_for 'ERROR',
  diagnostics_for 'WARN',
  diagnostics_for 'INFO',
  diagnostics_for 'HINT',
}

return DiagnosticsBlock
