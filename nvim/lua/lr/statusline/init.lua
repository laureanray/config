require('lualine').setup {
    options = {
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = ' ', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
            'packer',
            'NvimTree',
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
        theme = 'nightfly',
        -- theme = require('lr.statusline.theme').theme(),
        -- theme = 'github_light_tritanopia',
        path = 1,
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1, 4) end },
            {
                'diagnostics',
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { 'nvim_diagnostic', 'coc' },

                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },

                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                colored = true,          -- Displays diagnostics status in color if set to true.
                update_in_insert = true, -- Update diagnostics in insert mode.
                always_visible = false,  -- Show diagnostics even if there are none.
            }
        },
        lualine_b = { 'searchcount', { 'filetype', icon_only = true }, 'filename', 'branch', },
        lualine_c = {},
        lualine_x = { '%=', 'selectioncount', },
        --             TODO: FIX THIS!
        --        lualine_x = { {
        --             [[
        -- require("lsp-progress").progress({
        --     format = function(messages)
        --         local active_clients = vim.lsp.get_active_clients({buffer=0})
        --         local client_count = #active_clients
        --         if #messages > 0 then
        --             return " LSP:"
        --                 .. client_count
        --                 .. " "
        --                 .. table.concat(messages, " ")
        --         end
        --         if #active_clients <= 0 then
        --             return " LSP:" .. client_count
        --         else
        --             local client_names = {}
        --             for i, client in ipairs(active_clients) do
        --                 if client and client.name ~= "" then
        --                     table.insert(client_names, "[" .. client.name .. "]")
        --                 end
        --             end
        --             return " LSP:"
        --                 .. client_count
        --                 .. " "
        --                 .. table.concat(client_names, " ")
        --         end
        --     end,
        -- })
        --
        --         ]],
        --             colored = true,
        --             color = { fg = '#cf87e8',},
        --         }},
        lualine_y = { 'diff', 'encoding', 'progress' },
        lualine_z = { 'location' }
        -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
