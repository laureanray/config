if vim.fn.has("unix") == 1 then
  require("transparent").setup({
    groups = { -- table: default groups
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    extra_groups = { -- table/string: additional groups that should be cleared
      -- In particular, when you set it to 'all', that means all available groups

      -- example of akinsho/nvim-bufferline.lua
      "BufferLineTabClose",
      "BufferlineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",
      "NormalFloat",
      "TelescopeNormal", "TelescopeBorder",
      "TelescopePreviewTitle",
      "TelescopePreviewLine",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",
      "TelescopePromptPrefix",
      "TelescopeResultsTitle",
      "TelescopePromptNormal",
      "TelescopePromptBorder",
      "TelescopeResultsBorder",
      "TelescopeSelectionCaret",
      "BarbarCurrentTab",
      "ColorColumn",
      "CursorColumn",
      "FoldColumn",
      "GitSignsAdd",
      "GitSignsChangeNr",
      "GitSignsDeleteNr",
      "GitSignsUntrackedLn",
      "WinBar",
      "BufferTabpageFill",
      "BufferTabpages",
      "BufferTabpagesSep",
      "BufferTabpageSelected",
      "DiagnosticSignError",
      "DiagnosticSignWarn",
      "DiagnosticSignInfo",
      "DiagnosticSignHint",
      "DiagnosticSignOk",
    }
  })
end
