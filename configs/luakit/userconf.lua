local select = require("select")
local follow = require("follow")
local settings = require("settings")
local modes = require("modes")
local window = require("window")
require("lousy.widget.tablist")

select.label_maker = function(s)
	return s.sort(s.reverse(s.charset("etovxqpdygfblzhckisuran")))
end
follow.pattern_maker = follow.pattern_styles.match_label

settings.window.search_engines = {
	ddg = "https://duckduckgo.com/?q=%s",
	gh = "https://github.com/search?q=%s",
	wiki = "https://en.wikipedia.org/wiki/Special:Search?search=%s",
	inv = "https://invidious.snopyta.org/search?q=%s",
	reddit = "https://reddi.tk/search?q=%s",
	nix = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s",
	osm = "https://www.openstreetmap.org/search?query=%s",
}

settings.window.default_search_engine = "ddg"
settings.webview.enable_webaudio = true
settings.window.home_page = "luakit://newtab/"
settings.webview.monospace_font_family = "CartographCF Nerd Font"
settings.webview.pictograph_font_family = "CartographCF Nerd Font"
settings.webview.serif_font_family = "CartographCF Nerd Font"
settings.webview.sans_serif_font_family = "CartographCF Nerd Font"
settings.webview.cursive_font_family = "CartographCF Nerd Font"
settings.webview.default_font_family = "CartographCF Nerd Font"
settings.webview.enable_offline_web_application_cache = false
settings.tablist.visibility = "never"
settings.application.prefer_dark_mode = false
settings.window.new_window_size = "1800x1400"

modes.remap_binds("normal", {
	{ "y", "Y", true },
})

modes.add_binds("normal", {
	{
		"<Control-c>",
		"Copy selected text.",
		function()
			luakit.selection.clipboard = luakit.selection.primary
		end,
	},
})

window.add_signal("build", function(w)
	w.sbar.layout.margin_top = 8
	w.sbar.layout.margin_bottom = 7
end)
