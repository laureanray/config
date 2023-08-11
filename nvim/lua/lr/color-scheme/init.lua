if vim.fn.has("mac") == 1 then
  vim.cmd('colorscheme moonfly')
elseif vim.fn.has("unix") == 1 then
  vim.cmd('colorscheme kulay')
else
  print("Unsupported system for sumneko")
end
