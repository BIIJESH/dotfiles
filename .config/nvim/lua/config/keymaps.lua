local opts = { silent = true }

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "No highlight" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Delete buffer (Force)" })
vim.keymap.set("n", "<leader>hc", ":helpclose<CR>", { desc = "Close help window" })
vim.keymap.set("n", "<leader>hh", ":help ", { desc = "Open help window" })

-- vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent dir" })
-- vim.keymap.set("n", "<leader>of", require("oil").toggle_float, { desc = "Toggle Oil Float" })
