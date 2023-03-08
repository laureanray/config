local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback
nvim_tree.setup({
	renderer = {
		indent_markers = {
			enable = false,
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "",
				},
			},
		},
	},
	actions = {
		change_dir = {
			enable = false,
			global = false,
			restrict_above_cwd = true,
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	--auto_close          = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir   = {
	--   enable = true,
	--   auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	view = {
		adaptive_size = true,
		hide_root_folder = false,
		side = "right",
		mappings = {
			custom_only = false,
			list = {},
		},
	},
})
