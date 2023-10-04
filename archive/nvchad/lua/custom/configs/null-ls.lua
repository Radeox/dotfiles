local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  -- Python
  formatting.isort,
  formatting.black,

  -- Django
  formatting.djlint.with {
    filetypes = {"html", "htmldjango"},
    extra_args = {"--preserve-blank-lines"}
  },
  -- Javascript
  formatting.prettier,

  -- CSS
  formatting.stylelint,

  -- Yaml
  lint.yamllint,

  -- JSON
  lint.jsonlint,

  -- Nix
  formatting.nixfmt,

  -- Shell
  formatting.shfmt,
  lint.shellcheck
}

-- Setup formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {group = augroup, buffer = bufnr}
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function() vim.lsp.buf.format {async = false} end
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,

  -- Format on save
  on_attach = on_attach
}
