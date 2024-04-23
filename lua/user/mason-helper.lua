local M = {}

local function tool_by_ft(category)
  local t = {}

  local packages = require('mason-registry').get_installed_packages()
  local tools = vim.tbl_filter(function(package)
    return vim.tbl_contains(package.spec.categories, category)
  end, packages)

  for _, tool in ipairs(tools) do
    for _, language in ipairs(tool.spec.languages) do
      local ft = string.lower(language)

      t[ft] = t[ft] or {}
      table.insert(t[ft], tool.name)
    end
  end

  return t
end

M.linters_by_ft = function()
  return tool_by_ft 'Linter'
end

M.formatters_by_ft = function()
  return tool_by_ft 'Formatter'
end

return M
