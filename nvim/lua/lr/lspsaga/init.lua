local saga = require 'lspsaga'
saga.init_lsp_saga()
local action = require("lspsaga.codeaction")
-- code action
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true,noremap = true })
vim.keymap.set("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, { silent = true,noremap =true })
-- or use command
vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { silent = true,noremap = true })
