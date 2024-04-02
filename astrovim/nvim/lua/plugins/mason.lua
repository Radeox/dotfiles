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
        "tsserver",

        -- Lua
        "lua_ls",
      })
    end,
  },
  
  -- Use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- Python
        "black",
        "flake8",
        "isort",

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

        -- Lua
        "stylua",
      })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- Add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
      })
    end,
  },
}
