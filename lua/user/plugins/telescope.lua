return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Word" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },

  {
    "cljoly/telescope-repo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope").extensions.repo.list()
        end,
        desc = "Find Repos",
      },
    },
    config = function()
      require("telescope").load_extension("repo")
    end,
  },
}
