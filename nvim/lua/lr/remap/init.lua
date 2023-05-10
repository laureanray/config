vim.g.mapleader = " "

-- Window nav
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Greatest REMAP ever, sabi ni Prime
map("x", "<leader>p", '"_dp', opts)
map("i", "<C-c>", "<Esc>", opts)

map("n", "Q", "<nop>", opts)
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
-- map("n", "<leader>f", vim.lsp.buf.format, opts)

map("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Move whichkey mapping to one place
-- d = { ":lua require('telescope.builtin').find_files({ cwd = '~/Projects/config' })<cr>", "Neovim Config" },
map("n", "<leader>d", "<Cmd>lua require('telescope.builtin').find_files({ cwd = '~/Projects/config' })<cr>", {
  desc =  "Project Files"
})

map("n", "<leader>x", "<Cmd>bdelete<cr>", { desc = "Delete Current Buffer"})
map("n", "<leader>F", "<Cmd>NvimTreeToggle<cr>", { desc = "File Tree"})
map("n", "<leader>f", "<Cmd>NvimTreeFocus<cr>", { desc = "Focus File Tree"})
map("n", "<leader>x", "<Cmd>Neoformat<cr>", { desc = "Format File"})
map("n", "<leader>o", "<Cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>", { desc = "Telescope Find Files" })
map("n", "<leader>p", "<Cmd>Telescope git_files<cr>", { desc = "Telescope Git Files"})
map("n", "<leader>l", "<Cmd>Telescope live_grep<cr>", { desc = "Telescope Live Grep"})
map("n", "<leader>b", "<Cmd>Telescope git_branches<cr>", { desc = "Telescope Git Branches"})
map("n", "<leader>cc", "<Cmd>Telescope git_commits<cr>", { desc = "Telescope Git Commits"})
map("n", "<leader>ca", "<Cmd>Lspsaga code_action<cr>", { desc = "Code Actions"})
map("n", "<leader>cpd", "<Cmd>lua require('goto-preview').goto_preview_definition()<cr>", { desc = "Goto Definition"})
map("n", "<leader>cd", "<Cmd>Telescope lsp_document_diagnostics<cr>", { desc = "Telescope Document Diagnostics"})
map("n", "<leader>cw", "<Cmd>Telescope lsp_workspace_diagnostics<cr>", { desc = "Telescope Global Diagnostics"})
map("n", "<leader>gg", "<Cmd>LazyGit<cr>", { desc = "Git status"})
map("n", "<leader>ga", "<Cmd>G add .<cr>", { desc = "Git add"})
map("n", "<leader>gc", "<Cmd>G commit<cr>", { desc = "Git commit"})
map("n", "<leader>gp", "<Cmd>G push<cr>", { desc = "Git push"})
map("n", "<leader>gC", "<Cmd>G checkout -b ", { desc = "Git checkout from current branch"})
map("n", "<leader>gP", "<Cmd>G pull<cr>", { desc = "Git pull"})
map("n", "<leader>gj", "<Cmd>diffget //2<cr>", { desc = "Get left side"})
map("n", "<leader>gk", "<Cmd>diffget //3<cr>", { desc = "Get right side"})
map("n", "<leader>q", "<Cmd>copen<cr>", { desc = "Open Quickfix List"})
map("n", "<leader>Q", "<Cmd>close<cr>", { desc = "Close Quickfix List"})
