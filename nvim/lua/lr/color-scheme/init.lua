if vim.fn.has("mac") == 1 then
  vim.cmd('colorscheme rose-pine')
elseif vim.fn.has("unix") == 1 then
  vim.cmd('colorscheme rose-pine')
else
  print("Unsupported system for sumneko")
end
