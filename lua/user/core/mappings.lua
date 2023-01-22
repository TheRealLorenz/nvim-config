local apply_keymap = function(mode, k, v)
  if v[2] == nil then
    v[2] = {}
  end

  vim.api.nvim_set_keymap(mode, k, v[1], v[2])
end

local apply_keymaps = function(keymaps)
  -- Apply normal mode keymaps
  for k, v in pairs(keymaps.n) do
    apply_keymap("n", k, v)
  end

  -- Apply terminal mode keymaps
  for k, v in pairs(keymaps.t) do
    apply_keymap("t", k, v)
  end
end

local utils = require("user.core.utils")

local is_available = function(dependencies)
  if type(dependencies) == "string" and utils.is_available(dependencies) then
    return true
  end

  if type(dependencies) == "table" then
    for _, v in ipairs(dependencies) do
      if not utils.is_available(v) then
        return false
      end
    end
    return true
  end

  return nil
end

local function parse_dependencies(entry)
  if type(entry) ~= "table" then
    return entry
  end

  if entry.dependencies ~= nil and not is_available(entry.dependencies) then
    return nil
  end

  entry.dependencies = nil

  for k, v in pairs(entry) do
    if k ~= "name" then
      v = parse_dependencies(v)
    end
  end

  return entry
end

local apply_which_keymaps = function(keymaps)
  -- Parse dependencies
  for k, v in pairs(keymaps) do
    keymaps[k] = parse_dependencies(v)
  end

  local wk = require("which-key")

  -- Apply normal mode mappings
  wk.register(keymaps.n)

  -- Apply visual mode mappings
  wk.register(keymaps.v, { mode = "v" })
end

local mappings = require('user.mappings')

apply_keymaps(mappings.keymaps)
apply_which_keymaps(mappings["which-key"])
