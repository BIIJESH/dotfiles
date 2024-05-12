require("config.snippets")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.autoread = true
vim.opt.autowriteall = false
vim.opt.showcmd = false
vim.opt.laststatus = 2
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.title = true
vim.opt.backspace = "2"

-- Lazy mapping to convert JSON to Go struct
vim.opt.hlsearch = true
vim.opt.ignorecase = false

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.neo_window_position = "right"
vim.opt.clipboard:append("unnamedplus")
-- Enable word wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

vim.api.nvim_set_option("number", true) -- Show absolute line numbers
vim.api.nvim_set_option("relativenumber", true) -- Show relative line numbers
-- vim.opt.showbreak = "↩"
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
