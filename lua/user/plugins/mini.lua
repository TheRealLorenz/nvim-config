return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>c",
        function()
          MiniBufremove.wipeout()
        end,
        desc = "Close Buffer",
      },
    },
    config = function()
      require("mini.bufremove").setup()
    end,
    lazy = true,
  },

  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },
}
