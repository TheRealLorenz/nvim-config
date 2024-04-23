local M = {}

local ft_by_tool = {
  clangd = { 'c', 'cpp' },
  ['clang-format'] = { 'c', 'cpp' },
  flake8 = { 'python' },
  jsonlint = { 'json' },
  lua_ls = { 'lua' },
  stylua = { 'lua' },
  pylint = { 'python' },
}

local function tool_by_ft(category)
  local t = {}

  local packages = require('mason-registry').get_installed_packages()
  local tools = vim.tbl_filter(function(package)
    return vim.tbl_contains(package.spec.categories, category)
  end, packages)

  for _, tool in ipairs(tools) do
    local fts = ft_by_tool[tool.name]

    if not fts then
      print(
        '`Tool -> File Type` mapping not specified for \'' .. tool.name .. '\''
      )
    else
      for _, ft in ipairs(fts) do
        t[ft] = t[ft] or {}
        table.insert(t[ft], tool.name)
      end
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
