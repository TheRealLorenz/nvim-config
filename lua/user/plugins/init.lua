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
    'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = true,
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

  {
    'echasnovski/mini.bufremove',
    keys = {
      { "<leader>c", function() MiniBufremove.wipeout() end, desc = "Close Buffer" },
    },
    config = function() 
        require('mini.bufremove').setup() 
    end,
    lazy = true,
  },

}
