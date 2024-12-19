
-- statusbar.lua
local M = {}

-- Check if Neovim is launched by the user (not through a shell like fish)
M.launched_by_user = function()
	local parent_process =
		vim.fn.system(string.format("ps -o ppid= -p %s | xargs ps -o comm= -p | tr -d '\n'", vim.fn.getpid()))
	return parent_process == "-fish"
end

-- Get the current Git branch name
local function get_branch_name()
	local branch = vim.fn.systemlist("git branch --show-current 2> /dev/null")[1]
	return branch and " " .. branch or ""
end

-- Get the current file name (relative to the home directory)
local function get_file_name()
	local root_path = vim.loop.cwd()
	local root_dir = root_path:match("[^/]+$")
	local home_path = vim.fn.expand("%:~")
	local overlap, _ = home_path:find(root_dir)
	if home_path == "" then
		return root_path:gsub(vim.env.HOME, "~")
	elseif overlap then
		return home_path:sub(overlap)
	else
		return home_path
	end
end

-- Set buffer variables for branch and file names
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
	group = vim.api.nvim_create_augroup("statusline", { clear = true }),
	callback = function()
		vim.b.branch_name = get_branch_name()
		vim.b.file_name = get_file_name()
	end,
})

-- Get the count of search matches
local function get_search_count()
	if vim.v.hlsearch == 1 and vim.api.nvim_get_mode().mode:match("n") then
		local search_count = vim.fn.searchcount({ maxcount = 0 })
		return ("%d/%d"):format(search_count.current, search_count.total)
	else
		return nil
	end
end

-- Get diagnostics (errors, warnings, etc.)
local function get_diagnostics()
	local diagnostics = vim.diagnostic.get(0)
	if #diagnostics == 0 or vim.api.nvim_get_mode().mode:match("^i") then
		return nil
	end

	local severities = {
		ERROR = { match = "Error", count = 0 },
		WARN = { match = "WARN", count = 0 },
		HINT = { match = "HINT", count = 0 },
		INFO = { match = "INFO", count = 0 },
	}

	for _, v in ipairs(diagnostics) do
		for k, _ in pairs(severities) do
			if v.severity == vim.diagnostic.severity[k] then
				severities[k].count = severities[k].count + 1
			end
		end
	end

	local output = {}
	for _, v in pairs(severities) do
		if v.count > 0 then
			table.insert(output, string.format("%%#Diagnostic%s#%s: %d%%*", v.match, v.match, v.count))
		end
	end

	return table.concat(output, " ")
end

-- Get the current progress in the buffer (line number)
local function get_progress()
	local p = vim.api.nvim_eval_statusline("%p", {}).str
	if p == "0" then
		return "top"
	elseif p == "100" then
		return "bot"
	else
		return ("%02d%s"):format(p, "%%")
	end
end

-- Left side of the statusline (file name and git branch)
local function generate_left(branch, file)
	branch = branch or vim.b.branch_name
	file = file or vim.b.file_name
	local left = {}
	if branch then
		table.insert(left, branch)
	end
	table.insert(left, file)
	left = { table.concat(left, " | ") }

	local modified_flag = vim.api.nvim_eval_statusline("%m", {}).str
	if modified_flag ~= "" then
		table.insert(left, modified_flag)
	end

	return table.concat(left, " ")
end

-- Generate the full statusline
function M.Status_Line()
	local left_string = generate_left()
	local right_table = {}

	local search_count = get_search_count()
	if search_count then
		table.insert(right_table, search_count)
	end

	local diagnostics = get_diagnostics()
	if diagnostics then
		table.insert(right_table, diagnostics)
	end

	local progress = get_progress()
	table.insert(right_table, progress)

	-- Concatenate everything for the right part of the statusline
	local right_string = table.concat(right_table, " | ")
	local divider = " | "

	-- Adjust for overflow
	local left_string_length = vim.api.nvim_eval_statusline(left_string, { maxwidth = 0 }).width
	local right_string_length = vim.api.nvim_eval_statusline(right_string, {}).width
	local length = left_string_length + right_string_length + divider:len()

	local overflow = length - vim.api.nvim_win_get_width(0)
	if overflow < 0 then
		divider = "%="
	end
	if overflow > 0 then
		left_string = left_string:sub(1, left_string_length - overflow) -- Truncate if necessary
	end

	-- Now, use %= to center the diagnostics
	return table.concat({ "%<", left_string, divider, "%=", right_string })
end

return M
