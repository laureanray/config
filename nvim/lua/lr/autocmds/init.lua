local api = vim.api
local wrap = api.nvim_create_augroup("wrap", { clear = true })

-- Softwrap Markdown files
-- api.nvim_create_autocmd("FileType", {
-- 	pattern = "md",
-- 	command = "setlocal wrap",
-- 	group = wrap,
-- })
--

-- Set 4 Spaces indent for Shell Scripts
api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end
})

-- vim.g.diagnostics_active = true
-- function _G.toggle_diagnostics()
--   if vim.g.diagnostics_active then
--     vim.g.diagnostics_active = false
--     vim.lsp.diagnostic.clear(0)
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
--   else
--     vim.g.diagnostics_active = true
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--       vim.lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = true,
--         signs = true,
--         underline = true,
--         update_in_insert = false,
--       }
--     )
--   end
-- end

-- Floating Diagnostics
api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "yaml" then
			return
		end
      vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
      -- Hide inline diagnostics
      -- vim.diagnostic.hide()
  end,
})

-- Detect groovy files and jenkinsfile -> Groovy
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "Jenkinsfile,*.groovy",
	command = "set filetype=groovy",
})

-- Autoload files
api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

api.nvim_create_autocmd('User', {
  pattern = "GoyoEnter",
  callback = function()
    vim.fn.system("tmux set status off")

    require('lualine').hide({
      place = {'statusline', 'tabline', 'winbar'},
      unhide = false,
    })
    vim.cmd([[ 
    set noshowmode
    set noshowcmd
    set scrolloff=999]])
  end
})


api.nvim_create_autocmd('User', {
  pattern = "GoyoLeave",
  callback = function()
    vim.fn.system("tmux set status on")
  end
})

--#region
--autocmd bufwritepost ~/.config/kitty/kitty.conf :silent !kill -SIGUSR1 $(pgrep kitty)
api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "kitty.conf",
  command = "silent !kill -SIGUSR1 $(pgrep kitty)",
})


-- TODO: We must find npx dynamically
-- FIX: If unable to format should probably call `vim.notify`
-- Little hacky for now but it works
-- api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = "*.prisma",
--   -- Execute `npx prisma format` before writing the buffer
--   callback = function(data)
--     vim.cmd([[ silent !/home/lr/.nvm/versions/node/v16.20.0/bin/npx prisma format ]])
--     -- vim.system({  '!/home/lr/.nvm/versions/node/v16.20.0/bin/npx', 'prisma', 'format'})
--     vim.cmd("silent e " .. data["file"])
--     -- Reload file
--   end,
-- })
