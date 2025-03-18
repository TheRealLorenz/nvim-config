return {
  'echasnovski/mini.nvim',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    local bufremove = require 'mini.bufremove'
    bufremove.setup()
    vim.keymap.set('n', '<leader>bd', bufremove.delete, { desc = 'Delete' })

    local pairs = require 'mini.pairs'
    pairs.setup()

    require('mini.tabline').setup()

    local files = require 'mini.files'
    files.setup()
    vim.keymap.set('n', '<leader>e', files.open, { desc = 'Open Explorer' })

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

    local notify = require 'mini.notify'
    notify.setup()

    vim.notify = notify.make_notify()

    require('mini.statusline').setup()

    require('mini.completion').setup()

    require('mini.icons').setup()
    MiniIcons.tweak_lsp_kind()

    local snippets = require 'mini.snippets'
    snippets.setup {
      snippets = {
        snippets.gen_loader.from_lang(),
      },
    }
  end,
}
