-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
  config.font = wezterm.font_with_fallback {
    'BerkeleyMono Nerd Font Mono',
    'JetBrainsMono Nerd Font',
  }
  config.font_size = 20
  -- config.window_decorations = "RESIZE"
  config.enable_tab_bar = false
  config.cursor_blink_rate = 0
end

-- wezterm.on("gui-startup", function()
--   local tab, pane, window = mux.spawn_window {}
--   window:gui_window():maximize()
-- end)

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Adventure'

-- and finally, return the configuration to wezterm
return config
