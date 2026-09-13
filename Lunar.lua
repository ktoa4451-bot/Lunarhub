--// NEUTRALIZATION HUB
--// PART 1 — UI + COMBAT
--// Для собственной/тестовой версии игры

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local Config = {
    AimAssist = false,
    AimPlayers = true,
    AimNPC = false,
    VisibleOnly = true,

    AimFOV = true,
    FOV = 150,

    TargetPart = "Head"
}

local Colors = {
    Menu = Color3.fromRGB(170, 25, 25),
    Background = Color3.fromRGB(18, 18, 18),
    Panel = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(235, 235, 235),
    SubText = Color3.fromRGB(145, 145, 145)
}

--==================================================
-- REMOVE OLD MENU
--==================================================

pcall(function()
    local old = game:GetService("CoreGui"):FindFirstChild("NeutralizationHub")
    if old then
        old:Destroy()
    end
end)

--==================================================
-- HELPERS
--==================================================

local function New(class, properties, parent)
    local object = Instance.new(class)

    for property, value in pairs(properties or {}) do
        object[property] = value
    end

    object.Parent = parent
    return object
end

local function Tween(object, properties, time)
    return TweenService:Create(
        object,
        TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        properties
    )
end

--==================================================
-- GUI
--==================================================

local Gui = New("ScreenGui", {
    Name = "NeutralizationHub",
    ResetOnSpawn = false,
    IgnoreGuiInset = true
}, game:GetService("CoreGui"))

local Main = New("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(520, 320),
    Position = UDim2.new(0.5, -260, 0.5, -160),
    BackgroundColor3 = Colors.Background,
    BorderSizePixel = 0
}, Gui)

New("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Main)

New("UIStroke", {
    Color = Color3.fromRGB(55, 55, 55),
    Thickness = 1
}, Main)

--==================================================
-- TOP BAR
--==================================================

local Top = New("Frame", {
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundColor3 = Color3.fromRGB(22, 22, 22),
    BorderSizePixel = 0
}, Main)

New("UICorner", {
    CornerRadius = UDim.new(0, 8)
}, Top)

local Title = New("TextLabel", {
    Size = UDim2.new(1, -110, 1, 0),
    Position = UDim2.fromOffset(18, 0),
    BackgroundTransparency = 1,
    Text = "NEUTRALIZATION HUB",
    TextColor3 = Colors.Text,
    TextSize = 17,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, Top)

local Version = New("TextLabel", {
    Size = UDim2.fromOffset(80, 48),
    Position = UDim2.new(1, -135, 0, 0),
    BackgroundTransparency = 1,
    Text = "v1.0",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham
}, Top)

local Minimize = New("TextButton", {
    Size = UDim2.fromOffset(38, 38),
    Position = UDim2.new(1, -48, 0, 5),
    BackgroundColor3 = Color3.fromRGB(35, 35, 35),
    Text = "—",
    TextColor3 = Colors.Text,
    TextSize = 18,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false
}, Top)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, Minimize)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = New("Frame", {
    Size = UDim2.fromOffset(145, 260),
    Position = UDim2.fromOffset(10, 55),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0
}, Main)

New("UICorner", {
    CornerRadius = UDim.new(0, 7)
}, Sidebar)

local SidebarLayout = New("UIListLayout", {
    Padding = UDim.new(0, 5),
    SortOrder = Enum.SortOrder.LayoutOrder
}, Sidebar)

New("UIPadding", {
    PaddingTop = UDim.new(0, 8),
    PaddingLeft = UDim.new(0, 8),
    PaddingRight = UDim.new(0, 8)
}, Sidebar)

--==================================================
-- CONTENT
--==================================================

local Content = New("Frame", {
    Size = UDim2.new(1, -170, 1, -65),
    Position = UDim2.fromOffset(160, 55),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0
}, Main)

New("UICorner", {
    CornerRadius = UDim.new(0, 7)
}, Content)

--==================================================
-- PAGE SYSTEM
--==================================================

local Pages = {}

local function CreatePage(name)
    local page = New("ScrollingFrame", {
        Name = name,
        Size = UDim2.new(1, -16, 1, -16),
        Position = UDim2.fromOffset(8, 8),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Visible = false
    }, Content)

    New("UIListLayout", {
        Padding = UDim.new(0, 7),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, page)

    New("UIPadding", {
        PaddingTop = UDim.new(0, 4),
        PaddingBottom = UDim.new(0, 8)
    }, page)

    Pages[name] = page
    return page
end

local CombatPage = CreatePage("Combat")
local VisualPage = CreatePage("Visuals")
local MovementPage = CreatePage("Movement")
local MiscPage = CreatePage("Misc")
local SettingsPage = CreatePage("Settings")

--==================================================
-- SIDEBAR BUTTON
--==================================================

local CurrentPage

local function CreateCategory(text, page)
    local button = New("TextButton", {
        Size = UDim2.new(1, 0, 0, 37),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        Text = text,
        TextColor3 = Colors.SubText,
        TextSize = 13,
        Font = Enum.Font.GothamSemibold,
        AutoButtonColor = false
    }, Sidebar)

    New("UICorner", {
        CornerRadius = UDim.new(0, 6)
    }, button)

    button.MouseEnter:Connect(function()
        Tween(button, {
            BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        }, 0.15):Play()
    end)

    button.MouseLeave:Connect(function()
        if CurrentPage ~= page then
            Tween(button, {
                BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            }, 0.15):Play()
        end
    end)

    button.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do
            p.Visible = false
        end

        page.Visible = true
        CurrentPage = page

        for _, child in ipairs(Sidebar:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                child.TextColor3 = Colors.SubText
            end
        end

        button.BackgroundColor3 = Colors.Menu
        button.TextColor3 = Colors.Text
    end)

    return button
end

CreateCategory("Combat", CombatPage)
CreateCategory("Visuals", VisualPage)
CreateCategory("Movement", MovementPage)
CreateCategory("Misc", MiscPage)
CreateCategory("Settings", SettingsPage)

--==================================================
-- TOGGLE
--==================================================

local function CreateToggle(parent, text, default, callback)
    local state = default

    local holder = New("Frame", {
        Size = UDim2.new(1, -8, 0, 42),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0
    }, parent)

    New("UICorner", {
        CornerRadius = UDim.new(0, 6)
    }, holder)

    local label = New("TextLabel", {
        Size = UDim2.new(1, -65, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Colors.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    }, holder)

    local toggle = New("TextButton", {
        Size = UDim2.fromOffset(42, 22),
        Position = UDim2.new(1, -53, 0.5, -11),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Text = "",
        AutoButtonColor = false
    }, holder)

    New("UICorner", {
        CornerRadius = UDim.new(1, 0)
    }, toggle)

    local dot = New("Frame", {
        Size = UDim2.fromOffset(16, 16),
        Position = UDim2.fromOffset(3, 3),
        BackgroundColor3 = Color3.fromRGB(180, 180, 180),
        BorderSizePixel = 0
    }, toggle)

    New("UICorner", {
        CornerRadius = UDim.new(1, 0)
    }, dot)

    local function Update()
        if state then
            Tween(toggle, {
                BackgroundColor3 = Colors.Menu
            }, 0.15):Play()

            Tween(dot, {
                Position = UDim2.fromOffset(23, 3)
            }, 0.15):Play()
        else
            Tween(toggle, {
                BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            }, 0.15):Play()

            Tween(dot, {
                Position = UDim2.fromOffset(3, 3)
            }, 0.15):Play()
        end

        if callback then
            callback(state)
        end
    end

    toggle.MouseButton1Click:Connect(function()
        state = not state
        Update()
    end)

    Update()

    return {
        Set = function(value)
            state = value
            Update()
        end,

        Get = function()
            return state
        end
    }
end

--==================================================
-- VALUE BOX
--==================================================

local function CreateValue(parent, text, default, callback)
    local holder = New("Frame", {
        Size = UDim2.new(1, -8, 0, 42),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0
    }, parent)

    New("UICorner", {
        CornerRadius = UDim.new(0, 6)
    }, holder)

    New("TextLabel", {
        Size = UDim2.new(1, -100, 1, 0),
        Position = UDim2.fromOffset(12, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Colors.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    }, holder)

    local box = New("TextBox", {
        Size = UDim2.fromOffset(75, 26),
        Position = UDim2.new(1, -87, 0.5, -13),
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        Text = tostring(default),
        TextColor3 = Colors.Text,
        PlaceholderColor3 = Colors.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        ClearTextOnFocus = false
    }, holder)

    New("UICorner", {
        CornerRadius = UDim.new(0, 5)
    }, box)

    box.FocusLost:Connect(function()
        local value = tonumber(box.Text)

        if value then
            callback(value)
        else
            box.Text = tostring(default)
        end
    end)

    return box
end

--==================================================
-- TARGET PART
--==================================================

local function CreateTargetSelector(parent)
    local holder = New("Frame", {
        Size = UDim2.new(1, -8, 0, 70),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0
    }, parent)

    New("UICorner", {
        CornerRadius = UDim.new(0, 6)
    }, holder)

    New("TextLabel", {
        Size = UDim2.new(1, -20, 0, 28),
        Position = UDim2.fromOffset(12, 4),
        BackgroundTransparency = 1,
        Text = "Target Part",
        TextColor3 = Colors.Text,
        TextSize = 13,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left
    }, holder)

    local parts = {
        "Head",
        "Torso",
        "Random"
    }

    for i, part in ipairs(parts) do
        local button = New("TextButton", {
            Size = UDim2.fromOffset(78, 27),
            Position = UDim2.fromOffset(10 + ((i - 1) * 84), 36),
            BackgroundColor3 = part == Config.TargetPart
                and Colors.Menu
                or Color3.fromRGB(45, 45, 45),
            Text = part,
            TextColor3 = Colors.Text,
            TextSize = 11,
            Font = Enum.Font.GothamSemibold,
            AutoButtonColor = false
        }, holder)

        New("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }, button)

        button.MouseButton1Click:Connect(function()
            Config.TargetPart = part

            for _, child in ipairs(holder:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                end
            end

            button.BackgroundColor3 = Colors.Menu
        end)
    end
end

--==================================================
-- COMBAT PAGE
--==================================================

CreateToggle(CombatPage, "Aim Assist", Config.AimAssist, function(value)
    Config.AimAssist = value
end)

CreateToggle(CombatPage, "Players", Config.AimPlayers, function(value)
    Config.AimPlayers = value
end)

CreateToggle(CombatPage, "NPC", Config.AimNPC, function(value)
    Config.AimNPC = value
end)

CreateToggle(CombatPage, "Visible Only", Config.VisibleOnly, function(value)
    Config.VisibleOnly = value
end)

CreateToggle(CombatPage, "Aim FOV", Config.AimFOV, function(value)
    Config.AimFOV = value
end)

CreateValue(CombatPage, "FOV", Config.FOV, function(value)
    Config.FOV = math.clamp(value, 20, 1000)
end)

CreateTargetSelector(CombatPage)

--==================================================
-- FOV VISUAL
--==================================================

local FOVCircle = New("Frame", {
    Name = "FOVCircle",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(Config.FOV * 2, Config.FOV * 2),
    BackgroundTransparency = 1,
    Visible = Config.AimFOV
}, Gui)

New("UICorner", {
    CornerRadius = UDim.new(1, 0)
}, FOVCircle)

local FOVStroke = New("UIStroke", {
    Color = Colors.Menu,
    Thickness = 1.5,
    Transparency = 0.15
}, FOVCircle)

--==================================================
-- FOV UPDATE
--==================================================

task.spawn(function()
    while Gui.Parent do
        task.wait()

        FOVCircle.Visible = Config.AimFOV
        FOVCircle.Size = UDim2.fromOffset(
            Config.FOV * 2,
            Config.FOV * 2
        )

        FOVStroke.Color = Colors.Menu
    end
end)

--==================================================
-- DRAG
--==================================================

local dragging = false
local dragStart
local startPosition

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not dragging then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

--==================================================
-- MINIMIZE
--==================================================

local Floating = New("TextButton", {
    Name = "NeutralizationLogo",
    Size = UDim2.fromOffset(50, 50),
    Position = UDim2.new(0, 20, 0.5, -25),
    BackgroundColor3 = Colors.Menu,
    Text = "NH",
    TextColor3 = Colors.Text,
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    Visible = false,
    AutoButtonColor = false
}, Gui)

New("UICorner", {
    CornerRadius = UDim.new(1, 0)
}, Floating)

Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    Floating.Visible = true
end)

Floating.MouseButton1Click:Connect(function()
    Floating.Visible = false
    Main.Visible = true
end)

--==================================================
-- OPEN COMBAT
--==================================================

CombatPage.Visible = true
CurrentPage = CombatPage

for _, child in ipairs(Sidebar:GetChildren()) do
    if child:IsA("TextButton") and child.Text == "Combat" then
        child.BackgroundColor3 = Colors.Menu
        child.TextColor3 = Colors.Text
    end
end

--==================================================
-- OPEN ANIMATION
--==================================================

Main.Size = UDim2.fromOffset(0, 0)

Tween(Main, {
    Size = UDim2.fromOffset(520, 320)
}, 0.35):Play()

print("[Neutralization Hub] Part 1 loaded.")

--==================================================
-- NEUTRALIZATION HUB
-- PART 2 — VISUALS + MOVEMENT + MISC + SETTINGS
--==================================================

local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

--==================================================
-- EXTRA CONFIG
--==================================================

Config.ESP = false
Config.BoxESP = false
Config.Names = false
Config.Health = false
Config.Distance = false
Config.Snapline = false
Config.ChestESP = false

Config.Speed = false
Config.SpeedValue = 16

Config.Jump = false
Config.JumpPower = 50

Config.Noclip = false
Config.FOVChanger = false
Config.GameFOV = 70

Config.Fullbright = false
Config.MenuAnimations = true

local ESPColor = Color3.fromRGB(255, 60, 60)

--==================================================
-- VISUALS PAGE
--==================================================

CreateToggle(VisualPage, "Players ESP", Config.ESP, function(value)
    Config.ESP = value
end)

CreateToggle(VisualPage, "Box ESP", Config.BoxESP, function(value)
    Config.BoxESP = value
end)

CreateToggle(VisualPage, "Names", Config.Names, function(value)
    Config.Names = value
end)

CreateToggle(VisualPage, "Health", Config.Health, function(value)
    Config.Health = value
end)

CreateToggle(VisualPage, "Distance", Config.Distance, function(value)
    Config.Distance = value
end)

CreateToggle(VisualPage, "Snapline", Config.Snapline, function(value)
    Config.Snapline = value
end)

CreateToggle(VisualPage, "Chest ESP", Config.ChestESP, function(value)
    Config.ChestESP = value
end)

--==================================================
-- MOVEMENT PAGE
--==================================================

CreateToggle(MovementPage, "Speed", Config.Speed, function(value)
    Config.Speed = value
end)

CreateValue(MovementPage, "Speed Value", Config.SpeedValue, function(value)
    Config.SpeedValue = math.clamp(value, 1, 100)
end)

CreateToggle(MovementPage, "Jump", Config.Jump, function(value)
    Config.Jump = value
end)

CreateValue(MovementPage, "JumpPower", Config.JumpPower, function(value)
    Config.JumpPower = math.clamp(value, 0, 1000)
end)

CreateToggle(MovementPage, "Noclip", Config.Noclip, function(value)
    Config.Noclip = value
end)

CreateToggle(MovementPage, "FOV Changer", Config.FOVChanger, function(value)
    Config.FOVChanger = value
end)

CreateValue(MovementPage, "Game FOV", Config.GameFOV, function(value)
    Config.GameFOV = math.clamp(value, 40, 120)
end)

--==================================================
-- MISC PAGE
--==================================================

CreateToggle(MiscPage, "Fullbright", Config.Fullbright, function(value)
    Config.Fullbright = value
end)

CreateToggle(MiscPage, "Menu Animations", Config.MenuAnimations, function(value)
    Config.MenuAnimations = value
end)

--==================================================
-- SETTINGS PAGE
--==================================================

local SettingsInfo = New("TextLabel", {
    Size = UDim2.new(1, -8, 0, 60),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0,
    Text = "NEUTRALIZATION HUB\nConfiguration",
    TextColor3 = Colors.Text,
    TextSize = 15,
    Font = Enum.Font.GothamBold,
    TextWrapped = true
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, SettingsInfo)

CreateToggle(SettingsPage, "Menu Animations", Config.MenuAnimations, function(value)
    Config.MenuAnimations = value
end)

--==================================================
-- CHARACTER HELPERS
--==================================================

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHumanoid()
    local character = GetCharacter()

    if not character then
        return nil
    end

    return character:FindFirstChildOfClass("Humanoid")
end

local function GetRoot()
    local character = GetCharacter()

    if not character then
        return nil
    end

    return character:FindFirstChild("HumanoidRootPart")
end

--==================================================
-- ORIGINAL VALUES
--==================================================

local OriginalWalkSpeed = 16
local OriginalJumpPower = 50
local OriginalFOV = 70

do
    local humanoid = GetHumanoid()

    if humanoid then
        OriginalWalkSpeed = humanoid.WalkSpeed

        if humanoid.UseJumpPower then
            OriginalJumpPower = humanoid.JumpPower
        end
    end

    local camera = workspace.CurrentCamera

    if camera then
        OriginalFOV = camera.FieldOfView
        Config.GameFOV = OriginalFOV
    end
end

--==================================================
-- SPEED
--==================================================

local function UpdateSpeed()
    local humanoid = GetHumanoid()

    if not humanoid then
        return
    end

    if Config.Speed then
        humanoid.WalkSpeed = Config.SpeedValue
    else
        humanoid.WalkSpeed = OriginalWalkSpeed
    end
end

--==================================================
-- JUMP
--==================================================

local function UpdateJump()
    local humanoid = GetHumanoid()

    if not humanoid then
        return
    end

    humanoid.UseJumpPower = true

    if Config.Jump then
        humanoid.JumpPower = Config.JumpPower
    else
        humanoid.JumpPower = OriginalJumpPower
    end
end

--==================================================
-- NOCLIP
--==================================================

local function UpdateNoclip()
    local character = GetCharacter()

    if not character then
        return
    end

    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            if Config.Noclip then
                object.CanCollide = false
            end
        end
    end
end

--==================================================
-- FOV
--==================================================

local function UpdateGameFOV()
    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    if Config.FOVChanger then
        camera.FieldOfView = Config.GameFOV
    else
        camera.FieldOfView = OriginalFOV
    end
end

--==================================================
-- FULLBRIGHT
--==================================================

local OriginalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

local function UpdateFullbright()
    if Config.Fullbright then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = OriginalLighting.Brightness
        Lighting.ClockTime = OriginalLighting.ClockTime
        Lighting.FogEnd = OriginalLighting.FogEnd
        Lighting.GlobalShadows = OriginalLighting.GlobalShadows
        Lighting.Ambient = OriginalLighting.Ambient
        Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
    end
end

--==================================================
-- CHARACTER RESPAWN
--==================================================

LocalPlayer.CharacterAdded:Connect(function(character)

    character:WaitForChild("Humanoid")

    task.wait(0.5)

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        OriginalWalkSpeed = humanoid.WalkSpeed

        if humanoid.UseJumpPower then
            OriginalJumpPower = humanoid.JumpPower
        end
    end

    UpdateSpeed()
    UpdateJump()
end)

--==================================================
-- MOVEMENT LOOP
--==================================================

RunService.Heartbeat:Connect(function()

    if Config.Speed then
        UpdateSpeed()
    end

    if Config.Jump then
        UpdateJump()
    end

    if Config.Noclip then
        UpdateNoclip()
    end

end)

--==================================================
-- FOV / FULLBRIGHT LOOP
--==================================================

RunService.RenderStepped:Connect(function()

    UpdateGameFOV()

    if Config.Fullbright then
        UpdateFullbright()
    end

end)

--==================================================
-- SIMPLE ESP
--==================================================

local ESPFolder = New("Folder", {
    Name = "NeutralizationESP"
}, Gui)

local ESPObjects = {}

local function RemoveESP(player)
    local data = ESPObjects[player]

    if data then
        if data.Highlight then
            data.Highlight:Destroy()
        end

        if data.Billboard then
            data.Billboard:Destroy()
        end

        ESPObjects[player] = nil
    end
end

local function CreateESP(player)

    if player == LocalPlayer then
        return
    end

    if ESPObjects[player] then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    local highlight = Instance.new("Highlight")

    highlight.Name = "NeutralizationHighlight"
    highlight.FillColor = ESPColor
    highlight.OutlineColor = ESPColor
    highlight.FillTransparency = 0.75
    highlight.OutlineTransparency = 0

    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = Config.ESP

    highlight.Adornee = character
    highlight.Parent = ESPFolder

    local billboard = Instance.new("BillboardGui")

    billboard.Name = "NeutralizationInfo"
    billboard.Size = UDim2.fromOffset(150, 45)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = Config.Names or Config.Health or Config.Distance
    billboard.Adornee = root
    billboard.Parent = ESPFolder

    local label = Instance.new("TextLabel")

    label.Size = UDim2.fromScale(1, 1)
    label.BackgroundTransparency = 1
    label.TextColor3 = ESPColor
    label.TextStrokeTransparency = 0.2
    label.TextSize = 12
    label.Font = Enum.Font.GothamBold
    label.TextWrapped = true

    label.Parent = billboard

    ESPObjects[player] = {
        Highlight = highlight,
        Billboard = billboard,
        Label = label
    }
end

local function UpdateESP(player)

    local data = ESPObjects[player]

    if not data then
        return
    end

    local character = player.Character

    if not character then
        RemoveESP(player)
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    data.Highlight.Enabled = Config.ESP

    local text = ""

    if Config.Names then
        text = player.DisplayName
    end

    if Config.Health then
        if text ~= "" then
            text = text .. "\n"
        end

        text = text .. "HP: " .. math.floor(humanoid.Health)
    end

    if Config.Distance then
        local myRoot = GetRoot()

        if myRoot then
            local distance = (myRoot.Position - root.Position).Magnitude

            if text ~= "" then
                text = text .. "\n"
            end

            text = text .. math.floor(distance) .. " studs"
        end
    end

    data.Label.Text = text

    data.Billboard.Enabled =
        Config.Names
        or Config.Health
        or Config.Distance
end

--==================================================
-- ESP LOOP
--==================================================

RunService.RenderStepped:Connect(function()

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer then

            if Config.ESP
            or Config.Names
            or Config.Health
            or Config.Distance then

                if not ESPObjects[player] then
                    CreateESP(player)
                end

                UpdateESP(player)

            else

                if ESPObjects[player] then
                    RemoveESP(player)
                end

            end

        end

    end

end)

Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)

--==================================================
-- FINAL INITIALIZATION
--==================================================

UpdateSpeed()
UpdateJump()
UpdateGameFOV()
UpdateFullbright()

print("===================================")
print(" Neutralization Hub")
print(" Part 1 + Part 2 loaded")
print("===================================")
