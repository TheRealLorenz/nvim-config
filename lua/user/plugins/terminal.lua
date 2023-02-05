return {
  "akinsho/toggleterm.nvim",
  config = true,
  keys = {
    {
      "<F7>",
      function()
        vim.cmd([[ToggleTerm direction=float]])
      end,
      desc = "Toggle Floating",
      mode = { "n", "t" },
    },
  },
}
