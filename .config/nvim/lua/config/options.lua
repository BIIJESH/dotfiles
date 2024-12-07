-- Snippets configuration
require("config.snippets")

-- Use locals for better organization
local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- General settings
opt.scrolloff = 4
opt.autoread = true
opt.autowriteall = false
opt.showcmd = false
opt.laststatus = 2
opt.formatoptions:remove({ "c", "r", "o" })
opt.cursorline = true
opt.number = true
opt.title = true
opt.backspace = "2"
opt.hlsearch = true
opt.ignorecase = false

-- Backup and swapfile settings
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Split window behavior
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

-- Indentation settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.shiftround = true
opt.expandtab = true

-- Netrw settings
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Neo-tree settings
g.neo_window_position = "right"

-- Clipboard settings
opt.clipboard:append("unnamedplus")

-- Word wrapping settings
opt.wrap = true
opt.linebreak = true

-- Relative line numbers
opt.relativenumber = true

-- Filetype customization
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
