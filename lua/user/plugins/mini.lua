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
  local hipatterns = require 'mini.hipatterns'
  hipatterns.setup {
    highlighters = {
      -- Highlight standalone 'FIXME', 'XXX', 'HACK', 'TODO', 'NOTE'
      fixme = {
        pattern = '%f[%w]()FIXME()%f[%W]',
        group = 'MiniHipatternsFixme',
      },
      xxx = { pattern = '%f[%w]()XXX()%f[%W]', group = 'MiniHipatternsFixme' },
      hack = {
        pattern = '%f[%w]()HACK()%f[%W]',
        group = 'MiniHipatternsHack',
      },
      todo = {
        pattern = '%f[%w]()TODO()%f[%W]',
        group = 'MiniHipatternsTodo',
      },
      note = {
        pattern = '%f[%w]()NOTE()%f[%W]',
        group = 'MiniHipatternsNote',
      },

      -- Highlight hex color strings (`#rrggbb`) using that color
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  }
  return hipatterns
end

local function notify_setup()
  local notify = require 'mini.notify'
  notify.setup()
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

local function snippets_setup()
  local snippets = require 'mini.snippets'
  snippets.setup {
    snippets = {
      snippets.gen_loader.from_lang(),
    },
  }
  return snippets
end

return {
  'echasnovski/mini.nvim',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    bufremove_setup()

    pairs_steup()

    require('mini.tabline').setup()

    files_setup()

    hipatterns_setup()

    notify_setup()

    require('mini.statusline').setup()

    require('mini.completion').setup()

    icons_setup()

    snippets_setup()
  end,
}
