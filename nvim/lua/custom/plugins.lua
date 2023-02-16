return {
  -- Copilot
  ["github/copilot.vim"] = {},

  -- Nerd Commenter
  ["preservim/nerdcommenter"] = {},

  -- Null-ls
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
   },

  -- Suda
  ["lambdalisue/suda.vim"] = {},
}
