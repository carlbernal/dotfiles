local wezterm = require "wezterm"
local config = wezterm.config_builder()

-- colors
config.color_scheme = 'Monokai Remastered'

-- window
config.window_background_opacity = 0.97
config.window_padding = {
    left = "0",
    right = "0",
    top = "0",
    bottom = "0",
}
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"

-- font
config.font = wezterm.font("JetBrains Mono", {weight = "Medium"})
config.font_size = 14
config.line_height = 1.2

return config
