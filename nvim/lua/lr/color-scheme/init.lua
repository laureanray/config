-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme

if vim.fn.has("mac") == 1 then
  vim.cmd[[colorscheme poimandres]]
elseif vim.fn.has("unix") == 1 then
  vim.cmd[[colorscheme boo]]
else
  print("Unsupported system for sumneko")
end
