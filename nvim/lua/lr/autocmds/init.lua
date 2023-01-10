if vim.fn.has("nvim-0.7") then
	local api = vim.api

	local fmt = api.nvim_create_augroup("fmt", { clear = true })
	local wrap = api.nvim_create_augroup("wrap", { clear = true })

	api.nvim_create_autocmd("BufWritePre", {
--		pattern = "*(.mdx|.md)@<!", // THIS IS BROKEN, fix before enabling again
		command = "undojoin | Neoformat",
		group = fmt,
	})

	api.nvim_create_autocmd("FileType", {
		pattern = "md",
		command = "setlocal wrap",
		group = wrap,
	})

	api.nvim_create_autocmd(
		{ "CursorHold", "CursorHoldI" },
		{ command = 'lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})' }
	)

	--  api.nvim_create_autocmd(
	--    { "BufRead", "BufNewFile" },
	--    {  command = "Jenkinsfile setf groovy" }
	--  )
end
