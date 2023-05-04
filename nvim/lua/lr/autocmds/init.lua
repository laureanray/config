if vim.fn.has("nvim-0.7") then
	local api = vim.api

	local fmt = api.nvim_create_augroup("fmt", { clear = true })
	local wrap = api.nvim_create_augroup("wrap", { clear = true })

	api.nvim_create_autocmd("BufWritePre", {
		--		pattern = "*(.mdx|.md)@<!", // THIS IS BROKEN, fix before enabling again
		command = "Neoformat",
		group = fmt,
	})

	api.nvim_create_autocmd("FileType", {
		pattern = "md",
		command = "setlocal wrap",
		group = wrap,
	})

	api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		pattern = "*",
		callback = function()
			if vim.bo.filetype == "helm" then
				return
			end
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
	})

	api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = "Jenkinsfile,*.groovy",
		command = "set filetype=groovy",
	})

	--  api.nvim_create_autocmd(
	--    { "BufRead", "BufNewFile" },
	--    {  command = "Jenkinsfile setf groovy" }
	--  )
end
