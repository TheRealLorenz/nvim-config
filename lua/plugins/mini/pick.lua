local picker = require 'mini.pick'
local extra = require 'mini.extra'
picker.setup()

vim.ui.select = picker.ui_select

vim.keymap.set('n', '<leader>f', picker.builtin.files, { desc = 'Pick Files' })
vim.keymap.set(
  'n',
  '<leader>/',
  picker.builtin.grep_live,
  { desc = 'Live Grep' }
)
vim.keymap.set('n', '<leader>bp', picker.builtin.buffers, { desc = 'Pick' })
vim.keymap.set('n', '<leader>?', extra.pickers.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>h', picker.builtin.help, { desc = 'Help' })
