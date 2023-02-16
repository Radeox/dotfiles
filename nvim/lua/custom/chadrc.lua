local M = {}

-- Import keyboard mappings
M.mappings = require "custom.mappings"

-- Import plugins
M.plugins = require "custom.plugins"

-- Change default theme
M.ui = {
  theme_toggle = { "ayu-dark", "one_light" },
  theme = "ayu-dark",
}

return M
