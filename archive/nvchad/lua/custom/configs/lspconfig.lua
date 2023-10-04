local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = {
  "cssls",
  "html",
  "pyright",
  "tsserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {on_attach = on_attach, capabilities = capabilities}
end

-- Config intelephense
lspconfig.intelephense.setup {
  init_options = {
    globalStoragePath = os.getenv('HOME') .. '/.local/share/intelephense'
  }
}
