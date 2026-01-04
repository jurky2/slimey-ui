
-- Example usage
-- This library is typically loaded via executor using a RAW URL.

local RAW_UI_URL = "https://raw.githubusercontent.com/jurky2/slimey-ui/refs/heads/main/UI.lua" -- <- put your raw ui.lua link here

local library = loadstring(game:HttpGet(RAW_UI_URL))()

local window = library:window({
	name = "slimy",
	suffix = "ui",
	gameInfo = "Mobile Demo",
	-- Keep your desktop/tablet size; ui.lua will auto-downscale on phones.
	size = UDim2.new(0, 700, 0, 565),
})

local main = window:tab({
	name = "Main",
})

local left = main:column({ size = 0.5 })
local right = main:column({ size = 0.5 })

local controls = left:section({ name = "Controls", size = 1 })
local visuals = right:section({ name = "Visuals", size = 1 })

controls:toggle({
	name = "Enabled",
	flag = "enabled",
	default = false,
	callback = function(on)
		print("toggle:", on)
	end,
})

controls:slider({
	name = "Speed",
	flag = "speed",
	min = 0,
	max = 100,
	interval = 1,
	default = 50,
	suffix = "%",
	callback = function(v)
		print("slider:", v)
	end,
})

controls:dropdown({
	name = "Mode",
	flag = "mode",
	items = {"Legit", "Rage", "Safe"},
	default = "Legit",
	callback = function(v)
		print("dropdown:", v)
	end,
})

visuals:colorpicker({
	name = "Accent",
	flag = "accent",
	color = Color3.fromRGB(155, 150, 219),
	alpha = 0,
	callback = function(c, a)
		print("color:", c, "alpha:", a)
	end,
})

visuals:button({
	name = "Notify",
	callback = function()
		library.notifications:create_notification({
			name = "slimy ui",
			info = "Hello from example.lua",
			lifetime = 3,
		})
	end,
})

