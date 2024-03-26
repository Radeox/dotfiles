-- Custom keybindings
return {
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
        ["<C-q>"] = {"<cmd>bd<cr>", desc = "Close buffer"},

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
}
