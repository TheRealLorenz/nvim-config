return {
  'echasnovski/mini.nvim',
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
      },
      config = {
        enable_autocmd = false,
      },
      lazy = true,
    },
  },
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    local bufremove = require 'mini.bufremove'
    bufremove.setup()
    vim.keymap.set('n', '<leader>bd', bufremove.delete, { desc = 'Delete' })

    require('mini.pairs').setup()

    require('mini.tabline').setup()

    local files = require 'mini.files'
    files.setup()
    vim.keymap.set('n', '<leader>e', files.open, { desc = 'Open Explorer' })

    require('mini.comment').setup {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    }

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
  end,
}
