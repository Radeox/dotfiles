-- lua/custom/mappings
local M = {}

M.general = {
    -- Normal mode mappings
    n = {
        -- Open Telescope in recent file mode
        ["<C-space>"] = {"<cmd> Telescope find_files <CR>", "Find file"},

        -- Open Telescope in recent file mode
        ["<C-S-space>"] = {"<cmd> Telescope oldfiles <CR>", "Show recent files"},

        -- Open Telescope in grep mode
        ["<C-S-r>"] = {"<cmd> Telescope live_grep <CR>", "Grep files"},

        -- Open Telescope in buffers mode
        ["<C-b>"] = {"<cmd> Telescope buffers <CR>", "Find buffer"},

        -- Open lazygit
        ["<C-g>"] = {"<cmd> :terminal lazygit <CR>", "Open lazygit"},

        -- Open new tab
        ["<C-t>"] = {"<cmd> :tabnew <CR>", "New tab"},

        -- Switch between windows
        ["<A-left>"] = {"<C-w>h", "Window left"},
        ["<A-right>"] = {"<C-w>l", "Window right"},
        ["<A-down>"] = {"<C-w>j", "Window down"},
        ["<A-up>"] = {"<C-w>k", "Window up"},

        -- Save file as sudo
        ["<leader>w"] = {"<cmd> :SudaWrite <CR>", "Sudo save"},

        -- Format file
        ["<C-f>"] = {
            function() vim.lsp.buf.format {async = true} end, "LSP formatting"
        },

        -- Toggle comment
        ["<C-/>"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end, "Toggle comment"
        },

        -- Close current buffer
        ["<C-q>"] = {
            function() require("nvchad.tabufline").close_buffer() end,
            "Close buffer"
        },

        -- Open floating terminal
        ["<leader>t"] = {
            function() require("nvterm.terminal").toggle "float" end,
            "Toggle terminal"
        }
    },

    -- Visual mode mappings
    v = {
        -- Toggle comment
        ["<C-/>"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "Toggle comment"
        }
    },

    -- Insert mode mappings
    i = {
        -- Toggle comment
        ["<C-/>"] = {
            function()
                require("Comment.api").toggle.linewise.current()
            end, "Toggle comment"
        }
    }
}

return M
