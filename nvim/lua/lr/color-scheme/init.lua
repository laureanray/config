if vim.fn.has("mac") == 1 then
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_foreground = "material"
	vim.g.gruvbox_material_better_performance = 1
	vim.cmd.colorscheme("gruvbox-material")
	-- vim.cmd.colorscheme("OceanicNext")
elseif vim.fn.has("unix") == 1 then
	vim.cmd([[colorscheme mellifluous]])
else
	print("Unsupported system for sumneko")
end
