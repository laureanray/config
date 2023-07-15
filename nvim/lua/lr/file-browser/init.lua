require("telescope").load_extension "file_browser"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
		hide_root_folder = false,
		side = "right",
		mappings = {
			custom_only = false,
			list = {},
		},
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
