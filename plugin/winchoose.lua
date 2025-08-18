local M = {}

---@param windowID number
---@return boolean
M.is_regular_window = function(windowID)
  if not vim.api.nvim_win_is_valid(windowID) then
    return false
  end

  -- Exclude floating windows
  local config = vim.api.nvim_win_get_config(windowID)
  if config.relative ~= '' then
    return false
  end

  -- Exclude special buffers
  local buf = vim.api.nvim_win_get_buf(windowID)
  local buftype = vim.api.nvim_get_option_value('buftype', { buf = buf })
  if buftype ~= '' then
    return false
  end

  return true
end

local function create_popup(win, text)
  local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { text })

  local width = #text
  local height = 1

  local config = {
    relative = 'win',
    win = win,
    -- anchor = 'NW',
    width = width,
    height = height,
    row = 0,
    col = 1,
    style = 'minimal',
    focusable = false,
    zindex = 150,
    border = 'single',
  }

  return vim.api.nvim_open_win(buf, false, config)
end

local marks = {}
local function mark_windows(wins)
  for idx, win in ipairs(wins) do
    if M.is_regular_window(win) then
      marks[#marks + 1] = create_popup(win, ' WINDOW ' .. idx .. ' ')
    end
  end
end

local function unmark_windows()
  for _, mark in ipairs(marks) do
    vim.api.nvim_win_hide(mark)
  end
  marks = {}
end

---@param on_window fun(windowID?: integer)
M.select_window = function(on_window)
  local wins = vim.api.nvim_list_wins()
  mark_windows(wins)

  vim.ui.input({ prompt = 'Select window: ' }, function(input)
    unmark_windows()
    local idx = tonumber(input)
    on_window(wins[idx])
  end)
end

return M.select_window
