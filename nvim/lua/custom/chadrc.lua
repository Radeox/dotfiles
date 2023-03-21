local M = {}

-- Import keyboard mappings
M.mappings = require "custom.mappings"

-- Import plugins
M.plugins = "custom.plugins"

-- Change default theme
M.ui = {
  theme_toggle = { "gruvchad", "everforest_light" },
  theme = "gruvchad",

  nvdash = {
    load_on_startup = true,
    header = {
      "                              ",
      "           ███████╗           ",
      "           ██╔════╝           ",
      "           █████╗             ",
      "           ██╔══╝             ",
      "           ██║                ",
      "           ╚═╝                ",
    },
    buttons = {
      { "  Find File", "C Spc", "Telescope find_files" },
      { "  Recent Files", "C-S Spc", "Telescope oldfiles" },
      { "  Find Word", "C-S r", "Telescope live_grep" },
      { "  Bookmarks", "C b", "Telescope marks" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

return M
