---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Catppuccin colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  
  -- Tabnine
  { import = "astrocommunity.completion.tabnine-nvim" },

  -- Tabnine completion key
  {
    "codota/tabnine-nvim",
    opts = { accept_keymap = "<C-l>" },
  },

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

  -- Bracket Rainbow
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
}
