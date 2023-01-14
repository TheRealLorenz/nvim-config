return {
  "nvim-telescope/telescope.nvim",

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
