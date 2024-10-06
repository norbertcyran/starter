require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-Q>", "<cmd> wqall <cr>", { desc = "Save and quit all" })
map("n", "<leader>fs", "<cmd> Telescope lsp_dynamic_workspace_symbols <cr>", { desc = "Find symbols" })

-- insert mode
map("i", "jk", "<ESC>")

-- visual mode
map("v", ">", ">gv", { desc = "indent"})


map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "Write" })
