local wk = require("which-key")

wk.setup({
	presets = {
		operators = false,
		motions = false,
		text_objects = false,
	},
})

local mappings = {
	pj = { ":lua require('telescope.builtin').file_browser({ cwd = '~/Projects'})<cr>", "Projects" },
	d = { ":lua require('telescope.builtin').find_files({ cwd = '~/Projects/config' })<cr>", "Neovim Config" },
	x = { ":bdelete<cr>", "Delete Current Buffer" },
	f = { ":NvimTreeToggle<cr>", "File Tree" },
	F = { ":NvimTreeFocus<cr>", "Focus File Tree" },
	o = {
		":lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>",
		"Telescope Find Files",
	},
	p = { ":Telescope git_files<cr>", "Telescope Git Files" },
	l = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
	b = { ":Telescope git_branches<cr>", "Telescope Git Branches" },
	cc = { ":Telescope git_commits<cr>", "Telescope Git Commits" },
	ca = { ":Lspsaga code_action<cr>", "Code Actions" },
	cpd = { ":lua require('goto-preview').goto_preview_definition()<cr>", "Goto Definition" },
	cd = { ":Telescope lsp_document_diagnostics<cr>", "Telescope Document Diagnostics" },
	cw = { ":Telescope lsp_workspace_diagnostics<cr>", "Telescope Global Diagnostics" },
	gg = { ":LazyGit<cr>", "Git status" },
	ga = { ":G add .<cr>", "Git add" },
	gc = { ":G commit<cr>", "Git commit" },
	gp = { ":G push<cr>", "Git push" },
	gC = { ":G checkout -b ", "Git checkout from current branch" },
	gP = { ":G pull<cr>", "Git pull" },
	gj = { ":diffget //2<cr>", "Get left side" },
	gk = { ":diffget //3<cr>", "Get right side" },
	t = {
		":FloatermNew --height=0.6 --width=0.4 --wintype=float --name=term --position=topleft --autoclose=2 <cr>",
		"Floating Term",
	},
	q = { ":copen<cr>", "Open Quickfix List" },
	Q = { ":close<cr>", "Close Quickfix List" },
}

local opts = {
	prefix = "<leader>",
}

wk.register(mappings, opts)
