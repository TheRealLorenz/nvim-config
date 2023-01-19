return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Grep" },
    },
  },

  {
    "folke/which-key.nvim",
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = "BufReadPre",
  },
}
