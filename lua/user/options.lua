vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function apply(options)
  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

local options = {
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  number = true,
  relativenumber = true,
  mouse = "a",
}

apply(options)
