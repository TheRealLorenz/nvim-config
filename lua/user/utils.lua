local M = {}

M.buf_unique_names = function()
  local paths = vim
    .iter(vim.api.nvim_list_bufs())
    :filter(function(id)
      return vim.api.nvim_buf_is_loaded(id)
    end)
    :map(function(id)
      local path = vim.api.nvim_buf_get_name(id)
      return path ~= '' and path or nil
    end)
    :map(function(path)
      return vim.split(path, '/', { trimempty = true })
    end)
    :map(function(segments)
      local filename = table.remove(segments)
      return {
        name = filename,
        segments = segments,
        extend = function(self)
          if #self.segments then
            self.name = table.remove(self.segments) .. '/' .. self.name
          end
        end,
      }
    end)
    :totable()

  while true do
    local didExtend = false

    for i = 1, #paths do
      for j = i + 1, #paths do
        if paths[i].name == paths[j].name then
          didExtend = true
          paths[i]:extend()
          paths[j]:extend()
        elseif string.find(paths[i].name, paths[j].name) then
          didExtend = true
          paths[j]:extend()
        end
      end
    end

    if not didExtend then
      break
    end
  end

  local relative_paths = vim.tbl_map(function(path)
    return path.name
  end, paths)

  return relative_paths
end

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

M.goto_file = function()
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

  M.select_window(function(window)
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

return M
