---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      -- PHP, HTML, CSS, SCSS, Django
      -- null_ls.builtins.formatting.prettier.with({
      --   filetypes = { "php", "html", "css", "scss", "django" },
      --   disabled_filetypes = { "js" },
      -- }),

      -- Python
      -- null_ls.builtins.lint.ruff,
      --
      -- -- Django
      -- null_ls.builtins.formatting.djlint.with({
      --   args = {
      --     "$FILENAME",
      --     "--preserve-blank-lines",
      --     "--reformat",
      --     "-"
      --   },
      -- }),
    })
  end,
}
