---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },

    -- Diagnostics configuration
    diagnostics = {
      virtual_text = true,
      underline = true,
    },

    -- Vim options can be configured here
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "auto",
        wrap = false,
      },
      
      -- Global mappings
      g = {},
    },

    -- Mappings
    mappings = {
      -- Normal
      n = {
        -- Save file
        ["<C-s>"] = {"<cmd>w<cr>", desc = "Save file"},

        -- Find files
        ["<C-Space>"] = {"<cmd>Telescope find_files<cr>", desc = "Find files"},

        -- Find recent files
        ["<C-S-Space>"] = {"<cmd>Telescope oldfiles<cr>", desc = "Find recent files"},

        -- Ripgrep files
        ["<C-S-r>"] = {"<cmd>Telescope live_grep<cr>", desc = "Ripgrep files"},

        -- Show buffers
        ["<C-b>"] = {"<cmd>Telescope buffers<cr>", desc = "Show buffers"},

        -- Cycle buffers
        ["<Tab>"] = {"<cmd>bnext<cr>", desc = "Cycle buffers"},
        ["<S-Tab>"] = {"<cmd>bprevious<cr>", desc = "Cycle buffers"},

        -- Toggle Explorer
        ["<C-n>"] = {"<cmd>Neotree toggle<cr>", desc = "Toggle Explorer"},

        -- Session manager
        ["<leader>ss"] = {"<cmd>lua require 'resession'.save()<cr>", desc = "Save session"},
        ["<leader>sf"] = {"<cmd>lua require 'resession'.load()<cr>", desc = "Load session"},
        ["<leader>sd"] = {"<cmd>lua require 'resession'.delete()<cr>", desc = "Delete session"},

        -- Close buffer
        ["<C-q>"] = {"<cmd>bdelete<cr>", desc = "Close buffer"},

        -- Switch between windows
        ["<A-up>"] = {"<C-w>k", desc = "Switch between windows"},
        ["<A-right>"] = {"<C-w>l", desc = "Switch between windows"},
        ["<A-down>"] = {"<C-w>j", desc = "Switch between windows"},
        ["<A-left>"] = {"<C-w>h", desc = "Switch between windows"},

        -- Clear search
        ["<esc>"] = {"<cmd>noh<cr>", desc = "Clear search"},
      },
      
      -- Insert mode
      i = {
          -- Save file
          ["<C-s>"] = {"<cmd>w<cr>", desc = "Save file"},
      },
      
      -- Visual mode
      v = {
          -- Save file
          ["<C-s>"] = {"<cmd>w<cr>", desc = "Save file"},
      },
    },
  },
}
