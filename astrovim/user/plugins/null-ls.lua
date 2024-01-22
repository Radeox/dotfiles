return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    config.sources = {
      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.flake8,

      -- Django
      null_ls.builtins.formatting.djlint.with({
        args = { "--reformat --preserve-blank-lines" },
      }),
    }
    return config
  end,
}
