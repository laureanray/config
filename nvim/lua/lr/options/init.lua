-- This would by dynamically changed by a script
vim.opt.background = "dark"
vim.cmd("filetype plugin indent on")
-- general
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "200"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.inccommand = "nosplit"
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
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.o.autoread = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.optundofile = false
-- vim.opt.statuscolumn= "%@SignCb@%s%=%@NumCb@%r│%T"
-- d
-- asd
-- vim.opt.statuscolumn= " %=%r│ %T"
-- vim.opt.statuscolumn = "%=%r│ %T"
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.guicursor =
"n-v-c:block-Question,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.g.goyo_height = "95%"
vim.g.goyo_width = 105
--
--
-- vim.api.nvim_set_hl(0, "blue",   { fg = "#3d59a1" }) 
-- vim.api.nvim_set_hl(0, "green",  { fg = "#9ece6a" }) 
-- vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" }) 
-- vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" }) 
--
-- vim.fn.sign_define('DapBreakpoint',          { text='•', texthl='blue',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointCondition', { text='•', texthl='blue',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointRejected',  { text='•', texthl='orange', linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapStopped',             { text='•', texthl='green',  linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapLogPoint',            { text='•', texthl='yellow', linehl='DapBreakpoint', numhl='DapBreakpoint' })
--
--
-- Completion


vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- Define LSP signs
vim.fn.sign_define("LspDiagnosticsSignError", { text = "", texthl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "", texthl = "LspDiagnosticsSignInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "", texthl = "LspDiagnosticsSignHint" })


-- Define LSP signs
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
