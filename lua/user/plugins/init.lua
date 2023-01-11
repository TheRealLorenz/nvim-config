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
    'folke/which-key.nvim',
    config = true,
    lazy = true,
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
    lazy = false,
  },

}
