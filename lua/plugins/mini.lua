local function bufremove_setup()
  local bufremove = require 'mini.bufremove'
  bufremove.setup()
  vim.keymap.set('n', '<leader>bd', bufremove.delete, { desc = 'Delete' })

  return bufremove
end

local function files_setup()
  local files = require 'mini.files'
  files.setup()
  vim.keymap.set('n', '<leader>e', files.open, { desc = 'Open Explorer' })
  return files
end

local function hipatterns_setup()
  local hi_words = require('mini.extra').gen_highlighter.words

  require('mini.hipatterns').setup {
    highlighters = {
      fixme = hi_words({ 'FIXME' }, 'MiniHipatternsFixme'),
      xxx = hi_words({ 'XXX' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK' }, 'MiniHipatternsHack'),
      todo = hi_words({ 'TODO' }, 'MiniHipatternsTodo'),
      note = hi_words({ 'NOTE' }, 'MiniHipatternsNote'),
    },
  }
end

local function notify_setup()
  local notify = require 'mini.notify'
  notify.setup {
    lsp_progress = { enable = false },
  }
  vim.notify = notify.make_notify()
  return notify
end

local function pairs_steup()
  local pairs = require 'mini.pairs'
  pairs.setup()
  return pairs
end

local function icons_setup()
  local icons = require 'mini.icons'
  icons.setup()
  icons.tweak_lsp_kind()
end

local function pick_setup()
  local picker = require 'mini.pick'
  local extra = require 'mini.extra'
  picker.setup()

  vim.ui.select = picker.ui_select

  vim.keymap.set(
    'n',
    '<leader>f',
    picker.builtin.files,
    { desc = 'Pick Files' }
  )
  vim.keymap.set(
    'n',
    '<leader>/',
    picker.builtin.grep_live,
    { desc = 'Live Grep' }
  )
  vim.keymap.set('n', '<leader>bp', picker.builtin.buffers, { desc = 'Pick' })
  vim.keymap.set(
    'n',
    '<leader>?',
    extra.pickers.commands,
    { desc = 'Commands' }
  )
  vim.keymap.set('n', '<leader>h', picker.builtin.help, { desc = 'Help' })
end

return {
  'echasnovski/mini.nvim',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require('mini.extra').setup()

    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    bufremove_setup()

    pairs_steup()

    require('mini.tabline').setup()

    files_setup()

    hipatterns_setup()

    notify_setup()

    icons_setup()

    pick_setup()
  end,
}
