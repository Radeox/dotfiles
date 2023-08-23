local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
    formatting.isort, formatting.black, -- Python
    formatting.djlint.with {
        filetypes = {"html", "htmldjango"},
        extra_args = {"--preserve-blank-lines"}
    }, -- Django
    formatting.prettier, -- Javascript
    formatting.stylelint, -- CSS
    lint.yamllint, -- Yaml
    lint.jsonlint, -- Json
    formatting.nixfmt, -- Nix
    formatting.lua_format, -- Lua
    formatting.shfmt, lint.shellcheck
    -- Shell
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
