local options = {
  formatters_by_ft = {
    --   lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

return options
