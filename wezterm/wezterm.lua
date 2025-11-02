-- spruce's wezterm configuration

-- created on 2025-10-22 | 2:40

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- fonts
config.font_size = 15

-- opacity and blur (blur only for macos,so I didn't set it)

config.window_background_opacity = 0.6

-- lanuching program

config.default_prog = {'/usr/sbin/nu', '-l'}


-- window_background_image

-- config.window_background_image = '/home/spruce/.config/wezterm/images/name1.jpg'
config.window_background_image_hsb ={
    brightness = 0.3,
    hue = 1.0,
    saturation = 1.0,
}

-- window_size when you open the terminal

config.initial_cols = 120
config.initial_rows = 30

-- tab bar config

config.hide_tab_bar_if_only_one_tab = true




return config
