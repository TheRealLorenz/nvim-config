return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Word" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "single",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    event = "BufReadPre",
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
        },
      })
    end,
  },
}
