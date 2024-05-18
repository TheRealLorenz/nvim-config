local user_utils = require 'user.utils'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Enter insert mode when moving into terminal',
  pattern = 'term://*',
  command = 'startinsert',
})
vim.api.nvim_create_autocmd('WinEnter', {
  desc = 'Enter insert mode when moving into terminal',
  pattern = 'term://*',
  command = 'startinsert',
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Auto resize panes when resizing nvim window',
  pattern = '*',
  command = 'tabdo wincmd =',
})

-- Set cppcheck compile-commands path in a CMake project
vim.api.nvim_create_autocmd('User', {
  pattern = 'CMakeToolsEnterProject',
  callback = function()
    local ok, lint = pcall(require, 'lint')
    if not ok then
      return
    end
    local cmake = require 'cmake-tools'

    lint.linters.cppcheck.append_fname = false

    lint.linters.cppcheck.args = vim
      .iter(lint.linters.cppcheck.args)
      :filter(function(arg)
        return type(arg) ~= 'string' or string.find(arg, '%-%-project=') == nil
      end)
      :totable()

    table.insert(
      lint.linters.cppcheck.args,
      string.format(
        '--project=%s/compile_commands.json',
        cmake.get_build_directory()
      )
    )
  end,
})
