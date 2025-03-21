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

-- Fix statusline disappearing with cmdheight=0
vim.api.nvim_create_autocmd('ModeChanged', {
  desc = 'Schedule statusline redraw on mode change',
  pattern = '*',
  callback = function()
    vim.schedule(function()
      vim.cmd.redraw()
    end)
  end,
})
