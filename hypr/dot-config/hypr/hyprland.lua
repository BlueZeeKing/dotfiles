hl.config({
	cursor = {
		no_hardware_cursors = 1,
	},
	input = {
		kb_layout = "us",
		kb_options = "ctrl:nocaps",

		follow_mouse = 1,

		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
			scroll_factor = 0.5,
			disable_while_typing = true,
		},

		sensitivity = -0.4,
		accel_profile = "flat",
		scroll_factor = 1.1,

		tablet = {
			relative_input = true,
		},
	},
	general = {
		gaps_in = 5,
		gaps_out = { top = 0, left = 10, right = 10, bottom = 10 },
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(aac7ffee)", "rgba(dcbce0ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = true,

		layout = "dwindle",

		allow_tearing = false,
	},
	decoration = {
		rounding = 10,
		rounding_power = 2.0,

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
		},

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
	},
	dwindle = {
		preserve_split = true,
	},
	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 0,
		enable_anr_dialog = true,
		enable_swallow = false,
		swallow_regex = "foot",
	},

	xwayland = {
		force_zero_scaling = true,
	},

	animations = {
		enabled = true,
	},
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.monitor({
	output = "DP-3",
	mode = "preferred",
	position = "-690x-1728",
	scale = 1.25,
})

hl.monitor({
	output = "DP-2",
	mode = "preferred",
	position = "-690x-1728",
	scale = 1.25,
})

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "0x0",
	scale = 1.333333333,
})

hl.device({
	name = "pixa3854:00-093a:0274-touchpad",
	sensitivity = 0.9,
})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

hl.env("XCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita-dark")
hl.env("HYPRCURSOR_THEME", "BreezeX-Dark-hyprcursor")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "pip",
	match = { title = "Picture[ -]in[ -][pP]icture" },
	float = true,
	pin = true,
	move = { "100%-w-10", "100%-w-10" },
})

hl.window_rule({
	name = "controlgui",
	match = { class = "org.pulseaudio.pavucontrol|nm-connection-editor|blueman-manager|foot.float" },
	float = true,
	size = { 900, 700 },
})

hl.window_rule({
	name = "feh",
	match = { class = "feh.float" },
	float = true,
	center = true,
})

hl.window_rule({
	name = "tile",
	match = { class = "Robot Simulation|ffplay|com-sun-tools-javac-launcher-Main" },
	tile = true,
})

hl.bind("SUPER + T", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("foot yazi"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("hyprlauncher"))

hl.bind("SUPER + Q", hl.dsp.window.kill())
hl.bind("SUPER + Z", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(
	"SUPER + S",
	hl.dsp.exec_cmd(
		'grimblast --notify copysave area "/home/brayden/Documents/Screenshots/screenshot-$(date "+%m-%d-%Y-%H:%M:%S").jpg"'
	)
)
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.exec_cmd(
		'grimblast --notify copysave output "/home/brayden/Documents/Screenshots/screenshot-$(date "+%m-%d-%Y-%H:%M:%S").jpg"'
	)
)
hl.bind(
	"Print",
	hl.dsp.exec_cmd(
		'grimblast --notify copysave output "/home/brayden/Documents/Screenshots/screenshot-$(date "+%m-%d-%Y-%H:%M:%S").jpg"'
	)
)

hl.bind("SUPER + M", function()
	hl.dispatch(hl.dsp.dpms({ action = "off", monitor = "eDP-1" }))
	hl.monitor({ output = "eDP-1", disabled = true })
end)

hl.bind("SUPER + slash", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + minus", hl.dsp.layout("swapsplit"))
hl.bind("SUPER + R", hl.dsp.window.toggle_swallow())

hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }))

for i = 0, 9 do
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("switch:on:Lid Switch", function()
	hl.dispatch(hl.dsp.dpms({ action = "off", monitor = "eDP-1" }))
	if #hl.get_monitors() > 1 then
		hl.monitor({ output = "eDP-1", disabled = true })
	end
end, { locked = true })

hl.bind("switch:off:Lid Switch", function()
	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "0x0",
		scale = 1.333333333,
		disabled = false,
	})
	hl.timer(function()
		hl.dispatch(hl.dsp.dpms({ action = "on", monitor = "eDP-1" }))
	end, { timeout = 50, type = "oneshot" })
end, { locked = true })

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl start --user waybar")
	hl.exec_cmd("systemctl start --user hypridle")
	hl.exec_cmd("systemctl start --user hyprpaper")
end)
