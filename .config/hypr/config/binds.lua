local exec = hl.dsp.exec_cmd
local focus = hl.dsp.focus
local window = hl.dsp.window

return function(mainMod, programs)
	local function bind(keys, dispatcher, opts)
		if type(keys) == "string" or type(keys) == "number" then
			hl.bind(string.format("%s + %s", mainMod, tostring(keys)), dispatcher, opts)
		elseif type(keys) == "table" then
			hl.bind(table.concat(keys, " + "), dispatcher, opts)
		end
	end

	bind({ mainMod, "SHIFT", "Q" }, window.close())

	bind("Return", exec(programs.terminal))

	bind({ mainMod, "SHIFT", "Q" }, window.close())

	bind("M", exec("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
	bind("E", exec(programs.fileManager))
	bind("V", window.float({ action = "toggle" }))
	bind("R", exec(programs.menu))
	bind("T", hl.dsp.layout("togglesplit")) -- dwindle only
	bind("B", exec(programs.browser))

	bind("F", window.fullscreen({ mode = "maximized" }))
	bind("SHIFT + F", window.fullscreen({ mode = "fullscreen" }))

	-- Move focus with mainMod + arrow keys
	bind("H", focus({ direction = "left" }))
	bind("L", focus({ direction = "right" }))
	bind("K", focus({ direction = "up" }))
	bind("J", focus({ direction = "down" }))

	-- Switch workspaces with mainMod + [0-9]
	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		bind(key, focus({ workspace = i }))
		bind({ mainMod, "SHIFT", key }, window.move({ workspace = i }))
	end

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	bind({ mainMod, "mouse:272" }, window.drag(), { mouse = true })
	bind({ mainMod, "mouse:273" }, window.resize(), { mouse = true })

	-- Laptop multimedia keys for volume and LCD brightness
	bind(
		{ "XF86AudioRaiseVolume" },
		exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
		{ locked = true, repeating = true }
	)
	bind(
		{ "XF86AudioLowerVolume" },
		exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
		{ locked = true, repeating = true }
	)
	bind({ "XF86AudioMute" }, exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
	bind(
		{ "XF86AudioMicMute" },
		exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
		{ locked = true, repeating = true }
	)
	bind({ "XF86MonBrightnessUp" }, exec("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
	bind({ "XF86MonBrightnessDown" }, exec("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

	-- Requires playerctl
	bind({ "XF86AudioNext" }, exec("playerctl next"), { locked = true })
	bind({ "XF86AudioPause" }, exec("playerctl play-pause"), { locked = true })
	bind({ "XF86AudioPlay" }, exec("playerctl play-pause"), { locked = true })
	bind({ "XF86AudioPrev" }, exec("playerctl previous"), { locked = true })
end
