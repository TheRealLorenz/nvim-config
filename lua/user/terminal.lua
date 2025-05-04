local M = {}

local terminal = {
  win = -1,
  buf = 0,
}

M.toggle = function()
  if not vim.api.nvim_buf_is_valid(terminal.buf) then
    terminal.buf = 0
  end

  if not vim.api.nvim_win_is_valid(terminal.win) then
    terminal.win = vim.api.nvim_open_win(terminal.buf, true, {
      win = -1,
      height = 10,
      style = 'minimal',
      split = 'below',
    })
    if vim.bo[terminal.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
      terminal.buf = vim.api.nvim_get_current_buf()
      vim.bo[terminal.buf].buflisted = false

      local disabled_keymaps = { ']b', '[b', ']B', '[B' }
      for _, keymap in ipairs(disabled_keymaps) do
        vim.keymap.set('n', keymap, '', {
          buffer = terminal.buf,
          noremap = true,
          silent = true,
        })
      end
    end
  else
    vim.api.nvim_win_hide(terminal.win)
  end
end

return M
