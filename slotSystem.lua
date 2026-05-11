-- ============================================================
--  NAAHUB — SLOT SYSTEM v2
--  Dùng Vercel API thay vì gọi thẳng Firebase
--  Thay VERCEL_URL bằng URL web Vercel của bạn
-- ============================================================

local VERCEL_URL = "https://naahub-dashboard.vercel.app"  -- ← thay URL của bạn
local Http       = game:GetService("HttpService")
local Players    = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ID độc nhất cho mỗi tab
local mySlotID = tostring(LocalPlayer.UserId) .. "_" .. tostring(math.floor(tick()))

-- ============================================================
--  ĐĂNG KÝ SLOT
-- ============================================================
local function RegisterSlot()
    local ok, res = pcall(function()
        return request({
            Url    = VERCEL_URL .. "/api/slots",
            Method = "POST",
            Body   = Http:JSONEncode({
                slotID = mySlotID,
                user   = LocalPlayer.Name,
                userID = LocalPlayer.UserId,
            }),
            Headers = { ["Content-Type"] = "application/json" }
        })
    end)

    if not ok or not res then
        warn("[NaaHub] Không thể kết nối server!")
        return false
    end

    local data = Http:JSONDecode(res.Body)

    -- Hết slot
    if res.StatusCode == 429 or (data and not data.ok) then
        local msg = data and data.error or "Đã đạt giới hạn tab!"
        warn("[NaaHub] ❌ " .. msg)
        error(msg)
        return false
    end

    print(string.format("[NaaHub] ✅ Slot đăng ký thành công! [%d/%d]", data.active or 0, data.max or 20))
    return true
end

-- ============================================================
--  GIẢI PHÓNG SLOT
-- ============================================================
local function ReleaseSlot()
    pcall(function()
        request({
            Url    = VERCEL_URL .. "/api/slots/" .. mySlotID,
            Method = "DELETE",
        })
    end)
end

-- ============================================================
--  HEARTBEAT — giữ slot không bị dọn (mỗi 5 phút)
-- ============================================================
local function StartHeartbeat()
    task.spawn(function()
        while task.wait(300) do
            pcall(function()
                request({
                    Url    = VERCEL_URL .. "/api/slots/" .. mySlotID,
                    Method = "PATCH",
                })
            end)
        end
    end)
end

-- Tự xóa slot khi thoát game
LocalPlayer.AncestryChanged:Connect(function()
    ReleaseSlot()
end)

-- ============================================================
--  CHECK & KHỞI ĐỘNG
-- ============================================================
local function CheckSlot()
    local success = RegisterSlot()
    if not success then return false end
    StartHeartbeat()
    return true
end

return {
    Check   = CheckSlot,
    Release = ReleaseSlot,
    SlotID  = mySlotID,
}
