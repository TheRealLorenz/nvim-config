local opt = vim.opt

opt.number = true
opt.mouse = 'a'
opt.showmode = false
opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 10
opt.winborder = 'rounded'
opt.laststatus = 3
opt.completeopt = { 'noselect', 'fuzzy', 'menuone' }
opt.wrap = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.ignorecase = true -- Unless \C
opt.smartcase = true
opt.tabstop = 4

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = '',
    },
  },
  -- virtual_lines = true,
  -- virtual_text = true,
}
