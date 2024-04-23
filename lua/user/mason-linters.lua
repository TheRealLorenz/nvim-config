local M = {}

local packages = require('mason-registry').get_installed_packages()
local linters = vim.tbl_filter(
  function(package)
    return vim.tbl_contains(package.spec.categories, "Linter")
  end,
  packages)

for _, linter in ipairs(linters) do
  for _, language in ipairs(linter.spec.languages) do
    local ft = string.lower(language)

    M[ft] = M[ft] or {}
    table.insert(M[ft], linter.name)
  end
end

return M
