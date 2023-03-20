local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  -- Python
  formatting.black,
  formatting.isort,

  -- Django
  formatting.djlint.with {
    extra_args = { "--preserve-blank-lines" },
  },

  -- Javascript
  formatting.prettier,

  -- PHP
  formatting.phpcbf,

  -- CSS
  formatting.stylelint,

  -- Yaml
  lint.yamllint,

  -- Json
  lint.jsonlint,

  -- Lua
  formatting.stylua,

  -- Shell
  formatting.shfmt,
  lint.shellcheck,
}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- Apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

-- Setup formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  -- Format on save
  on_attach = on_attach,
}
