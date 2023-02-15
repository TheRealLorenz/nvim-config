return {
  "akinsho/toggleterm.nvim",
  config = true,
  keys = {
    {
      "<leader>tf",
      "<cmd>exe v:count1 . 'ToggleTerm direction=float'<cr>",
      desc = "Toggle Floating",
      mode = { "n", "t" },
    },
    {
      "<leader>th",
      "<cmd>exe v:count1 . 'ToggleTerm direction=horizontal'<cr>",
      desc = "Toggle Horizontal",
      mode = { "n", "t" },
    },
  },
}
