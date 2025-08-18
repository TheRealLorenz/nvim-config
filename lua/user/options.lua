-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local options = {
  number = true,
  mouse = 'a',
  showmode = false,
  clipboard = 'unnamedplus',
  undofile = true,
  inccommand = 'split',
  cursorline = true,
  scrolloff = 10,
  winborder = 'rounded',
  laststatus = 3,
  completeopt = { 'noselect', 'fuzzy', 'menuone' },
  wrap = false,
  guicursor = { 'n-v:block-Cursor/lCursor', 'i-c-ci-ve:block-TermCursor' },

  updatetime = 250,
  timeoutlen = 300,

  splitright = true,
  splitbelow = true,

  list = true,
  listchars = { tab = '» ', trail = '·', nbsp = '␣' },

  -- Unless \C
  ignorecase = true,
  smartcase = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Diagnostic symbols
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  -- virtual_lines = true,
  -- virtual_text = true,
}
