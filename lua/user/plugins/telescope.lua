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
    "nvim-telescope/telescope-project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope").extensions.project.project()
        end,
        desc = "Find Projects",
      },
    },
    config = function()
      require("telescope").load_extension("project")
    end,
  },
}
