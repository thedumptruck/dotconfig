local wezterm = require("wezterm")
local mux = wezterm.mux
local action = wezterm.action
local tmuxKey = function(key)
	return action.Multiple({
		action.SendKey({ key = "Space", mods = "CTRL" }),
		action.SendKey({ key = key }),
	})
end

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local M = wezterm.config_builder()

M.color_scheme = "catppuccin-mocha"
M.harfbuzz_features = { "calt", "liga", "dlig" }
M.font = wezterm.font("MonaspiceNe Nerd Font Propo")
M.window_decorations = "RESIZE"
M.hide_tab_bar_if_only_one_tab = true
M.default_prog = {
	"/opt/homebrew/bin/tmux",
	"new-session",
	"-A",
	"-D",
	"-s",
	"main",
}

M.keys = {
	{
		key = "t",
		mods = "CMD",
		action = tmuxKey("c"),
	},
	{
		key = "[",
		mods = "CMD",
		action = tmuxKey("p"),
	},
	{
		key = "]",
		mods = "CMD",
		action = tmuxKey("n"),
	},
	{
		key = "w",
		mods = "CMD",
		action = tmuxKey("x"),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = action.SendKey({
			key = "h",
			mods = "CTRL",
		}),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = action.SendKey({
			key = "l",
			mods = "CTRL",
		}),
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = action.SendKey({
			key = "j",
			mods = "CTRL",
		}),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = action.SendKey({
			key = "k",
			mods = "CTRL",
		}),
	},
}

for i = 1, 9, 1 do
	local key = tostring(i)
	table.insert(M.keys, {
		key = key,
		mods = "CMD",
		action = tmuxKey(key),
	})
end

return M
