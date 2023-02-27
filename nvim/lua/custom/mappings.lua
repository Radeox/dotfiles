-- lua/custom/mappings
local M = {}

M.general = {
  -- Normal mode mappings
  n = {
    -- Open Telescope in find file mode
    ["<C-space>"] = { "<cmd> Telescope find_files <CR>", "Find file" },

    -- Open Telescope in find file mode (without ignoring anything)
    ["<C-S-space>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all files" },

    -- Open Telescope in buffers mode
    ["<C-b>"] = { "<cmd> Telescope buffers <CR>", "Find buffer" },

    -- Switch between windows
    ["<A-left>"] = { "<C-w>h", "Window left" },
    ["<A-right>"] = { "<C-w>l", "Window right" },
    ["<A-down>"] = { "<C-w>j", "Window down" },
    ["<A-up>"] = { "<C-w>k", "Window up" },

    -- Save file as sudo
    ["<leader>w"] = { "<cmd> :SudaWrite <CR>", "Sudo save" },

    -- Format file
    ["<C-f>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    -- Toggle comment
    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },

    -- Close current buffer
    ["<C-q>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },

    -- Open floating terminal
    ["<leader>t"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle terminal",
    },
  },

  -- Visual mode mappings
  v = {
    -- Toggle comment
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },

  -- Insert mode mappings
  i = {
    -- Toggle comment
    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },
}

return M
