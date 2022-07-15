

vim.g.mapleader = ' '

-- Window nav
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Move to previous/next
map('n', '<t-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<t-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<D-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<D->>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<D-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<D-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<D-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<D-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<D-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<D-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<D-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<D-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<D-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<D-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)


