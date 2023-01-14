require("user.bootstrap")
require("user.options")
require("lazy").setup("user.plugins", {
  defaults = {
    lazy = true,
  },
})
require("user.mappings")
require("user.autocmds")
