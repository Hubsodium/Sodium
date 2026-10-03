
local AetherUI = require(script.Parent.AetherUI)

local window = AetherUI:CreateWindow({
	Title = "NOVA ISLAND",
	Subtitle = "Player controls",
	ToggleKey = Enum.KeyCode.RightShift,
	Accent = Color3.fromRGB(143, 119, 255),
})

window:AddFloatingButton("?", function()
	window:Notify({
		Title = "Quick help",
		Text = "Drag the small floating buttons to move them.",
	})
end)

local home = window:AddTab({
	Name = "Overview",
	Icon = "⌂",
})

local actions = home:AddSection("Quick actions")
actions:AddLabel("Your game controls, organized in one place.")
actions:AddButton("Collect daily reward", "Run your own reward logic here", function()
	window:Notify({
		Title = "Reward",
		Text = "Connect this button to your game's reward system.",
	})
end)

local settings = home:AddSection("Player settings")
local sprint = settings:AddToggle("Sprint enabled", false, function(enabled)
	print("Sprint enabled:", enabled)
end)

settings:AddSlider("Walk speed", {
	Min = 8,
	Max = 32,
	Default = 16,
	Step = 1,
}, function(value)
	print("Selected walk speed:", value)
end)

local graphicsTab = window:AddTab({
	Name = "Preferences",
	Icon = "◇",
})

local display = graphicsTab:AddSection("Display")
display:AddDropdown("Quality preset", {
	Options = { "Balanced", "Performance", "High detail" },
	Default = "Balanced",
}, function(value)
	print("Quality preset:", value)
end)

display:AddTextBox("Player note", {
	Placeholder = "Write a short note...",
}, function(text)
	print("Player note:", text)
end)

display:AddButton("Show status", function()
	window:Notify({
		Title = "All set",
		Text = sprint:GetValue() and "Sprint is enabled." or "Sprint is disabled.",
		Duration = 2.5,
	})
end)
