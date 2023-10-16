-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
    config.font_size = 10
    config.enable_tab_bar = false
    config.cursor_blink_rate = 0
    config.color_scheme = "Github Dark"
    config.dpi = 144
    config.freetype_load_target = "Light"
config.freetype_render_target = "Normal"
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Batman'

-- Set background to same color as neovim
-- config.colors = {}
-- config.colors.background = '#fafafa'

config.font = wezterm.font_with_fallback {
    'BerkeleyMono Nerd Font Mono',
    "Symbols Nerd Font",
    'nonicons',
}

-- config.font = wezterm.font('JetBrainsMono Nerd Font')

-- default is true, has more "native" look
config.use_fancy_tab_bar = false

-- I don't like putting anything at the ege if I can help it.
config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.tab_bar_at_bottom = false
-- config.freetype_load_flags = 'FORCE_AUTOHINT|MONOCHROME'
-- config.freetype_load_target = "HorizontalLcd"
config.hide_tab_bar_if_only_one_tab = false

-- and finally, return the configuration to wezterm
return config
