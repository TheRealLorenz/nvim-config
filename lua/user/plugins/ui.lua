return {

  {
    "akinsho/nvim-bufferline.lua",
    event = "BufAdd",
    lazy = true,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    event = "UiEnter",
    lazy = true,
    config = function()
        require('lualine').setup({})
        vim.cmd([[set noshowmode]])
    end,
  },

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
        function() 
          require("telescope").load_extension("notify")
          require("telescope").extensions.notify.notify()
        end,
        desc = "History",
      },
    },
    config = function()
        vim.notify = require('notify')
    end,
    event = "UiEnter",
    lazy = true,
  },
  
  {
    "stevearc/dressing.nvim",
    event = "UiEnter",
    config = true,
    lazy = true,
  },

}
