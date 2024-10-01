function Insert_console_log()
	vim.api.nvim_put({ "console.log('" .. vim.fn.expand("<cword>") .. ": ', " }, "", true, true)
	vim.api.nvim_command("startinsert!")
end


-- Define the function to insert 'return ()'
function InsertReturnSnippet()
  vim.api.nvim_put({ "return ()" }, "", true, true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, false, true), "n", false)
end

-- Autocommand for a specific file (replace 'path/to/myfile.jsx' with your file path)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "path/to/myfile.jsx",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<cmd>lua InsertReturnSnippet()<CR>", { noremap = true, silent = true })
  end,
})
