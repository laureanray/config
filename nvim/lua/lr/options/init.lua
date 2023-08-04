vim.cmd("filetype plugin indent on")
-- general
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "200"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.inccommand = "nosplit"
vim.g.gruvbox_constrast_dark = "soft"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_background = "original"
vim.o.timeout = false
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.hidden = true
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.pumheight = 10
vim.o.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 0
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.clipboard = "unnamedplus"
vim.o.sidescrolloff = 5
vim.o.mouse = "a"
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
vim.opt["guicursor"] = ""
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
vim.wo.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.optundofile = false
--vim.opt.statuscolumn= "%@SignCb@%s%=%@NumCb@%r│%T"
-- d
-- asd
-- vim.opt.statuscolumn= " %=%r│ %T"
vim.opt.statuscolumn= "%=%r│ %T"
local opt = vim.opt
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = -1
opt.foldenable = true

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.g.goyo_height = "95%"
vim.g.goyo_width = 105
