local wezterm = require("wezterm")

local bg = require("theme.background")
local cs = require("theme.color_scheme")
local leader = require("keybinds.leader")
local keybinds = require("keybinds.set")

local config = wezterm.config_builder()

config = cs
config.enable_tab_bar = false
config.background = bg
config.leader = leader
config.keys = keybinds

return config
