local options = require('user.options')

-- Set vim.g
for k, v in pairs(options.g) do
  vim.g[k] = v
end

-- Set vim.opt
for k, v in pairs(options.opt) do
  vim.opt[k] = v
end

