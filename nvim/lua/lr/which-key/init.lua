local wk = require('which-key')

wk.setup{
  presets = {
    operators = false
  }
}

local mappings = {
  pj = {":lua require('telescope.builtin').file_browser({ cwd = '~/Projects'})<cr>", "Projects"},
  d = {":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })<cr>", "Neovim Config"},
  x = {":bdelete<cr>", "Delete Current Buffer"},
  f = {":NvimTreeToggle<cr>", "File Tree"},
  F = {":NvimTreeFocus<cr>", "Focus File Tree"},
  o = {":Telescope find_files<cr>", "Telescope Find Files"},
  p = {":Telescope git_files<cr>", "Telescope Git Files"},
  l = {":Telescope live_grep<cr>", "Telescope Live Grep"},
  b = {":Telescope git_branches<cr>", "Telescope Git Branches"},
  cc = {":Telescope git_commits<cr>", "Telescope Git Commits"},
  ca = {":Telescope lsp_code_actions<cr>", "Telescope Code Actions"},
  cd = {":Telescope lsp_document_diagnostics<cr>", "Telescope Document Diagnostics"},
  cw = {":Telescope lsp_workspace_diagnostics<cr>", "Telescope Global Diagnostics"},
  gg = {":G<cr>", "Git status"},
  ga = {":G add .<cr>", "Git add"},
  gc = {":G commit<cr>", "Git commit"},
  gp = {":G push<cr>", "Git push"},
  gP = {":G pull<cr>", "Git pull"},
  gj = {":diffget //2<cr>", "Get left side"},
  gk = {":diffget //3<cr>", "Get right side"}
}

local opts = {
  prefix = '<leader>'
}

wk.register(mappings, opts)
