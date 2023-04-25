return require("user.core.colorschemes").set_default({
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "navarasu/onedark.nvim",
    config = function()
      vim.cmd([[colorscheme onedark]])
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  }
})
