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
              vim.api.nvim_feedkeys(copilot_keys, "n", true)
            else
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

  -- Autosave
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    opts = {
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      execution_message = {
        message = function() -- message to print on save
          return ("AutoSave [" .. vim.fn.strftime "%H:%M:%S" .. "]")
        end,
        dim = 0.08, -- dim the color of `message`
        cleaning_interval = 1000, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
      trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
      -- function that determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      condition = function(buf)
        local fn = vim.fn
        local utils = require "auto-save.utils.data"

        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true -- met condition(s), can save
        end
        return false -- can't save
      end,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      debounce_delay = 5000, -- saves the file at most every `debounce_delay` milliseconds
    },
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
