vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Window nav
local opts = { noremap = true, silent = false }
local map = vim.api.nvim_set_keymap
-- Move to previous/next
-- map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
-- map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- -- Pin/unpin buffer
-- map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- -- Close buffer
-- map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

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
-- map("i", "<C-c>", "<Esc>", opts)

map("n", "Q", "<nop>", opts)
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
-- map("n", "<leader>f", vim.lsp.buf.format, opts)

map("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- debugger
map("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts)
map("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", opts)
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", opts)


vim.g.copilot_no_tab_map = true
map("i", "<C-J>", '<Cmd>require("copilot.panel", opts).accept()<CR>', { silent = true, expr = true })

-- Toggle Copilot Auto Trigger
map("n", "<leader>cp", "<cmd>lua require'copilot.suggestion'.toggle_auto_trigger()<CR>", opts)
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
map("n", "<leader>d", "<Cmd>lua require('telescope.builtin').find_files({ cwd = '~/Projects/config' })<cr>", opts)

map("n", "<leader>x", "<Cmd>bdelete<cr>", opts)
map("n", "<leader>x", "<Cmd>lua vim.lsp.buf.format()<cr>", opts)
map("n", "<leader>o",
    "<Cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>",
    opts)
map("n", "<leader>p", "<Cmd>Telescope git_files<cr>", opts)
map("n", "<leader>l", "<Cmd>Telescope live_grep<cr>", opts)
-- map("n", "<leader>b", "<Cmd>Telescope git_branches<cr>", opts)
map("n", "<leader>cc", "<Cmd>Telescope git_commits<cr>", opts)
-- map("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- LSP Saga code action
-- map("n", "<leader>ca", "<Cmd>Lspsaga code_action<cr>", opts)
map("n", "<leader>cpd", "<Cmd>lua require('goto-preview').goto_preview_definition()<cr>", opts)
-- map("n", "<leader>cd", "<Cmd>Telescope lsp_document_diagnostics<cr>", opts)
map("n", "<leader>cd", "<Cmd>Telescope diagnostics<cr>", opts)
map("n", "<leader>gg", "<Cmd>LazyGit<cr>", opts)
map("n", "<leader>ga", "<Cmd>G add .<cr>", opts)
map("n", "<leader>gc", "<Cmd>G commit<cr>", opts)
map("n", "<leader>gp", "<Cmd>G push<cr>", opts)
map("n", "<leader>gC", "<Cmd>G checkout -b ", opts)
map("n", "<leader>gP", "<Cmd>G pull<cr>", opts)
map("n", "<leader>gj", "<Cmd>diffget //2<cr>", opts)
map("n", "<leader>gk", "<Cmd>diffget //3<cr>", opts)
map("n", "<leader>q", "<Cmd>copen<cr>", opts)
map("n", "<leader>Q", "<Cmd>close<cr>", opts)
-- map("n", "gp", "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
map("x", "<C-/>", ":'<,'>CommentToggle<CR>gv", opts)

map("n", "<leader>F", "<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
-- map("n", "<leader>F", "<Cmd>:NvimTreeFocus<CR>", opts)
-- map("n", "<leader>f", "<Cmd>:NvimTreeFindFileToggle<CR>", opts)
map("n", "<leader>f", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
map("n", "<leader>/", "<Cmd>Telescope current_buffer_fuzzy_find theme=dropdown<CR>", opts)

map("n", "<leader>H", ":lua vim.lsp.inlay_hint(0, nil)<CR>", opts)
map("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
map("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", opts)
map("n", "<A-.>", ":lua require('harpoon.ui').nav_next()<CR>", opts)
map("n", "<A-,>", ":lua require('harpoon.ui').nav_prev()<CR>", opts)
map("n", "<A-1>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
map("n", "<A-2>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
map("n", "<A-3>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
map("n", "<A-4>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>O return err", opts)
