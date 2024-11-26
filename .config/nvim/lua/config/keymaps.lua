local opts = { silent = true }
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', opts)

vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "No highlight" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Delete buffer (Force)" })
vim.keymap.set("n", "<leader>hc", ":helpclose<CR>", { desc = "Close help window" })
vim.keymap.set("n", "<leader>hh", ":help ", { desc = "Open help window" })
