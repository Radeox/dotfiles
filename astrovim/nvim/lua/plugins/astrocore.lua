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
        mousescroll = "ver:1,hor:4",
        number = true,
        relativenumber = false,
        signcolumn = "auto",
        spell = false,
        wrap = false,
      },
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

        -- Cycle buffers
        ["<Tab>"] = {"<cmd>bnext<cr>", desc = "Cycle buffers"},
        ["<S-Tab>"] = {"<cmd>bprevious<cr>", desc = "Cycle buffers"},

        -- Toggle Explorer
        ["<C-b>"] = {"<cmd>Neotree toggle<cr>", desc = "Toggle Explorer"},

        -- Session manager
        ["<leader>ss"] = {"<cmd>lua require 'resession'.save()<cr>", desc = "Save session"},
        ["<leader>sf"] = {"<cmd>lua require 'resession'.load()<cr>", desc = "Load session"},
        ["<leader>sd"] = {"<cmd>lua require 'resession'.delete()<cr>", desc = "Delete session"},

        -- Switch between windows
        ["<A-up>"] = {"<C-w>k", desc = "Switch between windows"},
        ["<A-right>"] = {"<C-w>l", desc = "Switch between windows"},
        ["<A-down>"] = {"<C-w>j", desc = "Switch between windows"},
        ["<A-left>"] = {"<C-w>h", desc = "Switch between windows"},

        -- Clear search
        ["<esc>"] = {"<cmd>noh<cr>", desc = "Clear search"},

        -- Toggle terminal
        ["<C-\\>"] = {"<Cmd>execute v:count . 'ToggleTerm'<CR>", desc = "Toggle terminal" },
        ["<C-`>"] = {"<Cmd>execute v:count . 'ToggleTerm'<CR>", desc = "Toggle terminal" },

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
        ["<F1>"] = {"<Cmd>execute v:count . 'ToggleTerm'<CR>", desc = "Toggle terminal" },

        -- Close buffer
        ["<C-q>"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
      }
    },
  },
}
