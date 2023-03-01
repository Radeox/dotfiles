local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Python
  b.formatting.black,
  b.formatting.isort,

  -- Django
  b.formatting.djlint.with {
    extra_args = { "--preserve-blank-lines" },
  },

  -- Javascript
  b.formatting.prettier,

  -- CSS
  b.formatting.stylelint,

  -- Yaml
  b.diagnostics.yamllint,

  -- Json
  b.diagnostics.jsonlint,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck,

  -- Git
  b.code_actions.gitsigns,
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
  debounce = 100,
  -- Format on save
  on_attach = on_attach,
}
