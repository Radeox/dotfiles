return {
  -- Copilot
  ["github/copilot.vim"] = {},

  -- Nerd Commenter
  ["preservim/nerdcommenter"] = {},

  -- Null-ls
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Suda
  ["lambdalisue/suda.vim"] = {},

  -- Nvterm (terminal) override
  ["NvChad/nvterm"] = {
    override_options = function()
      return {
        terminals = {
          type_opts = {
            float = {
              width = 0.7,
              height = 0.7,
              row = 0.15,
              col = 0.15,
            },
          },
        },
      }
    end,
  },

  -- LSP
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- Nvim-cmp (completion) override
  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      local cmp = require "cmp"

      return {
        mapping = {
          -- Override default cmap to prioritize copilot
          ["<Tab>"] = cmp.mapping(function(fallback)
            local copilot_keys = vim.fn["copilot#Accept"]()
            if copilot_keys ~= "" and type(copilot_keys) == "string" then
              print "copilot"
              vim.api.nvim_feedkeys(copilot_keys, "n", true)
            else
              print "fallback"
              fallback()
            end
          end, {
            "i",
            "s",
          }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").jumpable(1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
      }
    end,
  },

  -- Mason default packages
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- Python
        "black",
        "isort",
        "pyright",
        "python-lsp-server",

        -- Django
        "djlint",

        -- Javascript
        "prettier",
        "typescript-language-server",

        -- CSS
        "stylelint-lsp",

        -- Json
        "json-lsp",
        "jsonlint",

        -- Yaml
        "yamllint",

        -- Markdown
        "markdownlint",

        -- Tailwind
        "tailwindcss-language-server",

        -- PHP
        "phpactor",

        -- Webdev
        "css-lsp",
        "emmet-ls",
        "html-lsp",

        -- Docker
        "docker-compose-language-service",
        "dockerfile-language-server",

        -- Shell
        "shfmt",
        "shellcheck",

        -- Lua
        "lua-language-server",
        "stylua",
      },
    },
  },
}
