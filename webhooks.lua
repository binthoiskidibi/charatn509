local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1484217882484408511/EfnsHVzLd9S1ABQO_h2qwZM0kjnJGHdMpwOjbLxWmuhDQBuJgf-KDuGJ8S9fK94vcX2P"


local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local function b64encode(data)
    return ((data:gsub('.', function(x)
        local r, b = '', x:byte()
        for i = 8, 1, -1 do
            r = r .. (b % 2^i - b % 2^(i-1) > 0 and '1' or '0')
        end
        return r
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if #x < 6 then return '' end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i,i) == '1' and 2^(6-i) or 0) end
        return b64chars:sub(c+1, c+1)
    end) .. ({ '', '==', '=' })[#data % 3 + 1])
end


local function sendWebhook(timeToEnd)

    local totalSecs = math.floor(workspace.DistributedGameTime)
    local h = math.floor(totalSecs / 3600)
    local m = math.floor((totalSecs % 3600) / 60)
    local s = totalSecs % 60
    local timeInServer = string.format("%02d:%02d:%02d", h, m, s)


    local encodedJobId = "Meyy-" .. b64encode(game.JobId)

    local data = {
        ["embeds"] = {{
            ["title"] = "Full Moon ",
            ["color"] = 15278835,
            ["author"] = {
                ["name"] = "Meyy Hub - Webhook Premium",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/1479484202859888787/1484218124218925147/1772834443934.jpg?ex=69bd6d58&is=69bc1bd8&hm=7f3d35d268dec5113ecfe20d28efd709830d8a2ff829df4ffacc81c750788b12&"
            },
            ["thumbnail"] = {
                ["url"] = "https://media.discordapp.net/attachments/1479484202859888787/1484217345688735774/discord_fake_avatar_decorations_1772812227075.gif?ex=69bd6c9e&is=69bc1b1e&hm=626849e8476ee44e615907f635bfed7c6dbb089c61af6fcd79069d4c8817da8b&="
            },
            ["image"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/1479484202859888787/1484217346091384833/meyy-hub-animated.gif?ex=69bd6c9e&is=69bc1b1e&hm=ee89f510b6c8522f561950398fe6a974cd6aca2fc320d749fcebb6d713bfd1e9&"
            },
            ["fields"] = {
                {
                    ["name"] = "Time To End 🌑",
                    ["value"] = "```" .. timeToEnd .. " Minute(s)```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Time in Server",
                    ["value"] = "```" .. timeInServer .. "```",
                    ["inline"] = true
                },
                {
                    ["name"] = "Players",
                    ["value"] = "```" .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers .. "```",
                    ["inline"] = false
                },
                {
                    ["name"] = "Place ID",
                    ["value"] = "```" .. game.PlaceId .. "```",
                    ["inline"] = false
                },
                {
                    ["name"] = "Job ID (Encoded)",
                    ["value"] = "```" .. encodedJobId .. "```",
                    ["inline"] = false
                }
            },
            ["footer"] = {
                ["text"] = "Meyy Hub • " .. os.date("%H:%M %d/%m/%Y")
            }
        }}
    }

    pcall(function()
        local body = HttpService:JSONEncode(data)
        if syn then
            syn.request({Url = WEBHOOK_URL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        else
            request({Url = WEBHOOK_URL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        end
        print("✅ Webhook sent! Encoded JobId:", encodedJobId)
    end)
end

sendWebhook(25) 