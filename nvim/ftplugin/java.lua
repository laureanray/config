local path
if vim.fn.has("mac") == 1 then
    path = '/Users/laureanray.bahala'
elseif vim.fn.has("unix") == 1 then
    path = '/home/lr'
else
    print("Unsupported system for sumneko")
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


-- " If using nvim-dap
-- " This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
-- nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
-- nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>
--
function M.open_jdt_link(uri)
    local client
    for _, c in ipairs(vim.lsp.get_active_clients()) do
        if c.config.init_options
            and c.config.init_options.extendedClientCapabilities
            and c.config.init_options.extendedClientCapabilities.classFileContentsSupport then
            client = c
            break
        end
    end
    assert(client, 'Must have a buffer open with a language client connected to eclipse.jdt.ls to load JDT URI')
    local buf = api.nvim_get_current_buf()
    local params = {
        uri = uri
    }
    local response = nil
    local cb = function(err, result)
        response = { err, result }
    end
    local ok, request_id = client.request('java/classFileContents', params, cb, buf)
    assert(ok, 'Request to `java/classFileContents` must succeed to open JDT URI. Client shutdown?')
    local timeout_ms = M.settings.jdt_uri_timeout_ms
    local wait_ok, reason = vim.wait(timeout_ms, function() return response end)
    local log_path = require('jdtls.path').join(vim.fn.stdpath('cache'), 'lsp.log')
    local buf_content
    if wait_ok and #response == 2 and response[2] then
        local content = response[2]
        if content == "" then
            buf_content = {
                'Received response from server, but it was empty. Check the log file for errors', log_path }
        else
            buf_content = vim.split(response[2], '\n', { plain = true })
        end
    else
        local error_msg
        if not wait_ok then
            client.cancel_request(request_id)
            local wait_failure = {
                [-1] = 'timeout',
                [-2] = 'interrupted',
                [-3] = 'error'
            }
            error_msg = wait_failure[reason]
        else
            error_msg = response[1]
        end
        buf_content = {
            'Failed to load content for uri',
            uri,
            '',
            'Error was: ',
        }
        vim.list_extend(buf_content, vim.split(vim.inspect(error_msg), '\n'))
        vim.list_extend(buf_content, { '', 'Check the log file for errors', log_path })
    end
    vim.bo[buf].modifiable = true
    vim.bo[buf].swapfile = false
    vim.bo[buf].buftype = 'nofile'
    api.nvim_buf_set_lines(buf, 0, -1, false, buf_content)
    vim.bo[buf].filetype = 'java'
    vim.bo[buf].modifiable = false
end
