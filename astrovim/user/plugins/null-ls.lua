return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    config.sources = {
      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.flake8,

      -- Djlint
      null_ls.builtins.formatting.djlint.with({
        -- timeout = 10000,
        args = { "--reformat --preserve-blank-lines" },
      }),

      -- Sass
      null_ls.builtins.formatting.prettierd.with({
        filetypes = { "scss", "sass" },
      }),

      -- Bash
      null_ls.builtins.formatting.shfmt.with({
        filetypes = { "sh", "zsh" },
      }),

      -- Javascript (ESLint)
      null_ls.builtins.formatting.prettierd.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      }),
    }
    return config
  end,
}
