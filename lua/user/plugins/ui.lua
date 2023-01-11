return {

  {
    "akinsho/nvim-bufferline.lua",
    event = "BufAdd",
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
    },
  },
  
  {
    "stevearc/dressing.nvim",
    event = "UiEnter",
    config = true,
    lazy = true,
  },

}
