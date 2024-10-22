require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-Q>", "<cmd> wqall <cr>", { desc = "Save and quit all" })
map("n", "<leader>fS", "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", { desc = "Find symbols" })
map("n", "<leader>fs", "<cmd> Telescope lsp_document_symbols <cr>", { desc = "Find symbols" })

map("n", "<leader>tt", "<cmd> Neotest run <cr>", { desc = "Run nearest test" })
map("n", "<leader>tf", "<cmd> Neotest run file <cr>", { desc = "Run tests in file" })
map("n", "<leader>tl", "<cmd> Neotest run last <cr>", { desc = "Run last test" })
map("n", "<leader>to", "<cmd> Neotest output-panel <cr>", { desc = "Test output" })
map("n", "<leader>ts", "<cmd> Neotest summary <cr>", { desc = "Tests summary" })

map("n", "gh", function() vim.lsp.buf.incoming_calls() end, { desc = "Call hierarchy" })
-- insert mode
map("i", "jk", "<ESC>")

-- visual mode
map("v", ">", ">gv", { desc = "indent" })


map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Write" })
