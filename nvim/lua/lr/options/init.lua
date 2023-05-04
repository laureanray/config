vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
--vim.o.splitbelow = true
-- vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamedplus"
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
-- vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.o.autoread = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
-- vim.o.spelllang = en, cjk
vim.o.spellsuggest = best, 9
vim.wo.signcolumn = "yes"

-- undo tree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = false

vim.cmd([[
set inccommand=nosplit
set mmp=5000
]])
-- Auto format
vim.g.neoformat_enabled_typescript = { "eslint_d" }
vim.g.neoformat_enabled_typescriptreact = { "eslint_d" }
vim.g.neoformat_enabled_go = { "gofmt" }
--vim.g.neoformat_enabled_prisma = {"prisma format"}
-- vim.cmd([[
--         imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
--         let g:copilot_no_tab_map = v:true
-- ]])

local opt = vim.opt

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = -1
opt.foldenable = true

-- general
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.inccommand = "nosplit"

vim.g.gruvbox_constrast_dark = "hard"
