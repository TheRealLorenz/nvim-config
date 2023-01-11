local notify_history = function()
    local ok, telescope = require('telescope')
    if ok then
        telescope.load_extension("notify")
        telescope.extensions.notify.notify()
    else
        vim.notify("'telescope.nvim' required for notify history search")
    end
end

return { notify_history }
