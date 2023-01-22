local autocmds = require("user.autocmds")

for k, v in pairs(autocmds) do
  vim.api.nvim_create_autocmd(k, v)
end
