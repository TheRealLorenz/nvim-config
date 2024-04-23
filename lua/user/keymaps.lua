-- Disable Hightlight Search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move around buffers
vim.keymap.set('n', 'gn', '<cmd>bn<CR>', { desc = 'Goto Next Buffer' })
vim.keymap.set('n', 'gp', '<cmd>bp<CR>', { desc = 'Goto Previous Buffer' })

-- Exit terminal mode
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- Visual move
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
