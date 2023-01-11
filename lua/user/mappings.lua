-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/keymaps.lua
--

local options = { noremap=true, silent=true }

-- Disable arrow keys
vim.api.nvim_set_keymap('', '<up>', '<nop>', options)
vim.api.nvim_set_keymap('', '<down>', '<nop>', options)
vim.api.nvim_set_keymap('', '<left>', '<nop>', options)
vim.api.nvim_set_keymap('', '<right>', '<nop>', options)

-- Move around splits using Ctrl + {h,j,k,l}
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', options)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', options)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', options)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', options)

-- Move around buffers
vim.api.nvim_set_keymap('n', 'H', '<cmd>bp<cr>', options)
vim.api.nvim_set_keymap('n', 'L', '<cmd>bn<cr>', options)


-- Which-key mappings
--
local wk = require('which-key')

wk.register({
  n = {
      name = "Notifications",
      h = {
        require('user.notify').notify_history,
        "History",
        options
      }
  },
  p = {
    name = "Packages",
    L = { "<cmd>Lazy<cr>", "Lazy", options },
    M = { "<cmd>Mason<cr>", "Mason", options },
  },
}, { prefix = "<leader>" })

