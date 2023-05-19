local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	-- "jdtls",
	-- "cssls",
	--"cssmodules_ls",
--	"emmet_ls",
--	"html",
--	"tailwindcss",
--	"jsonls",
"lua_ls",
--	"tflint",
--	"tsserver",
--	"yamlls",
--	"bashls",
--	"clangd",
--	"rust_analyzer",
--	"gopls",
--	"eslint",
--	"groovyls"
}

-- local settings = {
-- 	ensure_installed = servers,
-- 	ui = {
-- 		icons = {},
-- 		keymaps = {
-- 			toggle_server_expand = "<CR>",
-- 			install_server = "i",
-- 			update_server = "u",
-- 			check_server_version = "c",
-- 			update_all_servers = "U",
-- 			check_outdated_servers = "C",
-- 			uninstall_server = "X",
-- 		},
-- 	},
-- 
-- 	log_level = vim.log.levels.INFO,
-- }

local default_on_attach = function(client, bufnr)
	-- use lsp omnicompletion if it's available
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- use lsp powered indentation for gqq and = formatting when available
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	end
end

--lsp_installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lr.lsp.handlers").on_attach,
		capabilities = require("lr.lsp.handlers").capabilities,
	}

	if server == "lua_ls" then
		local sumneko_opts = require("lr.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "emmet_ls" then
		local emmet_ls_opts = require("lr.lsp.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
	end

	if server == "yamlls" then
		opts = {
			on_attach = function(client, bufnr)
				default_on_attach(client, bufnr)
				vim.diagnostic.disable()
				if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
					vim.diagnostic.disable()
				end
			end,
		}
	end

	lspconfig[server].setup(opts)
end
