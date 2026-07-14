-- =====================================================
-- 🌙 LUNAR ULTIMATE HUB v3.0 - "GOD EDITION"
-- =====================================================
-- ПОЛНАЯ ВЕРСИЯ: Скрипты + Цвета + Читы + ESP + X-Ray + Fly + NoClip
-- ГОТОВО К ЗАЛИВКЕ НА GITHUB
-- =====================================================

-- ===== АНТИ-ДЕТЕКТ =====
local function antiBan()
    local CoreGui = game:GetService("CoreGui")
    CoreGui.ChildAdded:Connect(function(child)
        if child:IsA("ScreenGui") and child.Name ~= "LunarHub" then
            child:Destroy()
        end
    end)
end
antiBan()

-- ===== СПИСОК СКРИПТОВ =====
local Scripts = {
    ["⚔️ Arena 1.8"] = "https://raw.githubusercontent.com/Lutosys/1.8arena/refs/heads/main/1.8arena.lua",
    ["🔪 Forsaken"] = "https://raw.githubusercontent.com/ScriptDLC/ScriptDLC/refs/heads/main/ForsakenDLCHUB",
    ["🌋 Rost alpha"] = "https://api.jnkie.com/api/v1/luascripts/public/e629b8f01eed30630fc3cb93da70708fdac4e57f3fd11fc6dc308c4d7ba6c1bd/download",
    ["🏹 Rivals"] = "https://rawscripts.net/raw/RIVALS-Noks-hub-keyless-111339"
}

-- ===== ЦВЕТА =====
local Colors = {
    {Name = "🔴", Color = Color3.fromRGB(200, 30, 30)},
    {Name = "🟢", Color = Color3.fromRGB(30, 200, 30)},
    {Name = "🔵", Color = Color3.fromRGB(30, 100, 255)},
    {Name = "🟡", Color = Color3.fromRGB(255, 200, 0)},
    {Name = "🟣", Color = Color3.fromRGB(150, 30, 200)},
    {Name = "🟠", Color = Color3.fromRGB(255, 150, 0)},
    {Name = "⚪", Color = Color3.fromRGB(255, 255, 255)},
    {Name = "🌙", Color = Color3.fromRGB(0, 200, 255)}
}
local selectedColor = Colors[3].Color

-- ===== ЧИТЫ =====
local Cheats = {
    {Name = "👁️ ESP", enabled = false},
    {Name = "🔍 X-Ray", enabled = false},
    {Name = "✈️ Fly", enabled = false},
    {Name = "🚪 NoClip", enabled = false}
}

-- ===== ESP СИСТЕМА =====
local espObjects = {}
local function toggleESP(state)
    local Players = game:GetService("Players")
    if state then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.Adornee = player.Character
                highlight.Parent = player.Character
                table.insert(espObjects, highlight)
            end
        end
        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(char)
                wait(0.5)
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.Adornee = char
                highlight.Parent = char
                table.insert(espObjects, highlight)
            end)
        end)
    else
        for _, obj in pairs(espObjects) do
            obj:Destroy()
        end
        espObjects = {}
    end
end

-- ===== X-RAY СИСТЕМА =====
local function toggleXRay(state)
    local Lighting = game:GetService("Lighting")
    if state then
        Lighting.Brightness = 10
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.GlobalShadows = false
        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.ForceField
                part.Transparency = 0.3
            end
        end
    else
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        Lighting.GlobalShadows = true
        for _, part in pairs(game.Workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = Enum.Material.Plastic
                part.Transparency = 0
            end
        end
    end
end

-- ===== FLY СИСТЕМА =====
local flyBodyVelocity = nil
local moveVector = Vector3.new(0, 0, 0)
local flyConnection = nil
local flyInputConnection = nil

local function toggleFly(state)
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character
    if not char then return end
    
    if state then
        if char:FindFirstChild("Humanoid") then
            char.Humanoid.PlatformStand = true
        end
        flyBodyVelocity = Instance.new("BodyVelocity")
        flyBodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 100000
        flyBodyVelocity.Velocity = Vector3.new(0, 10, 0)
        flyBodyVelocity.Parent = char.HumanoidRootPart
        
        flyInputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then moveVector = moveVector + Vector3.new(0, 0, -10)
            elseif input.KeyCode == Enum.KeyCode.S then moveVector = moveVector + Vector3.new(0, 0, 10)
            elseif input.KeyCode == Enum.KeyCode.A then moveVector = moveVector + Vector3.new(-10, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.D then moveVector = moveVector + Vector3.new(10, 0, 0)
            elseif input.KeyCode == Enum.KeyCode.Space then moveVector = moveVector + Vector3.new(0, 10, 0)
            elseif input.KeyCode == Enum.KeyCode.LeftShift then moveVector = moveVector + Vector3.new(0, -10, 0) end
        end)
        
        flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if flyBodyVelocity then flyBodyVelocity.Velocity = moveVector end
        end)
    else
        if char:FindFirstChild("Humanoid") then
            char.Humanoid.PlatformStand = false
        end
        if flyBodyVelocity then
            flyBodyVelocity:Destroy()
            flyBodyVelocity = nil
        end
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        if flyInputConnection then
            flyInputConnection:Disconnect()
            flyInputConnection = nil
        end
        moveVector = Vector3.new(0, 0, 0)
    end
end

-- ===== GUI =====
local screen = Instance.new("ScreenGui")
screen.Name = "LunarHub"
screen.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 380)
frame.Position = UDim2.new(0.5, -200, 0.5, -190)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true
frame.Parent = screen

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "🌜 LUNAR ULTIMATE v3.0"
title.TextColor3 = selectedColor
title.BackgroundTransparency = 1
title.TextSize = 20
title.Parent = frame

-- ===== ВКЛАДКИ =====
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, -10, 0, 30)
tabContainer.Position = UDim2.new(0, 5, 0, 38)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = frame

local tabs = {"📜 Скрипты", "🎨 Цвета", "💀 Читы"}
local tabButtons = {}
local currentTab = "📜 Скрипты"

local function createTabButton(text, xPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 1, 0)
    btn.Position = UDim2.new(0, xPos, 0, 0)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.fromRGB(100, 100, 150)
    btn.Parent = tabContainer
    tabButtons[text] = btn
    return btn
end

local xPos = 0
for _, tab in ipairs(tabs) do
    createTabButton(tab, xPos)
    xPos = xPos + 125
end

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -10, 1, -80)
content.Position = UDim2.new(0, 5, 0, 72)
content.BackgroundTransparency = 1
content.Parent = frame

-- ===== ВКЛАДКА: СКРИПТЫ =====
local function createScriptsTab()
    for _, child in pairs(content:GetChildren()) do child:Destroy() end
    
    local search = Instance.new("TextBox")
    search.Size = UDim2.new(1, 0, 0, 30)
    search.PlaceholderText = "🔍 Поиск скрипта..."
    search.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    search.TextColor3 = Color3.fromRGB(255, 255, 255)
    search.TextSize = 14
    search.Parent = content
    
    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, 0, 1, -35)
    list.Position = UDim2.new(0, 0, 0, 35)
    list.BackgroundTransparency = 1
    list.Parent = content
    
    local function createButtons(filter)
        for _, child in pairs(list:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        local y = 5
        local count = 0
        for name, url in pairs(Scripts) do
            if not filter or name:lower():find(filter:lower()) then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -10, 0, 35)
                btn.Position = UDim2.new(0, 5, 0, y)
                btn.Text = name
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                btn.BorderSizePixel = 1
                btn.BorderColor3 = selectedColor
                btn.Parent = list
                
                btn.MouseButton1Click:Connect(function()
                    btn.Text = "⏳ Загрузка..."
                    local success, err = pcall(function()
                        loadstring(game:HttpGet(url))()
                    end)
                    if success then
                        btn.Text = "✅ " .. name
                        btn.BackgroundColor3 = Color3.fromRGB(0, 200, 50)
                        wait(1)
                        btn.Text = name
                        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                    else
                        btn.Text = "❌ Ошибка"
                        btn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                        wait(1.5)
                        btn.Text = name
                        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                    end
                end)
                
                y = y + 40
                count = count + 1
            end
        end
        list.CanvasSize = UDim2.new(0, 0, 0, count * 40 + 10)
    end
    
    search:GetPropertyChangedSignal("Text"):Connect(function()
        createButtons(search.Text)
    end)
    createButtons("")
end

-- ===== ВКЛАДКА: ЦВЕТА =====
local function createColorsTab()
    for _, child in pairs(content:GetChildren()) do child:Destroy() end
    
    local colorContainer = Instance.new("Frame")
    colorContainer.Size = UDim2.new(1, 0, 1, 0)
    colorContainer.BackgroundTransparency = 1
    colorContainer.Parent = content
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Text = "🎨 Выбери цвет:"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 16
    label.BackgroundTransparency = 1
    label.Parent = colorContainer
    
    local function createColorBtn(colorData, index)
        local btn = Instance.new("TextButton")
        local colsPerRow = 4
        local btnSize = 55
        local spacing = 10
        local col = (index - 1) % colsPerRow
        local row = math.floor((index - 1) / colsPerRow)
        
        btn.Size = UDim2.new(0, btnSize, 0, btnSize)
        btn.Position = UDim2.new(0, 10 + col * (btnSize + spacing), 0, 35 + row * (btnSize + spacing))
        btn.Text = ""
        btn.BackgroundColor3 = colorData.Color
        btn.BorderSizePixel = 2
        btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
        btn.Parent = colorContainer
        
        btn.MouseButton1Click:Connect(function()
            selectedColor = colorData.Color
            title.TextColor3 = selectedColor
            
            for _, child in pairs(content:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    for _, btnChild in pairs(child:GetChildren()) do
                        if btnChild:IsA("TextButton") then
                            btnChild.BorderColor3 = selectedColor
                        end
                    end
                end
            end
        end)
    end
    
    for i, colorData in ipairs(Colors) do
        createColorBtn(colorData, i)
    end
end

-- ===== ВКЛАДКА: ЧИТЫ =====
local function createCheatsTab()
    for _, child in pairs(content:GetChildren()) do child:Destroy() end
    
    local cheatsContainer = Instance.new("Frame")
    cheatsContainer.Size = UDim2.new(1, 0, 1, 0)
    cheatsContainer.BackgroundTransparency = 1
    cheatsContainer.Parent = content
    
    local function createCheatToggle(cheatData, index)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -20, 0, 45)
        btn.Position = UDim2.new(0, 10, 0, 10 + (index - 1) * 50)
        btn.Text = cheatData.Name .. " ❌"
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 16
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        btn.BorderSizePixel = 2
        btn.BorderColor3 = Color3.fromRGB(200, 0, 0)
        btn.Parent = cheatsContainer
        
        btn.MouseButton1Click:Connect(function()
            cheatData.enabled = not cheatData.enabled
            if cheatData.enabled then
                btn.Text = cheatData.Name .. " ✅"
                btn.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
                btn.BorderColor3 = Color3.fromRGB(0, 255, 0)
                
                if cheatData.Name == "👁️ ESP" then
                    toggleESP(true)
                elseif cheatData.Name == "🔍 X-Ray" then
                    toggleXRay(true)
                elseif cheatData.Name == "✈️ Fly" then
                    toggleFly(true)
                elseif cheatData.Name == "🚪 NoClip" then
                    local player = game:GetService("Players").LocalPlayer
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CanCollide = false
                    end
                end
            else
                btn.Text = cheatData.Name .. " ❌"
                btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
                btn.BorderColor3 = Color3.fromRGB(200, 0, 0)
                
                if cheatData.Name == "👁️ ESP" then
                    toggleESP(false)
                elseif cheatData.Name == "🔍 X-Ray" then
                    toggleXRay(false)
                elseif cheatData.Name == "✈️ Fly" then
                    toggleFly(false)
                elseif cheatData.Name == "🚪 NoClip" then
                    local player = game:GetService("Players").LocalPlayer
                    local char = player.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CanCollide = true
                    end
                end
            end
        end)
    end
    
    for i, cheat in ipairs(Cheats) do
        createCheatToggle(cheat, i)
    end
end

-- ===== ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК =====
local function switchTab(tabName)
    currentTab = tabName
    
    for _, tb in pairs(tabButtons) do
        tb.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        tb.TextColor3 = Color3.fromRGB(200, 200, 255)
    end
    tabButtons[tabName].BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    tabButtons[tabName].TextColor3 = Color3.fromRGB(255, 255, 255)
    
    if tabName == "📜 Скрипты" then
        createScriptsTab()
    elseif tabName == "🎨 Цвета" then
        createColorsTab()
    elseif tabName == "💀 Читы" then
        createCheatsTab()
    end
end

for tabName, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        switchTab(tabName)
    end)
end

-- ===== КНОПКА ЗАКРЫТИЯ =====
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 3)
close.Text = "✕"
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.BackgroundTransparency = 1
close.Parent = frame
close.MouseButton1Click:Connect(function()
    screen:Destroy()
end)

-- ===== ЗАПУСК =====
switchTab("📜 Скрипты")
print("✅ LUNAR ULTIMATE v3.0 ЗАГРУЖЕН!")
print("📜 Вкладки: Скрипты | Цвета | Читы")
print("💀 Читы: ESP, X-Ray, Fly (WASD+Space+Shift), NoClip")
