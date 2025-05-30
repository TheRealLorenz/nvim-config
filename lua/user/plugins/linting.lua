---Returns a string with the configured linters
---for filetype.
---@param ft string? Filetype, nil for current buffer
---@return string
local function lint_info(ft)
  ft = ft or vim.bo.filetype
  local linters = require('lint')._resolve_linter_by_ft(ft)

  if #linters == 0 then
    return 'No configured linters for \'' .. ft .. '\''
  end

  return 'Configured linters for \''
    .. ft
    .. '\': '
    .. table.concat(linters, ', ')
end

return {
  'mfussenegger/nvim-lint',
  init = function()
    vim.api.nvim_create_user_command('LintInfo', function(ctx)
      vim.print(lint_info(ctx.fargs[1]))
    end, { nargs = '?' })
  end,
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      python = { 'flake8' },
      json = { 'jsonlint' },
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
    }
    table.insert(lint.linters.cppcheck.args, '--suppress=missingIncludeSystem')

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  event = 'BufWritePre',
}
