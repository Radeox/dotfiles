-- Keybindings --

-- Save file with Ctrl-s
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"

-- Find files
lvim.keys.normal_mode["<C-Space>"] = ":Telescope find_files<CR>"

-- Find recent files
lvim.keys.normal_mode["<C-S-Space>"] = ":Telescope oldfiles<CR>"

-- Ripgrep files
lvim.keys.normal_mode["<C-S-r>"] = ":Telescope live_grep<CR>"

-- Show buffets
lvim.keys.normal_mode["<C-b>"] = ":Telescope buffers<CR>"

-- Cycle buffers
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-Tab>"] = ":BufferLineCyclePrev<CR>"

-- Show NvimTree Explorer
lvim.keys.normal_mode["<C-n>"] = "<cmd>NvimTreeToggle<CR>"

-- Close buffer
lvim.keys.normal_mode["<C-q>"] = ":BufferKill<CR>"

-- Switch between windows
lvim.keys.normal_mode["<A-up>"] = "<C-w>k"
lvim.keys.normal_mode["<A-right>"] = "<C-w>l"
lvim.keys.normal_mode["<A-down>"] = "<C-w>j"
lvim.keys.normal_mode["<A-left>"] = "<C-w>h"

-- Toggle comment
lvim.keys.normal_mode["<C-/>"] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.visual_mode["<C-/>"] = "<Plug>(comment_toggle_linewise_visual)"

-- Toggle terminal
lvim.builtin.terminal.open_mapping = "<C-t>"

-- Plugins --

lvim.plugins = {
    -- Copilot
     {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()
                require("copilot_cmp").setup()
            end, 100)
        end,
    },

    -- Catppuccin theme
    {
        "catppuccin/nvim", name = "catppuccin",
        opts = {
            flavour = "mocha",
        },
    },

    -- Bracket rainbow
    {
        "mrjones2014/nvim-ts-rainbow",
    },

    -- Poetry virtual env
    {
        "petobens/poet-v",
        init = function()
            vim.g.poetv_auto_activate = 1
        end
    },

    -- Minimap!
    {
        'wfxr/minimap.vim',
        build = "cargo install --locked code-minimap",
        init = function()
            vim.g.minimap_width = 10
            vim.g.minimap_auto_start = 1
            vim.g.minimap_auto_start_win_enter = 1
        end
    },
}

-- Plugin specific configs
lvim.builtin.treesitter.rainbow.enable = true

-- Format on save
lvim.format_on_save.enabled = true

-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Default theme
lvim.colorscheme = "catppuccin-mocha"

-- LSP --

-- Setup formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    -- Python
    { name = "black" },

    -- SASS
    { name = "prettier" },
}

-- Setup linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    -- Python
    { 
        command = "flake8",
        args= {
            filetypes = { "python" }
        }
    }
}

-- Import lspconfig module
local lspconfig = require'lspconfig'

-- Configure Intelephense LSP
lspconfig.intelephense.setup {
  -- You can set any specific configuration options here if needed
  init_options = {
    globalStoragePath = vim.fn.stdpath('data') .. '/intelephense',
  },
}

-- Setup Telescope
lvim.builtin.telescope = {
    active = true,
    defaults = {
        layout_strategy = "horizontal",
        path_display = { truncate = 2 },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            case_mode = "smart_case",
        },
    },
}
