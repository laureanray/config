require('mason').setup()
local on_attach = function(client, buffer)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = buffer, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wh', vim.lsp.inlay_hint(0, nil), '[I]nlay [H]int')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(buffer, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  if client.server_capabilities.inlayHintProvider then
    vim.print("Setting up inlay hints for", client.name)
    vim.lsp.buf.inlay_hint(buffer, true)
  end
end

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Set encoding?
capabilities.offsetEncoding = { 'utf-8' }
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

local servers = {
  -- rust_analyzer = {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {},
  -- },
  tsserver = {
    inlay_hints = {
      show_parameter_hints = true,
    },
    capabilities = capabilities,
    settings = {},
    init_options = {
      preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
        importModuleSpecifierPreference = 'non-relative'
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      on_attach(client, bufnr)
    end,
    -- includeInlayParameterNameHints = "all",
    -- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    -- includeInlayFunctionParameterTypeHints = true,
    -- includeInlayVariableTypeHints = true,
    -- includeInlayPropertyDeclarationTypeHints = true,
    -- includeInlayFunctionLikeReturnTypeHints = true,
    -- includeInlayEnumMemberValueHints = true,
    -- importModuleSpecifierPreference = 'non-relative'
  },
  -- lua_ls = {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   settings = {
  --     Lua = {
  --       hint = {
  --         enable = true,
  --       },
  --       workspace = { checkThirdParty = false },
  --       telemetry = { enable = false },
  --     },
  --   }
  -- },
  -- grammarly = {
  -- },
  -- emmet_ls = {
  --   init_options = {
  --     jsx = {
  --       options = {
  --         ["markup.attributes"] = { className = "class" },
  --       },
  --     },
  --   },
  -- },
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
  -- astro = {},
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup(servers[server_name])
  end,
}
