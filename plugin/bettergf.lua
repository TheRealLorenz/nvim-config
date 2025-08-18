local winchoose = require 'user.winchoose'

local function bettergf()
  -- Read filepath under cursor (es: file[:riga[:colonna]])
  local raw = vim.fn.expand '<cfile>'
  if raw == '' then
    print 'No file path under cursor.'
    return
  end

  -- Parsing file[:line[:col]]
  local path, lnum, col = raw:match '^([^:]+):?(%d*):?(%d*)$'
  lnum = tonumber(lnum)
  col = tonumber(col)

  winchoose(function(window)
    if not window then
      print 'No window selected'
    end

    -- Go to selected win
    vim.api.nvim_set_current_win(window)

    -- Open file
    vim.cmd('edit ' .. vim.fn.fnameescape(path))

    if lnum then
      vim.api.nvim_win_set_cursor(0, { lnum, (col or 1) - 1 })
    end
  end)
end

vim.keymap.set('n', 'gF', bettergf, { desc = 'Goto File' })
