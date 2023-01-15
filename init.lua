local utils = require("user.utils")

-- Bootstrap lazy.nvim
require("user.bootstrap")

-- Apply options
local globals, options = unpack(require("user.options"))
utils.apply_globals(globals)
utils.apply_options(options)

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
