local M = {}

--- @generic K: any
--- @generic V: any
---
--- @param f fun(v: V): boolean The predicate
--- @param t table<K, V> The table to search into
--- @return V? # The first element that matches the predicate, otherwise nil
M.tbl_find = function(f, t)
  local key = M.tbl_key(f, t)
  return key and t[key] or nil
end

--- @generic K: any
--- @generic V: any
---
--- @param f fun(v: V): boolean The predicate
--- @param t table<K, V> The table to search into
--- @return K? # The key fo the first element that matches the predicate, otherwise nil
M.tbl_key = function(f, t)
  for k, v in pairs(t) do
    if f(v) then
      return k
    end
  end
  return nil
end

M.buf_unique_names = function()
  local loaded_bufns = vim.tbl_filter(function(id)
    return vim.api.nvim_buf_is_loaded(id)
  end, vim.api.nvim_list_bufs())

  local full_paths = {}
  for _, i in ipairs(loaded_bufns) do
    local name = vim.api.nvim_buf_get_name(i)
    if name ~= '' then
      table.insert(full_paths, name)
    end
  end

  local split_paths = vim.tbl_map(function(item)
    return vim.split(item, '/', { trimempty = true })
  end, full_paths)

  local paths = vim.tbl_map(function(segments)
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
  end, split_paths)

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
