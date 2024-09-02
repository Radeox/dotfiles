---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local none_ls = require "null-ls"

    config.sources = {
      -- PHP, HTML, CSS, SCSS, Django
      none_ls.builtins.formatting.prettier.with({
        filetypes = { "php", "html", "css", "scss", "django" },
        disabled_filetypes = { "js" },
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
