if vim.fn.has("mac") == 1 then
  vim.opt.background = "dark" -- set this to dark or light
  vim.cmd.colorscheme "oxocarbon"	
elseif vim.fn.has("unix") == 1 then
	vim.cmd([[colorscheme mellifluous]])
else
	print("Unsupported system for sumneko")
end
