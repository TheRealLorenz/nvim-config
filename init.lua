require("user.bootstrap")
require("user.options")
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
