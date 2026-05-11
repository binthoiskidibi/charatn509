getgenv().Config = {
    ["Team"] = "Pirates",
    ["FpsBoost"] = false,
    ["blackscreen"] = false

}

local CFG = getgenv().Config
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommF_Remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
CommF_Remote:InvokeServer("SetTeam", CFG["Team"])

local LocalPlayer = game:GetService("Players").LocalPlayer
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
local player = game.Players.LocalPlayer
local VirtualUser  = game:GetService("VirtualUser")
local character = player.Character or player.CharacterAdded:Wait()
local Players = game:GetService("Players")

pcall(function()
    for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do 
        if v:IsA("TextLabel") and v.Name == "Check" then
            v:Destroy()
        end
    end
end)

local ScreenGui = Instance.new("ScreenGui");
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui");

-- Giữ nguyên TitleLabel
local TitleLabel = Instance.new("TextLabel");
TitleLabel.Name = "Title";
TitleLabel.Size = UDim2.new(0, 500, 0, 70);
TitleLabel.Position = UDim2.new(0.5, -250, 0.5, -100);
TitleLabel.BackgroundTransparency = 1;
TitleLabel.Font = Enum.Font.GothamBlack;
TitleLabel.Text = "Lo hub";
TitleLabel.TextSize = 60;
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
TitleLabel.TextStrokeTransparency = 0.5;
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
TitleLabel.Parent = ScreenGui;


local KaitunLabel = Instance.new("TextLabel");
KaitunLabel.Name = "Auto CDK";
KaitunLabel.Size = UDim2.new(0, 500, 0, 40);
KaitunLabel.Position = UDim2.new(0.5, -250, 0.5, -20);
KaitunLabel.BackgroundTransparency = 1;
KaitunLabel.Font = Enum.Font.GothamBold;
KaitunLabel.Text = "Auto Rip";
KaitunLabel.TextSize = 24;
KaitunLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
KaitunLabel.TextStrokeTransparency = 0.7;
KaitunLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
KaitunLabel.Parent = ScreenGui;


local CheckLabel = Instance.new("TextLabel");
CheckLabel.Name = "Check";
CheckLabel.Size = UDim2.new(0, 500, 0, 40);
CheckLabel.Position = UDim2.new(0.5, -250, 0.5, 40);
CheckLabel.BackgroundTransparency = 1;
CheckLabel.Font = Enum.Font.GothamBold;
CheckLabel.Text = "Loading";
CheckLabel.TextSize = 22;
CheckLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
CheckLabel.TextStrokeTransparency = 0.7;
CheckLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
CheckLabel.Parent = ScreenGui;

local Lighting = game:GetService("Lighting")

local Blur = Instance.new("BlurEffect")
Blur.Size = 15
Blur.Parent = Lighting


if CFG["blackscreen"] then
    game:GetService('Lighting').ExposureCompensation = -math.huge
end