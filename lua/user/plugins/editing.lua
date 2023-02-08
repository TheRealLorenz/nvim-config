return {
  {
    "windwp/nvim-autopairs",
    config = true,
    event = "BufReadPre",
  },

  {
    "kylechui/nvim-surround",
    tag = "*",
    config = true,
    event = "BufReadPre",
  },

  {
    "Darazaki/indent-o-matic",
    event = "BufReadPre",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
  },

  {
    "Exafunction/codeium.vim",
    event = "BufReadPre",
  },

  {
    "ThePrimeagen/refactoring.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        desc = "Refactor",
      },
      {
        "<leader>r",
        [[ <Esc><Cmd>lua require('refactoring').select_refactor()<cr> ]],
        desc = "Refactor",
        mode = "v",
      },
    },
  },

  {
    "mizlan/iswap.nvim",
    keys = {
      {
        "<leader>I",
        function()
          vim.cmd([[ISwap]])
        end,
        desc = "ISwap",
      },
    },
  },
}
