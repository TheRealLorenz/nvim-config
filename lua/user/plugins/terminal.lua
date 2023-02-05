return {
  "akinsho/toggleterm.nvim",
  config = true,
  keys = {
    {
      "<leader>tf",
      function()
        vim.cmd([[ToggleTerm direction=float]])
      end,
      desc = "Toggle Floating",
      mode = { "n", "t" },
    },
    {
      "<leader>th",
      function()
        vim.cmd([[ToggleTerm direction=horizontal]])
      end,
      desc = "Toggle Horizontal",
      mode = { "n", "t" },
    }
  },
}
