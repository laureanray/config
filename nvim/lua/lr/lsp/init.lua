local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', '[C]ode [A]ction')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('K', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.offsetEncoding = { 'utf-8' }

local mason_lspconfig = require 'mason-lspconfig'

-- Language Servers Setup
require('mason').setup()
local servers = {
    rust_analyzer = {
        capabilities = capabilities,
        settings = {

        },
        on_attach = on_attach,
    },
    tailwindcss = {
        capabilities = capabilities,
        settings = {

        },
        on_attach = on_attach,
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
                -- includeInlayParameterNameHints = "all",
                -- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                -- includeInlayFunctionParameterTypeHints = true,
                -- includeInlayVariableTypeHints = true,
                -- includeInlayPropertyDeclarationTypeHints = true,
                -- includeInlayFunctionLikeReturnTypeHints = true,
                -- includeInlayEnumMemberValueHints = true,
                -- importModuleSpecifierPreference = 'non-relative',
                -- includeCompletionsForImportStatements = true,
                -- includeCompletionsForModuleExports = true,
                -- includeCompletionsWithClassMemberSnippets = true,
                -- includeCompletionsWithObjectLiteralMethodSnippets = true,
                -- includeCompletionsWithInsertText = true,
                -- includeCompletionsWithSnippetText = true,
                -- allowIncompleteCompletions = true,
            },
        },
        on_attach = on_attach
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
        },
        on_attach = on_attach
    },
    grammarly = {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {},
    },
    emmet_language_server = {
        capabilities = capabilities,
        settings = {},
        on_attach = on_attach
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
        },
        on_attach = on_attach
    },
    astro = {
        capabilities = capabilities,
        settings = {},
        on_attach = on_attach
    },
    clangd = {
        capabilities = capabilities,
        settings = {},
        on_attach = on_attach
    },
    volar = {
        capabilities = capabilities,
        settings = {},
        on_attach = on_attach
    },
    html = {
        capabilities = capabilities,
        settings = {
            html = {
                format = {
                    templating = true,
                    wrapLineLength = 120,
                    wrapAttributes = 'auto',
                },
            }
        },
        on_attach = on_attach
    }
}

mason_lspconfig.setup {
    -- handlers = {
    --     lsp_zero.default_setup,
    -- },

    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        -- require('lspconfig')[server_name].setup(servers[server_name])
        if server_name == 'grammarly' then
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name].settings,
                cmd = {
                    "/home/lr/.nvm/versions/node/v20.9.0/bin/node",
                    "/home/lr/.local/share/nvim/mason/bin/grammarly-languageserver",
                    "--stdio" },
            }
        elseif server_name == "volar" then
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name].settings,
                cmd = {
                    "/home/lr/.nvm/versions/node/v21.6.0/bin/node",
                    "/home/lr/.local/share/nvim/mason/bin/vue-language-server",
                    "--stdio" },
            }
        else
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name].settings,
            }
        end
    end,
}

require("todo-comments").setup()
require('trouble').setup()
require('lspsaga').setup({})
