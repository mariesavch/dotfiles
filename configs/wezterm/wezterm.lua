local theme = require("theme")
local keys = require("keys")
local tab = require("tab")
local fonts = require("fonts")

local config = {
	term = "wezterm",
	set_environment_variables = {
		TERMINFO_DIRS = "/etc/profiles/per-user/marie/share/terminfo",
	},
	window_padding = {
		left = 30,
		right = 30,
		top = 30,
		bottom = 30,
	},
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 1.0,
	},
	initial_rows = 30,
	initial_cols = 170,
	warn_about_missing_glyphs = false,
	check_for_updates = false,
	window_decorations = "NONE",
	window_close_confirmation = "NeverPrompt",
	hide_mouse_cursor_when_typing = false,
	audible_bell = "Disabled",
	enable_scroll_bar = false,
	front_end = "OpenGL",
	mouse_wheel_scrolls_tabs = false,
}

tab.setup(config)
keys.setup(config)
fonts.setup(config)
theme.setup(config)

return config
