local lualine = require("lualine")
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    lualine.refresh({
      place = { "statusline" },
    })
  end,
})
-- Hyprlang LSP
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
		pattern = {"*.hl", "hypr*.conf"},
		callback = function()
				vim.lsp.start {
						name = "hyprlang",
						cmd = {"hyprls"},
						root_dir = vim.fn.getcwd(),
				}
		end
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    local timer = vim.loop.new_timer()
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        lualine.refresh({
          place = { "statusline" },
        })
      end)
    )
  end,
})
local function clear_all_recorded_registers()
  -- Clear alphabetical registers (a-z)
  for i = 97, 122 do
    vim.fn.execute("let @" .. string.char(i) .. '=""')
  end

  -- Clear numeric registers (0-9)
  for i = 48, 57 do
    vim.fn.execute("let @" .. string.char(i) .. '=""')
  end

  -- Clear special registers
  vim.fn.execute('let @"=""') -- Unnamed register
  vim.fn.execute('let @*=""') -- Clipboard register
end
clear_all_recorded_registers()
