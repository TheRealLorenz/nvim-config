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
    "stevearc/dressing.nvim",
    config = true,
    event = "UiEnter",
  },

  {
    "petertriho/nvim-scrollbar",
    config = true,
    event = "UiEnter",
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = true,
    event = "VeryLazy",
  }
}
