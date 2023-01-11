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
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "UiEnter",
    lazy = true,
    config = function()
      require("lualine").setup({})
      vim.cmd([[set noshowmode]])
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "UiEnter",
    config = true,
    lazy = true,
  },
}
