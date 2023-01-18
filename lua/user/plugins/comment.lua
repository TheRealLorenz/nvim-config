return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
      {
        "<leader>/",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Toggle Comment",
      },

      {
        "<leader>/",
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Toggle Comment",
        mode = "v",
      },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        context_commentstring = {
          enable = true,
        },
      })
    end,
  },
}
