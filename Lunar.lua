-- lunar Universal Script Hub v1.0 (release)
local Hub = {
    Scripts = {}
}

-- ===== СПИСОК ИГР =====
Hub.Scripts = {
    ["Arena 1.8"] = {
        name = "⚔️ Arena 1.8",
        load = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lutosys/1.8arena/refs/heads/main/1.8arena.lua"))()
        end
    },
    ["Forsaken"] = {
        name = "🔪 Forsaken",
        load = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB"))()
        end
    },
    ["Rost alpha"] = {
        name = "🌋 Rost alpha", -- Исправлена кавычка
        load = function()
            loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download"))()
        end
    },
    ["Rivals"] = {
        name = "🏹 Rivals",
        load = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"))()
        end
    }
}

-- ===== GUI =====
local screen = Instance.new("ScreenGui")
screen.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BackgroundTransparency = 0.15
frame.Active = true
frame.Draggable = true
frame.Parent = screen

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌜 Lunar Hub 🌛"
title.TextColor3 = Color3.fromRGB(255, 200, 0)
title.BackgroundTransparency = 1
title.Parent = frame

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -10, 1, -80)
list.Position = UDim2.new(0, 5, 0, 45)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, #Hub.Scripts * 45)
list.Parent = frame

local function createButton(text, callback, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    btn.BorderSizePixel = 0
    btn.Parent = list
    btn.MouseButton1Click:Connect(callback)
end

local y = 5
for _, data in pairs(Hub.Scripts) do
    createButton(data.name, data.load, y)
    y = y + 40
end

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.BackgroundTransparency = 1
close.Parent = frame
close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

print("✅ Lunar Hub v1.0 загружен!")
