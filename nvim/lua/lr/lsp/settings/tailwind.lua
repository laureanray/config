-- Lua lsp config
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for tailwindcss")
end


local tailwindcss_root_path

if vim.loop.os_uname().sysname == 'Darwin' then
  tailwindcss_root_path = '/Users/laureanray.bahala/tools/tailwindcss-language-server'
else
  tailwindcss_root_path = '/usr/local/lua'
end 
local tailwindcss_binary = tailwindcss_root_path.."/tailwindcss-language-server"


return {
  cmd = {tailwindcss_binary};
}
