local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "package-lock", "node_modules", "Cargo.lock", "target/" }, -- Bind to shortcut to change this dynamically?
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
		hidden = false,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		layout_defaults = {},
		preview_cutoff = 1,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-w>"] = actions.send_to_qflist,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")
