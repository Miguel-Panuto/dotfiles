local wezterm = require("wezterm")
local act = wezterm.action

local adjustment_size = 10

return {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", adjustment_size }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", adjustment_size }),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Up", adjustment_size }),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", adjustment_size }),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
}
