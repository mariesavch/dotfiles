local theme = {}

local themes = {
	dark = {
		rosewater = "#ff8389",
		flamingo = "#ff8389",
		red = "#ff8389",
		maroon = "#ff8389",
		pink = "#ff7eb6",
		mauve = "#be95ff",
		peach = "#d44a1c",
		yellow = "#ab8600",
		green = "#08bdba",
		teal = "#33b1ff",
		sky = "#33b1ff",
		sapphire = "#33b1ff",
		blue = "#78a9ff",
		lavender = "#78a9ff",
		text = "#ffffff",
		subtext1 = "#f4f4f4",
		subtext0 = "#e0e0e0",
		overlay2 = "#adadad",
		overlay1 = "#949494",
		overlay0 = "#7a7a7a",
		surface2 = "#4f4f4f",
		surface1 = "#383838",
		surface0 = "#2e2e2e",
		base = "#161616",
		mantle = "#0d0d0d",
		crust = "#000000",
	},
	light = {
		rosewater = "#c14a4a",
		flamingo = "#c14a4a",
		pink = "#945e80",
		mauve = "#945e80",
		red = "#c14a4a",
		maroon = "#c14a4a",
		peach = "#c35e0a",
		yellow = "#a96b2c",
		green = "#6c782e",
		teal = "#4c7a5d",
		sky = "#4c7a5d",
		sapphire = "#4c7a5d",
		blue = "#45707a",
		lavender = "#45707a",
		text = "#654735",
		subtext1 = "#7b5d44",
		subtext0 = "#8f6f56",
		overlay2 = "#a28368",
		overlay1 = "#b6977a",
		overlay0 = "#c9aa8c",
		surface2 = "#A79C86",
		surface1 = "#C9C19F",
		surface0 = "#DFD6B1",
		base = "#fbf1c7",
		mantle = "#F3EAC1",
		crust = "#E7DEB7",
	},
}

theme.colors = themes.light

function theme.setup(config)
	local colors = theme.colors

	config.colors = {
		split = colors.base,
		foreground = colors.text,
		background = colors.base,
		cursor_bg = colors.overlay0,
		cursor_border = colors.overlay0,
		cursor_fg = colors.base,
		selection_bg = colors.surface2,
		selection_fg = colors.text,
		visual_bell = colors.surface0,
		indexed = {
			[16] = colors.peach,
			[17] = colors.rosewater,
		},
		scrollbar_thumb = colors.surface2,
		compose_cursor = colors.flamingo,
		ansi = {
			colors.surface0,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.text,
		},
		brights = {
			colors.surface2,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.surface2,
		},
		tab_bar = {
			background = colors.mantle,
			active_tab = {
				bg_color = "none",
				fg_color = colors.subtext1,
				intensity = "Bold",
				italic = true,
			},
			inactive_tab = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
			inactive_tab_hover = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
			new_tab = {
				bg_color = colors.mantle,
				fg_color = colors.subtext0,
			},
			new_tab_hover = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
		},
	}
end

return theme
