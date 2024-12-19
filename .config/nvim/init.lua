require("config.options")
local statusbar = require("config.statusbar")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
-- require("config.cmp")
vim.o.statusline = "%{%v:lua.require'config.statusbar'.Status_Line()%}"
