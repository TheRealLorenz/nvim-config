return {
  'echasnovski/mini.nvim',
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

    vim.keymap.set('i', '<CR>', function()
      if vim.fn.pumvisible ~= 0 then
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and vim.keycode '<C-y>' or pairs.cr()
      else
        return pairs.cr()
      end
    end, { expr = true })

    vim.keymap.set('i', '<Tab>', function()
      if vim.fn.pumvisible() ~= 0 then
        return vim.keycode '<C-n>'
      else
        return vim.keycode '<Tab>'
      end
    end, { expr = true })

    vim.keymap.set('i', '<S-Tab>', function()
      if vim.fn.pumvisible() ~= 0 then
        return vim.keycode '<C-p>'
      else
        return vim.keycode '<S-Tab>'
      end
    end, { expr = true })

    require('mini.icons').setup()
    MiniIcons.tweak_lsp_kind()
  end,
}
