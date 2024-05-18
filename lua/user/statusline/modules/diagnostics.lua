local utils = require 'heirline.utils'

local diagnostics_for = function(severity)
  return {
    condition = function(self)
      return (self.diagnostic_count[severity] or 0) > 0
    end,

    hl = function(self)
      return { fg = self.diagnostic_levels[severity].color }
    end,

    provider = function(self)
      return string.format(
        '%s %d ',
        self.diagnostic_levels[severity].sign,
        self.diagnostic_count[severity]
      )
    end,
  }
end

local DiagnosticsBlock = {
  condition = function()
    return vim.bo.buftype == '' and #vim.lsp.get_clients { bufnr = 0 } > 0
  end,

  init = function(self)
    self.diagnostic_count = vim.diagnostic.count(0)
  end,

  static = {
    diagnostic_levels = {
      [vim.diagnostic.severity.ERROR] = {
        sign = '',
        color = utils.get_highlight('diffDeleted').fg,
      },
      [vim.diagnostic.severity.WARN] = {
        sign = '',
        color = utils.get_highlight('diffChanged').fg,
      },
      [vim.diagnostic.severity.INFO] = {
        sign = '',
        color = utils.get_highlight('Title').fg,
      },
      [vim.diagnostic.severity.HINT] = {
        sign = '',
        color = utils.get_highlight('Title').fg,
      },
    },
  },

  diagnostics_for(vim.diagnostic.severity.ERROR),
  diagnostics_for(vim.diagnostic.severity.WARN),
  diagnostics_for(vim.diagnostic.severity.INFO),
  diagnostics_for(vim.diagnostic.severity.HINT),
}

return DiagnosticsBlock
