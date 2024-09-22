local wallpaper_path = os.getenv("HOME") .. "/Images/panes.jpg"
local gradient_path = os.getenv("HOME") .. "/Images/catppuccin-wallpapers/gradients/magenta_blue.png"

return {
	{
		source = { File = { path = wallpaper_path } },
		height = "Cover",
		width = "Cover",
		horizontal_align = "Center",
		repeat_x = "Repeat",
		repeat_y = "Repeat",
		opacity = 1,
	},
	{
		source = {
			File = {
				path = gradient_path,
			},
		},
		opacity = 0.8,
		width = "100%",
		height = "100%",
	},
	{
		source = {
			Gradient = {
				colors = { "#11111b" },
			},
		},
		width = "100%",
		height = "100%",
		opacity = 0.8,
	},
}
