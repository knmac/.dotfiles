-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Add the right status
require('right_status')

-- ----------------------------------------------------------------------------
-- This is where you actually apply your config choices
-- ----------------------------------------------------------------------------
local font_size = 11.0

-- Font
config.font = wezterm.font_with_fallback {
    'JetBrains Mono',
    -- 'JetBrainsMono Nerd Font',
    'feather',
}
config.font_size = font_size
config.command_palette_font_size = font_size
config.char_select_font_size = font_size
-- config.warn_about_missing_glyphs = false

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
config.window_frame = {
    font_size = font_size - 3.0,
}
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

-- Kitty image protocol
config.enable_kitty_graphics = true

-- IME
config.use_ime = false

-- Key-bindings
config.disable_default_key_bindings = true -- Deactivate default key bindings
-- local keybindings = require('keybindings_macos')
local keybindings = require('keybindings_linux')
config.keys = keybindings.keys
config.key_tables = keybindings.key_tables

-- ----------------------------------------------------------------------------
-- For nvim-zenmode
-- ----------------------------------------------------------------------------
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

-- ----------------------------------------------------------------------------
-- and finally, return the configuration to wezterm
return config
