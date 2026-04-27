---------------------
----- VARIABLES -----
---------------------

local programs = {
	terminal = "kitty",
	fileManager = "dolphin",
	menu = "wofi -S drun",
	browser = "vivaldi",
}

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd(programs.terminal)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------
---- CONFIGS ----
-----------------

local appearance = require("config.appearance")
local input = require("config.input")
local binds = require("config.binds")
local rules = require("config.rules")

appearance()
input()
binds(mainMod, programs)
rules()
