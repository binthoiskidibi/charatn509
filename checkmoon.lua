local ScreenGui = Instance.new("ScreenGui");
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui");

local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.Position = UDim2.new(0.346318, 0, 0, 0)
Frame.Size = UDim2.new(0, 232, 0, 124)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderSizePixel = 0
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "TextLabel"
TextLabel.Size = UDim2.new(0, 232, 0, 69)
TextLabel.BackgroundColor3 = Color3.new(0.188235, 0.85098, 1)
TextLabel.BorderSizePixel = 0
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.Text = "Moon : "
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 20
TextLabel.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel.Parent = Frame

local TextLabel2 = Instance.new("TextLabel")
TextLabel2.Name = "TextLabel"
TextLabel2.Position = UDim2.new(0, 0, 0.556452, 0)
TextLabel2.Size = UDim2.new(0, 232, 0, 55)
TextLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel2.BorderSizePixel = 0
TextLabel2.BorderColor3 = Color3.new(0, 0, 0)
TextLabel2.Text = "Player : "
TextLabel2.TextColor3 = Color3.new(0, 0, 0)
TextLabel2.TextSize = 14
TextLabel2.FontFace = Font.new("rbxasset://fonts/families/LuckiestGuy.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
TextLabel2.Parent = Frame
local Lighting = game:GetService("Lighting")
local placeId = game.PlaceId
local worldMap = {[2753915549] = "World1",[85211729168715] = "World1",[4442272183] = "World2",[79091703265657] = "World2",[7449423635] = "World3",[100117331123089] = "World3"}
local World1, World2, World3 = false, false, false
if worldMap[placeId] then
    local world = worldMap[placeId]
    if world == "World1" then
        World1 = true
    elseif world == "World2" then
        World2 = true
    elseif world == "World3" then
        World3 = true
    end
else
    game.Players.LocalPlayer:Kick("❌ Not Support Game ❌")
end
Getmoon = function()
    if World1 then
        return Lighting.FantasySky.MoonTextureId
    elseif World2 then
        return Lighting.FantasySky.MoonTextureId
    elseif World3 then
        return Lighting.Sky.MoonTextureId
    end
end

spawn(function()
    while wait(1) do
        pcall(function()
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if i == 12 then
                    TextLabel2.Text = "Player : " .. i .. " / 12 ( Max Player ) "
                elseif i == 1 then
                    TextLabel2.Text = "Player : " .. i .. " / 12 "
                else
                    TextLabel2.Text = "Player : " .. i .. " / 12"
                end
            end
        end)
    end
end)
print("Load Player")

spawn(function()
    while wait(5) do
        pcall(function()
            moon8 = "http://www.roblox.com/asset/?id=9709150401"
            moon7 = "http://www.roblox.com/asset/?id=9709150086"
            moon6 = "http://www.roblox.com/asset/?id=9709149680"
            moon5 = "http://www.roblox.com/asset/?id=9709149431"
            moon4 = "http://www.roblox.com/asset/?id=9709149052"
            moon3 = "http://www.roblox.com/asset/?id=9709143733"
            moon2 = "http://www.roblox.com/asset/?id=9709139597"
            moon1 = "http://www.roblox.com/asset/?id=9709135895"
            moon = Getmoon()
            if moon == moon1 then
                    TextLabel.Text = "Moon : 0 / 8"
            elseif moon == moon2 then
                TextLabel.Text = "Moon : 1 / 8"
            elseif moon == moon3 then
                TextLabel.Text = "Moon : 2 / 8"
            elseif moon == moon4 then
                TextLabel.Text = "Moon : 3 / 8 [ Next Full Moon ]"
            elseif moon == moon5 then
                TextLabel.Text = "Moon : 4 / 8 [ Full Moon ]"
            elseif moon == moon6 then
                TextLabel.Text = "Moon : 5 / 8 [ Last Night ]"
            elseif moon == moon7 then
                TextLabel.Text = "Moon : 6 / 8"
            elseif moon == moon8 then
                TextLabel.Text = "Moon : 7 / 8"
            end
        end)
    end
end)

print("Load Full Script")