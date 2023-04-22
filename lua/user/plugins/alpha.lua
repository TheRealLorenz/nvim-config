--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
  local sc_ = sc:gsub("%s", "") -- :gsub(leader, "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 5,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }
  if keybind then
    keybind_opts =
    vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end

  local function on_press()
    local key =
    vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local header = {
  type = "text",
  val = {
    " ██████╗ ██████╗  █████╗ ███╗   ██╗██████╗ ███████╗  ",
    "██╔════╝ ██╔══██╗██╔══██╗████╗  ██║██╔══██╗██╔════╝  ",
    "██║  ███╗██████╔╝███████║██╔██╗ ██║██║  ██║█████╗    ",
    "██║   ██║██╔══██╗██╔══██║██║╚██╗██║██║  ██║██╔══╝    ",
    "╚██████╔╝██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗  ",
    " ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ",
    "████████╗███████╗ ██████╗  █████╗ ███╗   ███╗███████╗",
    "╚══██╔══╝██╔════╝██╔════╝ ██╔══██╗████╗ ████║██╔════╝",
    "   ██║   █████╗  ██║  ███╗███████║██╔████╔██║█████╗  ",
    "   ██║   ██╔══╝  ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ",
    "   ██║   ███████╗╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗",
    "   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝",
    "                                                     ",
  },
  opts = {
    position = "center",
    hl = "Type",
  },
}

local buttons = {
  type = "group",
  val = {
    button("e", "  New file", "<cmd>ene <cr>"),
    button("<leader> e", "  Open Neotree"),
    button("<leader> f f", "  Find file"),
    button("<leader> f w", "  Find word"),
    button("<leader> f p", "  Find projects"),
    button("<leader> g", "  Open Lazygit"),
  },
  opts = {
    spacing = 1,
  },
}

local config = {
  layout = {
    { type = "padding", val = 2 },
    header,
    { type = "padding", val = 2 },
    buttons,
  },
  opts = {
    margin = 5,
  },
}

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("alpha").setup(config)
  end,
  lazy = false,
}
