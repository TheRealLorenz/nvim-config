return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    },
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
          ["<space>"] = false,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = true,
  },

  {
    "folke/which-key.nvim",
    config = true,
    lazy = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "UiEnter",
    lazy = true,
  },

  {
    "kylechui/nvim-surround",
    tag = "*",
    config = true,
    event = "UiEnter",
    lazy = true,
  },
}
