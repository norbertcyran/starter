-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  clangd = {},
  gopls = {
    settings = {
      gopls = {
        usePlaceholders = true,
        staticcheck = true,
        analyses = {
          ususedparams = true,
        }
      },
    }
  },
}

for lsp, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[lsp].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
