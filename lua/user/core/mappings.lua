local apply_keymap = function(mode, k, v)
  if v[2] == nil then
    v[2] = {}
  end

  vim.keymap.set(mode, k, v[1], v[2])
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

  -- Apply insert mode keymaps
  for k, v in pairs(keymaps.i) do
    apply_keymap("i", k, v)
  end
end

local apply_which_keymaps = function(keymaps)
  local wk = require("which-key")

  -- Apply normal mode mappings
  wk.register(keymaps.n)

  -- Apply visual mode mappings
  wk.register(keymaps.v, { mode = "v" })
end

local mappings = require('user.mappings')

apply_keymaps(mappings.keymaps)
apply_which_keymaps(mappings["which-key"])
