function Insert_console_log()
	vim.api.nvim_put({ "console.log('" .. vim.fn.expand("<cword>") .. ": ', " }, "", true, true)
	vim.api.nvim_command("startinsert!")
end
