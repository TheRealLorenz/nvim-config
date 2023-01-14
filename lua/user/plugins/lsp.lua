return {
  {
    "williamboman/mason.nvim",
    config = true,
    lazy = false,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers(require("user.lsp"))
    end,
    lazy = false,
  },

  "neovim/nvim-lspconfig",

  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        automatic_setup = true,
      })
      require("mason-null-ls").setup_handlers()
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    config = true,
    lazy = false,
  },

  {
    'j-hui/fidget.nvim',
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = true,
    event = "BufReadPre"
  },
}
