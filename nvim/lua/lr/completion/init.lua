-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local types = require("cmp.types")

local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return false
	end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
		return true
	end
end

vim.g.completeopt = "menu,menuone,noselect,noinsert"

require("lspkind").init({
	-- enables text annotations
	--
	-- default: true
	-- mode = "symbol_text",

	-- default symbol map
	-- can be either 'default' or
	-- 'codicons' for codicon preset (requires vscode-codicons font installed)
	--
	-- default: 'default'
	preset = "codicons",

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "  ",
		Function = "",
		Constructor = "",
		Variable = "",
		Class = "",
		Interface = "ﰮ",
		Module = "",
		Property = "",
		Unit = "",
		Value = "",
		Enum = "了",
		Keyword = "",
		Snippet = "﬌",
		Color = "",
		File = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Field = "  ",
	},
})

cmp.setup({
	sorting = {
		priority_weight = 2,
		comparators = {
			deprioritize_snippet,
			-- the rest of the comparators are pretty much the defaults
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.scopes,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
		end,
	},
	formatting = {
		format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig").html.setup({
	capabilities = capabilities,
})
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end
	end,
})
