return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>nd",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Delete All",
    },
  },
  config = function()
    vim.notify = require("notify")
  end,
  event = "UiEnter",
}
