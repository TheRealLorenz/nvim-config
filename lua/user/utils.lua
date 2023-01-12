local M = {}
--- From AstroNvim (https://github.com/AstroNvim/AstroNvim)
---
--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
-- @param plugin the plugin string to search for
-- @return boolean value if the plugin is available
M.is_available = function(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.plugins and lazy_config.plugins[plugin]
end

return M
