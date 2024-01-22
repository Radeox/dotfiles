-- customize mason plugins
return {
  -- Use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- Python
        "pyright",

        -- PHP
        "intelephense",

        -- Javascript
        "tsserver",
      })
    end,
  },
  -- Use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- Python
        "black",
        "flake8",

        -- PHP
        "php-cs-fixer",
        
        -- Django
        "djlint",

        -- SCSS
        "prettier",

        -- Javascript
        "prettierd",
        
        -- SSH
        "shfmt",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
