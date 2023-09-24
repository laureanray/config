local lsp_zero = require('lsp-zero')
require('mason').setup()
-- local on_attach = function(_, buffer)
--     local nmap = function(keys, func, desc)
--         if desc then
--             desc = 'LSP: ' .. desc
--         end
--
--         vim.keymap.set('n', keys, func, { buffer = buffer, desc = desc })
--     end
--     nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--     -- nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
--     nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--     nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--     nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--     nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--     nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--     nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--     nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--     nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--     nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--     nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--     nmap('<leader>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, '[W]orkspace [L]ist Folders')
-- end
--
-- require('neodev').setup({
--     library = { plugins = { "nvim-dap-ui" }, types = true },
-- })

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- Set encoding?
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.offsetEncoding = { 'utf-8' }
-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local servers = {
    rust_analyzer = {
        capabilities = capabilities,
        settings = {

        },
    },
    tailwindcss = {
        capabilities = capabilities,
        settings = {

        },
    },
    tsserver = {
        inlay_hints = {
            show_parameter_hints = true,
        },
        capabilities = capabilities,
        settings = {
            configuration = {
                suggest = {
                    completeFunctionCalls = true
                },
            },
            javascript = {
                suggest = {
                    completeFunctionCalls = true
                }
            }
        },
        init_options = {
            preferences = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
                importModuleSpecifierPreference = 'non-relative',
                includeCompletionsForImportStatements = true,
                includeCompletionsForModuleExports = true,
                includeCompletionsWithClassMemberSnippets = true,
                includeCompletionsWithObjectLiteralMethodSnippets = true,
                includeCompletionsWithInsertText = true,
                includeCompletionsWithSnippetText = true,
                allowIncompleteCompletions = true,
            },
        },
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
        end,
    },
    lua_ls = {
        capabilities = capabilities,
        settings = {
            Lua = {
                hint = {
                    enable = true,
                },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        }
    },
    grammarly = {
        capabilities = capabilities,
        settings = {},
    },
    emmet_language_server = {
        capabilities = capabilities,
        settings = {},
    },
    gopls = {
        inlay_hints = {
            show_parameter_hints = true,
        },
        capabilities = capabilities,
        settings = {
            gopls = {
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            }
        }
    },
    astro = {
        capabilities = capabilities,
        settings = {},
    },
    csharp_ls = {
        capabilities = capabilities,
        settings = {},
    }
}

mason_lspconfig.setup {
    handlers = {
        lsp_zero.default_setup,
    },
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup(servers[server_name])
    end,
}


require("todo-comments").setup();
