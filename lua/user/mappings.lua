local utils = require("user.core.utils")
local options = { noremap = true, silent = true }

return {
  keymaps = {
    n = {
      -- Move around buffers
      ["<Tab>"] = { "<cmd>bp<cr>", options },
      ["<S-Tab>"] = { "<cmd>bn<cr>", options },
    },
    t = {
      -- Move around splits using Ctrl + {h,j,k,l} in terminal mode
      ["<C-h>"] = { "<C-\\><C-n><C-w>h", options },
      ["<C-j>"] = { "<C-\\><C-n><C-w>j", options },
      ["<C-k>"] = { "<C-\\><C-n><C-w>k", options },
      ["<C-l>"] = { "<C-\\><C-n><C-w>l", options },
    },
    i = {
      ["<C-\\>"] = {
        function()
          return vim.fn["codeium#Accept"]()
        end,
        { noremap = true, silent = true, expr = true, nowait = true },
      },
    },
  },
  ["which-key"] = {
    n = {
      ["<leader>"] = {
        p = {
          name = "Packages",
          L = { "<cmd>Lazy<cr>", "Lazy" },
          M = { "<cmd>Mason<cr>", "Mason", cond = utils.is_available("mason.nvim") },
        },
        n = {
          name = "Notifications",
          cond = utils.is_available("nvim-notify"),
        },
        f = {
          name = "Find",
          cond = utils.is_available("telescope.nvim"),
        },
        g = {
          function()
            require("user.core.lazygit"):toggle()
          end,
          "LazyGit",
          cond = require("user.core.lazygit") ~= nil,
        },
        t = {
          name = "Toggle",
          c = {
            function()
              if vim.o.background == "dark" then
                vim.o.background = "light"
              else
                vim.o.background = "dark"
              end
            end,
            "Toggle Colorscheme",
          },
        },
      },
    },
    v = {},
  },
}
