local api = vim.api
local wrap = api.nvim_create_augroup("wrap", { clear = true })

-- Softwrap Markdown files
api.nvim_create_autocmd("FileType", {
	pattern = "md",
	command = "setlocal wrap",
	group = wrap,
})

-- Set 4 Spaces indent for Shell Scripts
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end
})

-- Floating Diagnostics
-- api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		if vim.bo.filetype == "yaml" then
-- 			return
-- 		end
-- 		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
-- 	end,
-- })

-- Detect groovy files and jenkinsfile -> Groovy
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Jenkinsfile,*.groovy",
	command = "set filetype=groovy",
})

-- Autoload files
api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
