return {
  "gennaro-tedesco/nvim-possession",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  config = true,
  keys = {
    {
      "<leader>sl",
      function()
        require("nvim-possession").list()
      end,
      desc = "List Sessions",
    },
    {
      "<leader>sn",
      function()
        require("nvim-possession").new()
      end,
      desc = "New Session",
    },
    {
      "<leader>su",
      function()
        require("nvim-possession").update()
      end,
      desc = "Update Session",
    },
  },
}
