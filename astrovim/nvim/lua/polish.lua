-- Use spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

local lspconfig = require 'lspconfig'

-- Configure Intelephense LSP
lspconfig.intelephense.setup {
  -- You can set any specific configuration options here if needed
  init_options = {
    globalStoragePath = vim.fn.stdpath('data') .. '/intelephense',
  },
}

-- Change filetype for php files to phtml
vim.cmd [[
  augroup php_filetype
    autocmd!
    autocmd BufNewFile,BufRead *.php set filetype=phtml
  augroup END
]]
