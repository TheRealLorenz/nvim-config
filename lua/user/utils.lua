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

return M
