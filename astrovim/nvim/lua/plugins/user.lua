---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Kanagawa colorscheme
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  
  -- Copilot
  { import = "astrocommunity.completion.copilot-lua" },
  { -- further customize the options set by the community
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },

  -- Smartcolumns
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },

  -- Bracket Rainbow
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  -- Override splash
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⡶⠖⣶⠤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢀⣠⡴⠚⡉⠡⢈⠙⢦⣴⠞⠛⠳⣦⡘⠛⢩⣿⣦⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠛⠷⢤⣴⣀⣁⣂⣬⣼⣇⣤⡌⠐⢈⠻⡦⠘⠛⡛⣧⠀⠀⠀⠀⣰⠏⠀⠙⣧⣀⣀⣴⠋⠈⠙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⡀⠀⣶⠶⠻⢧⡀⢹⣻⡟⣿⠃⣾⣧⠁⣰⣄⠙⣿⣛⠀⣀⣀⣰⠇⠀⠀⠀⠸⢻⠻⠃⠀⠀⠀⢘⣆⣀⡀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⢀⣴⣾⡝⠛⠛⣀⣴⣾⠧⢼⣯⣧⣿⡷⠇⣻⣀⣯⢹⡀⢄⡿⠀⣉⣽⢿⠃⠠⡾⠆⢠⣷⠄⠰⡷⠀⠘⣿⡽⣧⣀⠀⠀⠀⠀⠀⠀⠀",
        "⢀⡤⠶⠖⠋⣐⣴⠟⠁⡀⠄⡂⠈⣿⣿⠶⠶⢦⣍⠉⠈⠙⠛⠁⠀⢠⠏⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠘⣇⠀⠀⠀⠀⠀⠀⠀",
        "⡾⠷⢶⡌⠐⠈⡁⢄⣂⡰⢸⡿⣦⣿⣿⢀⠐⡀⠌⣧⠀⠀⠀⠀⢀⣾⣰⠖⠛⠉⠉⠈⢻⡿⣽⠷⣦⡀⠀⠀⠀⢰⣿⡆⠀⠀⠀⠀⠀⠀",
        "⢴⠛⠉⢰⡟⣧⠀⣸⡟⣇⢈⣷⢹⣿⣿⢦⣔⡀⢂⣿⠀⠀⠀⡴⢋⣿⣿⡆⠀⠀⠀⠀⠀⢷⣾⣿⠋⠁⠀⠀⠀⠀⠙⣻⡄⠀⠀⠀⠀⠀",
        "⠸⢦⣥⡾⠁⠿⣤⠼⠇⠛⠋⠀⠀⣿⣿⠀⠈⠉⠉⠁⠀⠀⠘⢷⡟⠮⣝⣇⠀⠀⠀⠀⢀⣀⡿⠁⠀⠀⠀⠀⠀⠀⠸⣿⣧⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⢸⡏⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⣻⠀⠀⠀⢸⠇⠀⠀⠻⠤⠶⠖⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢹⡀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠈⠓⣶⠶⠶⠶⠶⠶⠶⠶⠶⣶⠛⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⡇⠀⣴⣿⣦",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣤⣾⣅⣩⠏",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⢠⡞⠳⡦⠀⠀⠀⠀⠀⠀⠀⣠⠦⣤⡀⠀⠀⠀⠀⠀⢠⣿⣇⣼⠿⠋⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠒⠒⠖⠲⠒⠒⠛⠀⠀⠀⠀⠀⠀⠙⠓⠒⠒⠒⠒⠒⠦⠶⠴⠿⠶⠶⠴⠖⠒⠒⠒⠚⠛⠉⠁⠀⠀⠀⠀",
      }
      return opts
    end,
  },
}
