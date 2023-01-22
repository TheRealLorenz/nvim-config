-- Apply user opions
require("user.core.options")

-- Bootstrap lazy.nvim
require("user.bootstrap")

require("lazy").setup("user.plugins", {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
})
require("user.mappings")
require("user.autocmds")
