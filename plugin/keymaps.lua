-- Disable Hightlight Search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- Open quickfix from buffer
vim.keymap.set(
  'n',
  '<leader>bq',
  '<cmd>cgetbuffer | copen<cr>',
  { desc = 'To Quickfix' }
)
