local lsp_zero = require('lsp-zero')
require('mason').setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.offsetEncoding = { 'utf-8' }
local mason_lspconfig = require 'mason-lspconfig'
lsp_zero.on_attach(function(client, bufnr)
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
            completions = {
                completeFunctionCalls = true
            },
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
                usePlaceholders = true,
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
