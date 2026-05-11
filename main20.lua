

local ModernUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Rizeniii/diamond/refs/heads/main/zero/main.luau"))()

local UI = ModernUI.new({
    Title = "Kemu Hub - Blox Fruits",
    SubTitle = "by Dibao",
    Icon = {
        "rbxassetid://107501927776354"
    },
    IconFPS = 0.1,
    FloatingButton = {
        Icon = {"rbxassetid://107501927776354"},
        Size = 52,
        Position = UDim2.new(1, -70, 0.5, -26)
    }
})



local Tabs = {
    About = UI:CreateTab{
        Name = "About"
    },
    StatusTab = UI:CreateTab{
    Name = "Status"
    },
    Main = UI:CreateTab{
        Name = "Tab Farm Main"
    },
    Settings = UI:CreateTab{
        Name = "Tab Settings"
    },
    Melee = UI:CreateTab{
        Name = "Tab Fighting Style"
    },
    Quests = UI:CreateTab{
        Name = "Tab Quests"
    },
    SeaEvent = UI:CreateTab{
        Name = "Tab Sea Events"
    },
    Mirage = UI:CreateTab{
        Name = "Tab Mirage + Trials V4"
    },
    Drago = UI:CreateTab{
        Name = "Tab Drago Dojo"
    },
    Prehistoric = UI:CreateTab{
        Name = "Tab Prehistoric Island"
    },
    Raids = UI:CreateTab{
        Name = "Tab Dungeon"
    },
    Combat = UI:CreateTab{
        Name = "Tab PVP + Visual"
    },
    Travel = UI:CreateTab{
        Name = "Tab Travelling"
    },
    Fruit = UI:CreateTab{
        Name = "Tab Fruits"
    },
    Shop = UI:CreateTab{
        Name = "Tab Shop"
    },
    Misc = UI:CreateTab{
        Name = "Tab Miscellanea"
    }

}

UI:AddInviteDiscord(Tabs.About, {
    Name = "Kemu Hub Discord",
    Link = "https://discord.gg/qeh3rUvtTQ",
    Icon = "rbxassetid://107501927776354",
    ButtonText = "Join"
})

FloD = UI:AddParagraph(Tabs.StatusTab,{
    Name = " FlozenDimension Status ",
    Content = ""
})
spawn(function()
    pcall(function()
        while wait(.2) do
            if workspace._WorldOrigin.Locations:FindFirstChild('Frozen Dimension') then
                FloD:SetDesc(' Flozen Dimension : True')
            else
                FloD:SetDesc(' Flozen Dimension : False')
            end
        end
    end)
end)
Check_Kitsu = Tabs.Status:AddParagraph({
    Title = " Kitsune Island Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        if workspace.Map:FindFirstChild("KitsuneIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
            Check_Kitsu:SetDesc(" Kitsune Island : True")
        else
            Check_Kitsu:SetDesc(" Kitsune Island : False")
        end
    end
end)
FullMOOn = Tabs.Status:AddParagraph({
    Title = " FullMoon Status ",
    Content = ""
})
Ismirage = Tabs.Status:AddParagraph({
    Title = " Mirage Island Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        if workspace.Map:FindFirstChild("MysticIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
            Ismirage:SetDesc(" Mirage Island : True")
        else
            Ismirage:SetDesc(" Mirage Island : False")
        end
    end
end)
spawn(function()
    while wait(.2) do
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
                FullMOOn:SetDesc("Moon : 0 / 8")
            elseif moon == moon2 then
                FullMOOn:SetDesc("Moon : 1 / 8")
            elseif moon == moon3 then
                FullMOOn:SetDesc("Moon : 2 / 8")
            elseif moon == moon4 then
                FullMOOn:SetDesc("Moon : 3 / 8 [ Next Night ]")
            elseif moon == moon5 then
                FullMOOn:SetDesc("Moon : 4 / 8 [ Full Moon ]")
            elseif moon == moon6 then
                FullMOOn:SetDesc("Moon : 5 / 8 [ Last Night ]")
            elseif moon == moon7 then
                FullMOOn:SetDesc("Moon : 6 / 8")
            elseif moon == moon8 then
                FullMOOn:SetDesc("Moon : 7 / 8")
            end
        end)
    end
end)
Check_Volcano = Tabs.Status:AddParagraph({
    Title = " Prehistoric Island Status ",
    Content = ""
})
spawn(function()
    while wait(.2) do
        if workspace.Map:FindFirstChild("PrehistoricIsland") or workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            Check_Volcano:SetDesc(" Prehistoric Island : True")
        else
            Check_Volcano:SetDesc(" Prehistoric Island : False")
        end
    end
end)
__indexPlayer = Tabs.Status:AddParagraph({
    Title = "All Players On Server :",
    Content = ""
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if i == 12 then
                    __indexPlayer:SetDesc("All Players :" .. " " .. i .. " " .. "/" .. " " .. "12" .. " " .. "[Max]")
                elseif i == 1 then
                    __indexPlayer:SetDesc("All Players  :" .. " " .. i .. " " .. "/" .. " " .. "12")
                else
                    __indexPlayer:SetDesc("All Players  :" .. " " .. i .. " " .. "/" .. " " .. "12")
                end
            end
        end)
    end
end)
CheckTier = Tabs.Status:AddParagraph({
    Title = " Tiers V4 Status ",
    Content = ""
})
spawn(function()
    pcall(function()
        while wait(.2) do
            CheckTier:SetDesc(" Tiers - V4  :" .. " " .. plr.Data.Race.C.Value)
        end
    end)
end)
Process = Tabs.Status:AddParagraph({
    Title = "Elites Process ",
    Content = ""
})
spawn(function()
    while wait(Sec) do
        pcall(function()
            Process:SetDesc("Elite Procress :  " .. replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end)
    end
end)

MobKilled = Tabs.Status:AddParagraph({
    Title = "Cake Princes :",
    Content = ""
})
spawn(function()
    while wait(.2) do
        pcall(function()
            local Killed = string.match(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")
            if Killed then
                MobKilled:SetDesc(" Killed : " .. (500 - Killed))
            end
        end)
    end
end)
CheckingBone = Tabs.Status:AddParagraph({
    Title = " Bones :",
    Content = ""
})
spawn(function()
    while wait(.2) do
        pcall(function()
            CheckingBone:SetDesc(" Bones : " .. GetM("Bones"))
        end)
    end
end)