local opts = { silent = true }
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

set("n", "<Esc>", "<cmd>noh<CR>", { desc = "No highlight" })
set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Delete buffer (Force)" })
set("n", "<leader>hc", ":helpclose<CR>", { desc = "Close help window" })
set("n", "<leader>hh", ":help ", { desc = "Open help window" })

-- Normal mode buffer switching
set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

map("n", "<leader>bb", ":Gitsigns blame<CR>", { noremap = true, silent = true })
map("n", "<leader>lb", ":Gitsigns blame_line<CR>", { noremap = true, silent = true })

map("n", "<leader>ej", ":set filetype=ejs<CR>", { noremap = true, silent = true })
map("n", "<leader>ht", ":set filetype=html<CR>", { noremap = true, silent = true })
set("n", "<leader>cf", function()
  vim.lsp.buf.format()
end, { desc = "Format Code" })

-- vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent dir" })
-- vim.keymap.set("n", "<leader>of", require("oil").toggle_float, { desc = "Toggle Oil Float" })
