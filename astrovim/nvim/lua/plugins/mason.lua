---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        "djlint",

        -- PHP
        "intelephense",

        -- Javascript
        "deno",

        -- SCSS
        "prettier",

        -- Nix
        "nil",
        "nixpkgs-fmt",
        
        -- Shell
        "shfmt",

        -- Lua
        "lua-language-server",
        "stylua",
      },
    },
  },
}
