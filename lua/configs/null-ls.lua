local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.diagnostics.staticcheck.with({
      diagnostics_postprocess = function (diagnostic)
        diagnostic.severity = vim.diagnostic.severity["HINT"]
      end
    }),
  },
}

return opts
