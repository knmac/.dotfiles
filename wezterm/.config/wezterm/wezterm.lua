local wezterm = require('wezterm')

local config = {
    -- Font
    font = wezterm.font_with_fallback {
        'JetBrainsMono Nerd Font',
        'JetBrains Mono',
    },
    font_size = 11.0,
    -- Color
    color_scheme = 'Catppuccin Macchiato',
    -- Window
    window_background_opacity = 0.9,
    window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0cell',
    },
    -- Tabs
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    -- Bell
    audible_bell = 'Disabled',
    visual_bell = {
        fade_in_function = 'EaseIn',
        fade_in_duration_ms = 150,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 150,
    },
    -- Kitty image protocol
    enable_kitty_graphics = true,
}

return config
