-- Custom keybindings
return {
    n = {
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

        -- Toggle Terminal
        ["<C-t>"] = {"<cmd>ToggleTerm<cr>", desc = "Toggle Terminal"},

        -- Bookmarks management
        ["<C-a>"] = {"<cmd>lua require 'ezbookmarks'.OpenBookmark()<cr>", desc = "Open bookmark"},
        ["<C-x>"] = {"<cmd>lua require 'ezbookmarks'.AddBookmark()<cr>", desc = "Add bookmark"},
        ["<C-y>"] = {"<cmd>lua require 'ezbookmarks'.RemoveBookmark()<cr>", desc = "Remove bookmark"},

        -- Close buffer
        ["<C-q>"] = {"<cmd>bd<cr>", desc = "Close buffer"},

        -- Switch between windows
        ["<A-up>"] = {"<C-w>k", desc = "Switch between windows"},
        ["<A-right>"] = {"<C-w>l", desc = "Switch between windows"},
        ["<A-down>"] = {"<C-w>j", desc = "Switch between windows"},
        ["<A-left>"] = {"<C-w>h", desc = "Switch between windows"},

        -- Clear search
        ["<esc>"] = {"<cmd>noh<cr>", desc = "Clear search"},
    },
}
