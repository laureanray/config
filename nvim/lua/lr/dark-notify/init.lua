local dn = require('dark_notify')

-- Configure
dn.run({
    schemes = {
      -- you can use a different colorscheme for each
      dark  = "ayu-dark",
      -- even a different `set background=light/dark` setting or lightline theme
      -- if you use lightline, you may want to configure lightline themes,
      -- even if they're the same one, especially if the theme reacts to :set bg
      light = {
        colorscheme = "ayu-light",
      }
    }, 
    onchange = function(mode)
        -- optional, you can configure your own things to react to changes.
        -- this is called at startup and every time dark mode is switched,
        -- either via the OS, or because you manually set/toggled the mode.
        -- mode is either "light" or "dark"
    end,
})
