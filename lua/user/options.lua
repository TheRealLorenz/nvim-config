vim.g.mapleader = " "

local function apply(options)
  for k, v in pairs(options) do
    vim.opt[k] = v
  end
end

local options = {
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
}

apply(options)
