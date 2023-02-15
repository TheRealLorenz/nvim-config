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
    {
      "<leader>nh",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "History",
    },
  },
  config = function()
    vim.notify = require("notify")
    require("telescope").load_extension("notify")
  end,
  event = "UiEnter",
}
