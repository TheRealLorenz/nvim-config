return {
  {
    "akinsho/bufferline.nvim",
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
    event = "UiEnter",
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({})
      vim.cmd([[set noshowmode]])
    end,
    event = "UiEnter",
  },

  {
    "stevearc/dressing.nvim",
    config = true,
    event = "UiEnter",
  },

  {
    "petertriho/nvim-scrollbar",
    config = true,
    event = "UiEnter",
  },
}
