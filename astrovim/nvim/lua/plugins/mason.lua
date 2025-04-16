---@type LazySpec
return {
  -- Use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- Python
        "pyright",

        -- PHP
        "intelephense",

        -- Javascript
        "ts_ls",
      })
    end,
  },
  
  -- Use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- Add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- Python
        "ruff",
        
        -- Django
        "djlint",

        -- SCSS
        "prettier",

        -- Javascript
        "deno",

        -- Nix
        "nil",
        "nixpkgs-fmt",
        
        -- Shell
        "shfmt",

        -- Lua
        "stylua",
      })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      -- Add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      })
    end,
  },
}
