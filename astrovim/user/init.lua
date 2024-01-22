return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
    remotes = {},
  },

  -- Set colorscheme to use
  colorscheme = "kanagawa",

  -- Diagnostics configuration
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- LSP configuration
  lsp = {
    formatting = {
      -- Save on format
      format_on_save = {
        enabled = true,
      },
    },
  },

  -- Lazy configuration
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configure
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Use spaces instead of tabs
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2

    local lspconfig = require 'lspconfig'

    -- Configure Intelephense LSP
    lspconfig.intelephense.setup {
      -- You can set any specific configuration options here if needed
      init_options = {
        globalStoragePath = vim.fn.stdpath('data') .. '/intelephense',
      },
    }
  end,
}
