-- Apply user opions
require("user.core.options")

-- Bootstrap lazy.nvim
require("user.lazy.bootstrap")

require("lazy").setup("user.plugins", require('user.lazy.config'))
require("user.mappings")
require("user.core.autocmds")
