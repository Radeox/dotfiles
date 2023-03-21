return {
  -- Copilot
  { "github/copilot.vim", lazy = false },

  -- Suda
  { "lambdalisue/suda.vim" },

  -- Nvterm (terminal) override
  {
    "NvChad/nvterm",
    opts = function()
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
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Nvim-cmp (completion) override
  {
    "hrsh7th/nvim-cmp",
    opts = function()
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

  -- Marks
  {
    "chentoast/marks.nvim",
    lazy = false,
    opts = {
      config = function()
        require("marks").setup {
          refresh_interval = 250,
        }
      end,
    },
  },

  -- Mason default packages
  {
    "williamboman/mason.nvim",
    opts = {
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
        "phpcbf",

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
