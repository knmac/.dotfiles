-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- ----------------------------------------------------------------------------
-- This is where you actually apply your config choices
-- ----------------------------------------------------------------------------
-- Font
config.font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'JetBrains Mono',
}
config.font_size = 19.0

-- Color
config.color_scheme = 'Catppuccin Macchiato'

-- Window
config.window_background_opacity = 0.9
config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '0.5cell',
    bottom = '0cell',
}
config.window_decorations = 'RESIZE'
config.macos_window_background_blur = 20

-- Tabs
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Bell
config.audible_bell = 'Disabled'
config.visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 150,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 150,
}

-- IME
config.use_ime = false

-- Kitty image protocol
config.enable_kitty_graphics = true

-- ----------------------------------------------------------------------------
-- and finally, return the configuration to wezterm
return config
