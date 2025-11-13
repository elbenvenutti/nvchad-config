local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init

nvlsp.defaults()

local servers = { "html", "cssls", "eslint", "marksman", "jsonls", "stylelint_lsp", "cssls", "cssmodules_ls" }

vim.lsp.config("*", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    on_attach(client, bufnr)
  end,
})

vim.lsp.enable(servers)

vim.lsp.config("ts_ls", {
  init_options = {
    provideFormatter = false,
    preferences = {
      includeInlayEnumMemberValueHints = false,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayParameterNameHints = "all", -- 'none', 'literals', 'all'
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayVariableTypeHints = true,
    },
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    -- vim.g.inlay_hints_visible = true
    -- vim.lsp.inlay_hint.enable()
  end,
  capabilities = capabilities,
})
vim.lsp.enable "ts_ls"

vim.lsp.config("tailwindcss", {
  hovers = true,
  suggestions = true,
  root_dir = function(fname)
    local root_pattern = require("lspconfig").util.root_pattern(
      "tailwind.config.mjs",
      "tailwind.config.cjs",
      "tailwind.config.js",
      "next.config.js",
      "next.config.ts"
      -- "postcss.config.js"
    )
    return root_pattern(fname)
  end,
})
vim.lsp.enable "tailwindcss"
