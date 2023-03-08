if vim.fn.has("mac") == 1 then
	vim.cmd.colorscheme("nightfly")
elseif vim.fn.has("unix") == 1 then
	vim.cmd([[colorscheme mellifluous]])
else
	print("Unsupported system for sumneko")
end
