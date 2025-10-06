local files = require 'mini.files'

files.setup()

vim.keymap.set('n', '<leader>e', files.open, { desc = 'Open Explorer' })
