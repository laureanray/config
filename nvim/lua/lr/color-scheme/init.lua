if vim.fn.has("mac") == 1 then
	-- vim.o.background = "dark"b
	-- vim.g.gruvbox_material_background = "hard"
	-- vim.g.gruvbox_material_foreground = "material"
	-- vim.g.gruvbox_material_better_performance = 1
	-- vim.cmd.colorscheme("kanagawa-dragon")
	-- vim.cmd.colorscheme("moonfly")
	-- vim.cmd.colorscheme("OceanicNext")
  require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'main',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'main',
    bold_vert_split = false, dim_nc_background = false,
    disable_background = true,
    disable_float_background = false,
    disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
      background = 'base',
      background_nc = '_experimental_nc',
      panel = 'surface',
      panel_nc = 'base',
      border = 'highlight_med',
      comment = 'muted',
      link = 'iris',
      punctuation = 'subtle',

      error = 'love',
      hint = 'iris',
      info = 'foam',
      warn = 'gold',

      headings = {
        h1 = 'iris',
        h2 = 'foam',
        h3 = 'rose',
        h4 = 'gold',
        h5 = 'pine',
        h6 = 'foam',
      }
      -- or set all headings at once
      -- headings = 'subtle'
    },

    -- Change specific vim highlight groups
    -- https://github.com/rose-pine/neovim/wiki/Recipes
    highlight_groups = {
      ColorColumn = { bg = 'surface' },

      -- Blend colours against the "base" background
      CursorLine = { bg = 'foam', blend = 10 },
      StatusLine = { fg = 'love', bg = 'love', blend = 10 },
    }
  })
  vim.cmd('colorscheme rose-pine')
elseif vim.fn.has("unix") == 1 then
	vim.cmd([[colorscheme mellifluous]])
else
	print("Unsupported system for sumneko")
end
