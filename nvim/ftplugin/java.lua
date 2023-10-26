local path
if vim.fn.has("mac") == 1 then
    path = '/Users/laureanray.bahala'
elseif vim.fn.has("unix") == 1 then
    path = '/home/lr'
else
    print("Unsupported system for sumneko")
end

local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- Use LSP SAGA
    nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
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

local config = {
    cmd = { path .. '/.local/lib/jdtls/bin/jdtls'
    },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
        }
    },
    init_options = {
        bundles = {}
    },
    on_attach = on_attach
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

vim.cmd([[
nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
" If using nvim-dap
" This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>
]])

-- function M.open_jdt_link(uri)
--     local client
--     for _, c in ipairs(vim.lsp.get_active_clients()) do
--         if c.config.init_options
--             and c.config.init_options.extendedClientCapabilities
--             and c.config.init_options.extendedClientCapabilities.classFileContentsSupport then
--             client = c
--             break
--         end
--     end
--     assert(client, 'Must have a buffer open with a language client connected to eclipse.jdt.ls to load JDT URI')
--     local buf = api.nvim_get_current_buf()
--     local params = {
--         uri = uri
--     }
--     local response = nil
--     local cb = function(err, result)
--         response = { err, result }
--     end
--     local ok, request_id = client.request('java/classFileContents', params, cb, buf)
--     assert(ok, 'Request to `java/classFileContents` must succeed to open JDT URI. Client shutdown?')
--     local timeout_ms = M.settings.jdt_uri_timeout_ms
--     local wait_ok, reason = vim.wait(timeout_ms, function() return response end)
--     local log_path = require('jdtls.path').join(vim.fn.stdpath('cache'), 'lsp.log')
--     local buf_content
--     if wait_ok and #response == 2 and response[2] then
--         local content = response[2]
--         if content == "" then
--             buf_content = {
--                 'Received response from server, but it was empty. Check the log file for errors', log_path }
--         else
--             buf_content = vim.split(response[2], '\n', { plain = true })
--         end
--     else
--         local error_msg
--         if not wait_ok then
--             client.cancel_request(request_id)
--             local wait_failure = {
--                 [-1] = 'timeout',
--                 [-2] = 'interrupted',
--                 [-3] = 'error'
--             }
--             error_msg = wait_failure[reason]
--         else
--             error_msg = response[1]
--         end
--         buf_content = {
--             'Failed to load content for uri',
--             uri,
--             '',
--             'Error was: ',
--         }
--         vim.list_extend(buf_content, vim.split(vim.inspect(error_msg), '\n'))
--         vim.list_extend(buf_content, { '', 'Check the log file for errors', log_path })
--     end
--     vim.bo[buf].modifiable = true
--     vim.bo[buf].swapfile = false
--     vim.bo[buf].buftype = 'nofile'
--     api.nvim_buf_set_lines(buf, 0, -1, false, buf_content)
--     vim.bo[buf].filetype = 'java'
--     vim.bo[buf].modifiable = false
-- end
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
