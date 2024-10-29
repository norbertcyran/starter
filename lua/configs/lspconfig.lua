-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = function (client, bufnr)
  local map = vim.keymap.set
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  nvlsp.on_attach(client, bufnr)

  -- LSP mappings overrides
  map("n", "gi", "<cmd> Trouble lsp_implementations focus=true <cr>", opts "Go to implementations")
  map("n", "gr", "<cmd> Trouble lsp_references focus=true <cr>", opts "Go to references")
end

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  clangd = {},
  gopls = {
    settings = {
      gopls = {
        usePlaceholders = true,
        analyses = {
          ususedparams = true,
        }
      },
    }
  },
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          kubernetes = "*.k8s.yaml"
        }
      }
    }
  }
}

for lsp, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[lsp].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
