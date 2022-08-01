local enable

if vim.fn.has("mac") == 1 then
  enable = false 
elseif vim.fn.has("unix") == 1 then
  enable = true 
elseif vim.fn.has('win32') == 1 then
  enable = true 
elseif vim.fn.has('win32') == 1 then
else
  print("Unsupported system for sumneko")
end


require("transparent").setup({
  enable = enable, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
