-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/keymaps.lua
--

-- Shortand function for mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')


-- Which-key mappings
--
local wk = require('which-key')

wk.register({
    e = { "<cmd>Neotree toggle<cr>", "Toggle NeoTree" },
}, { prefix = "<leader>" })

