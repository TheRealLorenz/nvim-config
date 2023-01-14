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
}
