local FlurioreFixLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/Ui-FlurioreLib/refs/heads/main/FlurioreLibFix.lua"))()
local Notify = FlurioreFixLib:MakeNotify({
	["Title"] = "Kemu HUB",
	["Description"] = "Notification",
	["Color"] = Color3.fromRGB(255, 0, 255),
	["Content"] = "Welcome to Kemu HUB",
	["Time"] = 1,
	["Delay"] = 10
})
local FlurioreGui = FlurioreFixLib:MakeGui({
	["NameHub"] = "Kemu Hub - Blox Fruits",
	["Description"] = "by Dibao",
	["Color"] = Color3.fromRGB(255, 0, 255),
	["Tab Width"] = 125
})
local Tab1 = FlurioreGui:CreateTab({
	["Name"] = "Main",
	["Icon"] = "rbxassetid://7733960981"
})
local Tab2 = FlurioreGui:CreateTab({
	["Name"] = "Setting",
	["Icon"] = "rbxassetid://7734053495"
})
local Section = Tab1:AddSection("Setting Farm")
local Paragraph = Section:AddParagraph({
	["Title"] = "Paragraph",
	["Content"] = "This is a Paragraph"
})
Paragraph:Set({
	["Title"] = "Paragraph",
	["Content"] = "This is a Paragraph"
})
local Toggle = Section:AddToggle({
	["Title"]= "Toggle",
	["Content"] = "This is a Toggle",
	["Default"] = false,
	["Multi"] = true,
	["Options"] = {"Option 1", "Option 2"},
	["Selecting"] = {"Option 1"},
	["Callback"] = function(Value) 
		print(Value)
	end
})
Toggle:Set(false)
print(Toggle.Value)
local Button = Section:AddButton({
	["Title"] = "Button",
	["Content"] = "This is a Button",
	["Icon"] = "rbxassetid://16932740082",
	["Callback"] = function()
		print("Button Clicked!")
	end
})
local Slider = Section:AddSlider({
	["Title"] = "Slider",
	["Content"] = "This is a Slider",
	["Min"] = 0,
	["Max"] = 100,
	["Increment"] = 1,
	["Default"] = 30,
	["Callback"] = function(Value) 
		print(Value)
	end
})
Slider:Set(30)
print(Slider.Value)
local Input = Section:AddInput({
	["Title"] = "Input",
	["Content"] = "This is a Input",
	["Callback"] = function(Value) 
		print(Value)
	end
})
Input:Set("Input TextBox")
print(Input.Value)
local Dropdown = Section:AddDropdown({
	["Title"] = "Dropdown",
	["Content"] = "This is a Dropdown",
	["Multi"] = false,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
Dropdown:Set({"Option 1"})
Dropdown:AddOption("Option 3")
Dropdown:Clear()
Dropdown:Refresh({"Option 1", "Option 2"}, {"Option 1"})
print(Dropdown.Value)
print(Dropdown.Options)