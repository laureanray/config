if vim.fn.has("nvim-0.7") then
	local api = vim.api

	local fmt = api.nvim_create_augroup("fmt", { clear = true })
	local wrap = api.nvim_create_augroup("wrap", { clear = true })

	-- Autoformat, keeping this for now still deciding which file I need autoformat on.
	-- api.nvim_create_autocmd("BufWritePre", {
	-- 	--		pattern = "*(.mdx|.md)@<!", // THIS IS BROKEN, fix before enabling again
	-- 	command = "Neoformat",
	-- 	group = fmt,
	-- })

	-- Softwrap Markdown files
	api.nvim_create_autocmd("FileType", {
		pattern = "md",
		command = "setlocal wrap",
		group = wrap,
	})

	-- Floating Diagnostics
	api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		pattern = "*",
		callback = function()
			if vim.bo.filetype == "yaml" then
				return
			end
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
	})

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
  
  -- gotmpl
	api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = "Jenkinsfile,*.groovy",
		command = "if search('{{.\\+}}', 'nw') | setlocal filetype=gotmpl | endif",
	})
end
