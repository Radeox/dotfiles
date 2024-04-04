---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local none_ls = require "null-ls"

    config.sources = {
      -- PHP
      none_ls.builtins.formatting.prettier.with({
        filetypes = { "php" },
      }),

      -- Python
      none_ls.builtins.formatting.black,

      -- Django
      none_ls.builtins.formatting.djlint.with({
        args = {
          "$FILENAME",
          "--preserve-blank-lines",
          "--reformat",
          "-"
        },
      }),
    }
    return config
  end,
}
