-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Remove auto-commenting on newline
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function() vim.opt_local.formatoptions:remove { "r", "o" } end,
})

-- Configure Intelephense LSP
local lspconfig = require "lspconfig"
lspconfig.intelephense.setup {
  -- You can set any specific configuration options here if needed
  init_options = {
    globalStoragePath = vim.fn.stdpath "data" .. "/intelephense",
  },
}
