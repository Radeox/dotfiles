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
}

-- Copilot
table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        vim.defer_fn(function()
            require("copilot").setup()
            require("copilot_cmp").setup()
        end, 100)
    end,
})

-- Minimap!
table.insert(lvim.plugins, {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    init = function()
        vim.g.minimap_width = 10
        vim.g.minimap_auto_start = 1
        vim.g.minimap_auto_start_win_enter = 1
    end
})

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
