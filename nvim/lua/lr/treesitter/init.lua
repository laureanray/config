local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')


npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},
    javascript = {'template_string'},
    typescript = {'template_string'},
    java = false,
  }
})

local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
      virtual_text = {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
  }
)

--require('nvim-ts-autotag').setup({
--  filetypes = { "html" , "xml" },
--})

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
  ensure_installed = {"html", "javascript", "java", "typescript", "lua", "go"},
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
    filetypes = { "typescriptreact" }
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = {
    enable = true
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,
      keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
      }
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer'
      },
      goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer'
      },
      goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer'
      },
      goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer'
      }
    }
  }
}
