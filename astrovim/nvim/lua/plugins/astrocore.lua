---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
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
        mousescroll = "ver:1,hor:4",
        relativenumber = false,
        number = true,
        signcolumn = "yes",
        wrap = false,
        spell = false,
      },
    },

    -- Mappings
    mappings = {
      -- Normal
      n = {
        -- Save file
        ["<C-s>"] = {"<cmd>w<cr>", desc = "Save file"},

        -- Find files
        ["<C-Space>"] = {function() Snacks.picker.smart() end, desc = "Find files"},

        -- Find recent files
        ["<C-S-Space>"] = {function() Snacks.picker.recent() end, desc = "Find recent files"},

        -- Ripgrep files
        ["<C-S-r>"] = {function() Snacks.picker.grep() end, desc = "Ripgrep files"},

        -- Cycle buffers
        ["<Tab>"] = {"<cmd>bnext<cr>", desc = "Cycle buffers"},
        ["<S-Tab>"] = {"<cmd>bprevious<cr>", desc = "Cycle buffers"},

        -- Toggle Explorer
        ["<C-b>"] = {function() Snacks.explorer() end, desc = "Toggle Explorer"},

        -- Session manager
        ["<Leader>ss"] = {"<cmd>lua require 'resession'.save()<cr>", desc = "Save session"},
        ["<Leader>sf"] = {"<cmd>lua require 'resession'.load()<cr>", desc = "Load session"},
        ["<Leader>sd"] = {"<cmd>lua require 'resession'.delete()<cr>", desc = "Delete session"},

        -- Switch between windows
        ["<A-up>"] = {"<C-w>k", desc = "Switch between windows"},
        ["<A-right>"] = {"<C-w>l", desc = "Switch between windows"},
        ["<A-down>"] = {"<C-w>j", desc = "Switch between windows"},
        ["<A-left>"] = {"<C-w>h", desc = "Switch between windows"},

        -- Clear search
        ["<esc>"] = {"<cmd>noh<cr>", desc = "Clear search"},

        -- Toggle terminal
        ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        ["<C-`>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

        -- Close buffer
        ["<C-q>"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
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

      -- Terminal mode
      t = {
        -- Toggle terminal
        ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        ["<C-`>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },

        -- Close buffer
        ["<C-q>"] = {"<cmd>q<cr>", desc = "Close buffer" },
      }
    },
  },
}
