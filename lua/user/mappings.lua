local options = { noremap = true, silent = true }

return {
  keymaps = {
    n = {
      -- Move around splits using Ctrl + {h,j,k,l}
      ["<C-h>"] = { "<C-w>h", options },
      ["<C-j>"] = { "<C-w>j", options },
      ["<C-k>"] = { "<C-w>k", options },
      ["<C-l>"] = { "<C-w>l", options },

      -- Move around buffers
      ["H"] = { "<cmd>bp<cr>", options },
      ["L"] = { "<cmd>bn<cr>", options },
    },
    t = {
      -- Move around splits using Ctrl + {h,j,k,l} in terminal mode
      ["<C-h>"] = { "<C-\\><C-n><C-w>h", options },
      ["<C-j>"] = { "<C-\\><C-n><C-w>j", options },
      ["<C-k>"] = { "<C-\\><C-n><C-w>k", options },
      ["<C-l>"] = { "<C-\\><C-n><C-w>l", options },
    },
  },

  ["which-key"] = {
    n = {
      ["<leader>"] = {
        p = {
          name = "Packages",
          L = { "<cmd>Lazy<cr>", "Lazy" },
          M = { "<cmd>Mason<cr>", "Mason", dependencies = "mason.nvim" },
        },
        n = {
          name = "Notifications",
          dependencies = "nvim-notify",
          h = {
            function()
              require("telescope").load_extension("notify")
              require("telescope").extensions.notify.notify()
            end,
            "History",
            dependencies = "telescope.nvim",
          },
        },
        f = {
          name = "Find",
          dependencies = "telescope.nvim",
        },
      },
    },
    v = {},
  },
}
