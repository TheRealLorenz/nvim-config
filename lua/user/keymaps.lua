-- Disable Hightlight Search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move around buffers
vim.keymap.set('n', 'gn', '<cmd>bn<CR>', { desc = 'Goto Next Buffer' })
vim.keymap.set('n', 'gp', '<cmd>bp<CR>', { desc = 'Goto Previous Buffer' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Visual move
vim.keymap.set('n', 'j', 'gj', { silent = true, noremap = true })
vim.keymap.set('n', 'k', 'gk', { silent = true, noremap = true })

-- Open quickfix from buffer
vim.keymap.set(
  'n',
  '<leader>bq',
  '<cmd>cgetbuffer | copen<cr>',
  { desc = 'To Quickfix' }
)

-- Toggle colorscheme
vim.keymap.set('n', '<leader>tc', function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end, { desc = 'Colorscheme' })

vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible ~= 0 then
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and vim.keycode '<C-y>' or vim.keycode '<CR>'
  else
    return vim.keycode '<CR>'
  end
end, { expr = true })

vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() ~= 0 then
    return vim.keycode '<C-n>'
  else
    return vim.keycode '<Tab>'
  end
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() ~= 0 then
    return vim.keycode '<C-p>'
  else
    return vim.keycode '<S-Tab>'
  end
end, { expr = true })
