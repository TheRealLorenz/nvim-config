local notifications_history = function()
    local ok, telescope = pcall(require, 'telescope')
    if ok then
        telescope.load_extension("notify")
        telescope.extensions.notify.notify()
    else
        vim.notify("'telescope.nvim' required to search notifications history")
    end
end

return {

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>nd",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete All",
      },
      {
        "<leader>nh",
           notifications_history,
        desc = "History",
      },
    },
    config = function()
        vim.notify = require('notify')
    end,
    event = "UiEnter",
    lazy = true,
  },

}
