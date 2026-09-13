--==================================================
-- NEUTRALIZATION HUB v4.6
-- CLEAN UI REBUILD
-- PART 1/4
--==================================================

--==================================================
-- SERVICES
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local Config = {
    Version = "v4.6",
    Creator = "By: Lunar Hub",

    -- Combat
    AimAssist = false,
    VisibleOnly = false,
    AimFOV = false,
    FOVSize = 250,
    Smoothness = 0.15,
    TargetPart = "Head",

    -- Visuals
    ESP = false,
    ModelESP = false,
    SquareBox = false,
    TeamColors = true,
    Names = false,
    Health = false,
    Distance = false,

    -- Movement
    Speed = false,
    SpeedValue = 16,
    Jump = false,
    JumpPower = 50,
    Noclip = false
}

--==================================================
-- COLORS
--==================================================

local Colors = {
    Background = Color3.fromRGB(12, 12, 14),
    Panel = Color3.fromRGB(17, 17, 20),
    Card = Color3.fromRGB(23, 23, 27),
    CardHover = Color3.fromRGB(31, 31, 36),

    Menu = Color3.fromRGB(190, 25, 25),
    MenuDark = Color3.fromRGB(130, 20, 20),

    Text = Color3.fromRGB(245, 245, 247),
    SubText = Color3.fromRGB(155, 155, 162),
    Muted = Color3.fromRGB(105, 105, 112),

    Border = Color3.fromRGB(55, 55, 62),

    On = Color3.fromRGB(190, 25, 25),
    Off = Color3.fromRGB(48, 48, 55),

    Ally = Color3.fromRGB(75, 145, 255),
    Enemy = Color3.fromRGB(255, 65, 65)
}

--==================================================
-- DESTROY OLD GUI
--==================================================

pcall(function()
    local old1 = CoreGui:FindFirstChild("NeutralizationHub")

    if old1 then
        old1:Destroy()
    end

    local old2 = CoreGui:FindFirstChild("LunarHub")

    if old2 then
        old2:Destroy()
    end
end)

--==================================================
-- HELPERS
--==================================================

local function New(className, properties, parent)
    local object = Instance.new(className)

    for property, value in pairs(properties or {}) do
        pcall(function()
            object[property] = value
        end)
    end

    if parent then
        object.Parent = parent
    end

    return object
end

local function Corner(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 10)
    corner.Parent = object
    return corner
end

local function Stroke(object, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")

    stroke.Color = color or Colors.Border
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0

    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = object

    return stroke
end

local function Tween(object, info, properties)
    local tween = TweenService:Create(
        object,
        info,
        properties
    )

    tween:Play()

    return tween
end

local function FastTween(object, properties, duration)
    return Tween(
        object,
        TweenInfo.new(
            duration or 0.2,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        properties
    )
end

--==================================================
-- SCREEN GUI
--==================================================

local ScreenGui = New("ScreenGui", {
    Name = "NeutralizationHub",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
})

pcall(function()
    ScreenGui.Parent = CoreGui
end)

if not ScreenGui.Parent then
    ScreenGui.Parent =
        LocalPlayer:WaitForChild("PlayerGui")
end

--==================================================
-- MAIN
--==================================================

local Main = New("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(570, 365),
    Position = UDim2.new(
        0.5,
        -285,
        0.5,
        -182
    ),
    BackgroundColor3 = Colors.Background,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 10
}, ScreenGui)

Corner(Main, 20)
Stroke(Main, Colors.Menu, 1.5, 0.15)

local MainScale = New("UIScale", {
    Scale = 0.78
}, Main)

--==================================================
-- ANIMATED BACKGROUND
--==================================================

local Background = New("Frame", {
    Name = "AnimatedBackground",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Colors.Background,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 10
}, Main)

Corner(Background, 20)

local Glow1 = New("Frame", {
    Size = UDim2.fromOffset(260, 260),
    Position = UDim2.fromOffset(-120, -130),
    BackgroundColor3 = Colors.MenuDark,
    BackgroundTransparency = 0.72,
    BorderSizePixel = 0,
    ZIndex = 11
}, Background)

Corner(Glow1, 999)

local Glow2 = New("Frame", {
    Size = UDim2.fromOffset(240, 240),
    Position = UDim2.new(1, -100, 1, -90),
    BackgroundColor3 = Colors.Menu,
    BackgroundTransparency = 0.84,
    BorderSizePixel = 0,
    ZIndex = 11
}, Background)

Corner(Glow2, 999)

local Glow3 = New("Frame", {
    Size = UDim2.fromOffset(150, 150),
    Position = UDim2.new(0.55, 0, -70, 0),
    BackgroundColor3 = Colors.Menu,
    BackgroundTransparency = 0.90,
    BorderSizePixel = 0,
    ZIndex = 11
}, Background)

Corner(Glow3, 999)

task.spawn(function()
    while Main.Parent do

        FastTween(
            Glow1,
            {
                Position = UDim2.fromOffset(
                    -45,
                    -75
                ),
                BackgroundTransparency = 0.80
            },
            2.5
        )

        FastTween(
            Glow2,
            {
                Position = UDim2.new(
                    1,
                    -165,
                    1,
                    -155
                ),
                BackgroundTransparency = 0.90
            },
            2.5
        )

        FastTween(
            Glow3,
            {
                Position = UDim2.new(
                    0.35,
                    0,
                    0,
                    35
                ),
                BackgroundTransparency = 0.84
            },
            2.5
        )

        task.wait(2.5)

        FastTween(
            Glow1,
            {
                Position = UDim2.fromOffset(
                    -120,
                    -130
                ),
                BackgroundTransparency = 0.72
            },
            2.5
        )

        FastTween(
            Glow2,
            {
                Position = UDim2.new(
                    1,
                    -100,
                    1,
                    -90
                ),
                BackgroundTransparency = 0.84
            },
            2.5
        )

        FastTween(
            Glow3,
            {
                Position = UDim2.new(
                    0.55,
                    0,
                    -70,
                    0
                ),
                BackgroundTransparency = 0.90
            },
            2.5
        )

        task.wait(2.5)
    end
end)

--==================================================
-- TOP BAR
--==================================================

local TopBar = New("Frame", {
    Name = "TopBar",
    Size = UDim2.new(1, -20, 0, 64),
    Position = UDim2.fromOffset(10, 10),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 20
}, Main)

--==================================================
-- LOGO
--==================================================

local Logo = New("Frame", {
    Size = UDim2.fromOffset(50, 50),
    Position = UDim2.fromOffset(4, 4),
    BackgroundColor3 = Colors.Menu,
    BorderSizePixel = 0,
    ZIndex = 21
}, TopBar)

Corner(Logo, 16)
Stroke(Logo, Colors.Menu, 1, 0.1)

local LogoText = New("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = Colors.Text,
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    ZIndex = 22
}, Logo)

--==================================================
-- TITLE
--==================================================

local Title = New("TextLabel", {
    Size = UDim2.new(1, -190, 0, 27),
    Position = UDim2.fromOffset(66, 4),
    BackgroundTransparency = 1,
    Text = "NEUTRALIZATION HUB",
    TextColor3 = Colors.Text,
    TextSize = 18,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 21
}, TopBar)

local Version = New("TextLabel", {
    Size = UDim2.new(1, -190, 0, 18),
    Position = UDim2.fromOffset(67, 32),
    BackgroundTransparency = 1,
    Text = Config.Version,
    TextColor3 = Colors.Menu,
    TextSize = 11,
    Font = Enum.Font.GothamSemibold,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 21
}, TopBar)

--==================================================
-- MINIMIZE BUTTON
--==================================================

local MinimizeButton = New("TextButton", {
    Size = UDim2.fromOffset(42, 42),
    Position = UDim2.new(1, -94, 0, 8),
    BackgroundColor3 = Colors.Card,
    BorderSizePixel = 0,
    Text = "—",
    TextColor3 = Colors.Text,
    TextSize = 22,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false,
    ZIndex = 25
}, TopBar)

Corner(MinimizeButton, 13)
Stroke(MinimizeButton, Colors.Border, 1, 0.15)

--==================================================
-- CLOSE BUTTON
--==================================================

local CloseButton = New("TextButton", {
    Size = UDim2.fromOffset(42, 42),
    Position = UDim2.new(1, -46, 0, 8),
    BackgroundColor3 = Colors.Card,
    BorderSizePixel = 0,
    Text = "×",
    TextColor3 = Colors.Text,
    TextSize = 21,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false,
    ZIndex = 25
}, TopBar)

Corner(CloseButton, 13)
Stroke(CloseButton, Colors.Border, 1, 0.15)

--==================================================
-- BUTTON HOVER
--==================================================

local function ButtonHover(button, normal, hover)
    button.MouseEnter:Connect(function()
        FastTween(
            button,
            {
                BackgroundColor3 = hover,
                Size = UDim2.fromOffset(
                    button.Size.X.Offset + 2,
                    button.Size.Y.Offset + 2
                )
            },
            0.16
        )
    end)

    button.MouseLeave:Connect(function()
        FastTween(
            button,
            {
                BackgroundColor3 = normal,
                Size = UDim2.fromOffset(
                    button.Size.X.Offset - 2,
                    button.Size.Y.Offset - 2
                )
            },
            0.16
        )
    end)
end

ButtonHover(
    MinimizeButton,
    Colors.Card,
    Colors.CardHover
)

ButtonHover(
    CloseButton,
    Colors.Card,
    Color3.fromRGB(70, 25, 25)
)

--==================================================
-- BODY
--==================================================

local Body = New("Frame", {
    Name = "Body",
    Size = UDim2.new(1, -20, 1, -88),
    Position = UDim2.fromOffset(10, 78),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 20
}, Main)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = New("Frame", {
    Name = "Sidebar",
    Size = UDim2.new(0, 165, 1, 0),
    Position = UDim2.fromOffset(0, 0),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0,
    ZIndex = 21
}, Body)

Corner(Sidebar, 16)
Stroke(Sidebar, Colors.Border, 1, 0.35)

local SidebarTitle = New("TextLabel", {
    Size = UDim2.new(1, -24, 0, 25),
    Position = UDim2.fromOffset(12, 10),
    BackgroundTransparency = 1,
    Text = "CATEGORIES",
    TextColor3 = Colors.Muted,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 22
}, Sidebar)

local CategoryHolder = New("Frame", {
    Size = UDim2.new(1, -16, 1, -48),
    Position = UDim2.fromOffset(8, 40),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 22
}, Sidebar)

New("UIListLayout", {
    Padding = UDim.new(0, 8),
    SortOrder = Enum.SortOrder.LayoutOrder
}, CategoryHolder)

--==================================================
-- CONTENT
--==================================================

local Content = New("Frame", {
    Name = "Content",
    Size = UDim2.new(1, -175, 1, 0),
    Position = UDim2.fromOffset(175, 0),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 21
}, Body)

Corner(Content, 16)
Stroke(Content, Colors.Border, 1, 0.35)

--==================================================
-- PAGE HEADER
--==================================================

local PageHeader = New("Frame", {
    Size = UDim2.new(1, -28, 0, 58),
    Position = UDim2.fromOffset(14, 12),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 23
}, Content)

local PageTitle = New("TextLabel", {
    Size = UDim2.new(1, -10, 0, 28),
    Position = UDim2.fromOffset(2, 0),
    BackgroundTransparency = 1,
    Text = "Combat",
    TextColor3 = Colors.Text,
    TextSize = 20,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 24
}, PageHeader)

local PageDescription = New("TextLabel", {
    Size = UDim2.new(1, -10, 0, 20),
    Position = UDim2.fromOffset(2, 31),
    BackgroundTransparency = 1,
    Text = "Aim and combat functions",
    TextColor3 = Colors.SubText,
    TextSize = 11,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 24
}, PageHeader)

--==================================================
-- PAGES
--==================================================

local Pages = {}

local function CreatePage(name)
    local page = New("ScrollingFrame", {
        Name = name,
        Size = UDim2.new(1, -28, 1, -80),
        Position = UDim2.fromOffset(14, 72),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors.Menu,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 23
    }, Content)

    Corner(page, 10)

    New("UIPadding", {
        PaddingTop = UDim.new(0, 2),
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 2),
        PaddingRight = UDim.new(0, 5)
    }, page)

    New("UIListLayout", {
        Padding = UDim.new(0, 9),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, page)

    Pages[name] = page

    return page
end

local CombatPage = CreatePage("Combat")
local VisualsPage = CreatePage("Visuals")
local MovementPage = CreatePage("Movement")
local SettingsPage = CreatePage("Settings")

--==================================================
-- CATEGORY BUTTONS
--==================================================

local CategoryButtons = {}

local function CreateCategory(name, order)
    local button = New("TextButton", {
        Name = name .. "Button",
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Colors.Card,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = order,
        ZIndex = 23
    }, CategoryHolder)

    Corner(button, 13)

    local Accent = New("Frame", {
        Size = UDim2.fromOffset(4, 26),
        Position = UDim2.fromOffset(7, 11),
        BackgroundColor3 = Colors.Menu,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 24
    }, button)

    Corner(Accent, 999)

    local Label = New("TextLabel", {
        Size = UDim2.new(1, -28, 1, 0),
        Position = UDim2.fromOffset(20, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = Colors.SubText,
        TextSize = 12,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 24
    }, button)

    CategoryButtons[name] = {
        Button = button,
        Label = Label,
        Accent = Accent
    }

    return button
end

CreateCategory("Combat", 1)
CreateCategory("Visuals", 2)
CreateCategory("Movement", 3)
CreateCategory("Settings", 4)

--==================================================
-- PAGE DATA
--==================================================

local PageDescriptions = {
    Combat = "Aim and combat functions",
    Visuals = "ESP and visual settings",
    Movement = "Movement and player settings",
    Settings = "Hub information and configuration"
}

local CurrentPage = nil

--==================================================
-- CATEGORY VISUAL
--==================================================

local function SetCategoryVisual(name)
    for category, data in pairs(CategoryButtons) do

        if category == name then
            FastTween(
                data.Button,
                {
                    BackgroundColor3 = Colors.MenuDark,
                    BackgroundTransparency = 0.05
                },
                0.22
            )

            FastTween(
                data.Label,
                {
                    TextColor3 = Colors.Text
                },
                0.18
            )

            FastTween(
                data.Accent,
                {
                    BackgroundTransparency = 0
                },
                0.18
            )

        else
            FastTween(
                data.Button,
                {
                    BackgroundColor3 = Colors.Card,
                    BackgroundTransparency = 1
                },
                0.22
            )

            FastTween(
                data.Label,
                {
                    TextColor3 = Colors.SubText
                },
                0.18
            )

            FastTween(
                data.Accent,
                {
                    BackgroundTransparency = 1
                },
                0.18
            )
        end
    end
end

--==================================================
-- END PART 1/4
--==================================================

--==================================================
-- NEUTRALIZATION HUB v4.6
-- PART 2/4
-- CONTROLS + PAGES + SETTINGS
--==================================================

--==================================================
-- ROW CREATOR
--==================================================

local function CreateRow(parent, title, description, height)
    local row = New("Frame", {
        Size = UDim2.new(1, -2, 0, height or 54),
        BackgroundColor3 = Colors.Card,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 24
    }, parent)

    Corner(row, 12)
    Stroke(row, Colors.Border, 1, 0.65)

    local Title = New("TextLabel", {
        Size = UDim2.new(1, -145, 0, 20),
        Position = UDim2.fromOffset(14, 7),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Colors.Text,
        TextSize = 12,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 25
    }, row)

    local Description = New("TextLabel", {
        Size = UDim2.new(1, -145, 0, 17),
        Position = UDim2.fromOffset(14, 29),
        BackgroundTransparency = 1,
        Text = description or "",
        TextColor3 = Colors.Muted,
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 25
    }, row)

    return row, Title, Description
end

--==================================================
-- TOGGLE
--==================================================

local function CreateToggle(
    parent,
    title,
    description,
    key,
    callback
)
    local row = CreateRow(
        parent,
        title,
        description,
        58
    )

    local ToggleButton = New("TextButton", {
        Size = UDim2.fromOffset(54, 28),
        Position = UDim2.new(1, -68, 0.5, -14),
        BackgroundColor3 = Colors.Off,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        ZIndex = 27
    }, row)

    Corner(ToggleButton, 999)

    local ToggleKnob = New("Frame", {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.fromOffset(4, 4),
        BackgroundColor3 = Color3.fromRGB(220, 220, 225),
        BorderSizePixel = 0,
        ZIndex = 28
    }, ToggleButton)

    Corner(ToggleKnob, 999)

    local enabled = Config[key] == true

    local function Update(value, animate)
        enabled = value
        Config[key] = value

        local knobPosition

        if value then
            knobPosition = UDim2.new(
                1,
                -24,
                0.5,
                -10
            )
        else
            knobPosition = UDim2.fromOffset(
                4,
                4
            )
        end

        if animate then
            FastTween(
                ToggleButton,
                {
                    BackgroundColor3 =
                        value
                        and Colors.On
                        or Colors.Off
                },
                0.18
            )

            Tween(
                ToggleKnob,
                TweenInfo.new(
                    0.22,
                    Enum.EasingStyle.Back,
                    Enum.EasingDirection.Out
                ),
                {
                    Position = knobPosition
                }
            )
        else
            ToggleButton.BackgroundColor3 =
                value
                and Colors.On
                or Colors.Off

            ToggleKnob.Position =
                knobPosition
        end

        if callback then
            callback(value)
        end
    end

    Update(enabled, false)

    ToggleButton.MouseEnter:Connect(function()
        FastTween(
            ToggleButton,
            {
                BackgroundTransparency = 0.08
            },
            0.12
        )
    end)

    ToggleButton.MouseLeave:Connect(function()
        FastTween(
            ToggleButton,
            {
                BackgroundTransparency = 0
            },
            0.12
        )
    end)

    ToggleButton.MouseButton1Click:Connect(function()
        Update(
            not enabled,
            true
        )
    end)

    return row
end

--==================================================
-- NUMBER VALUE
--==================================================

local function FormatNumber(value, step)
    if step < 0.1 then
        return string.format(
            "%.2f",
            value
        )
    elseif step < 1 then
        return string.format(
            "%.1f",
            value
        )
    else
        return tostring(
            math.floor(value + 0.5)
        )
    end
end

local function CreateValue(
    parent,
    title,
    description,
    key,
    minimum,
    maximum,
    step,
    callback
)
    step = step or 1

    local row = CreateRow(
        parent,
        title,
        description,
        64
    )

    local Minus = New("TextButton", {
        Size = UDim2.fromOffset(32, 30),
        Position = UDim2.new(1, -143, 0.5, -15),
        BackgroundColor3 = Colors.CardHover,
        BorderSizePixel = 0,
        Text = "−",
        TextColor3 = Colors.Text,
        TextSize = 17,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
        ZIndex = 27
    }, row)

    Corner(Minus, 10)
    Stroke(Minus, Colors.Border, 1, 0.4)

    local ValueBox = New("TextLabel", {
        Size = UDim2.fromOffset(64, 30),
        Position = UDim2.new(1, -107, 0.5, -15),
        BackgroundColor3 = Colors.Panel,
        BorderSizePixel = 0,
        Text = "",
        TextColor3 = Colors.Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 27
    }, row)

    Corner(ValueBox, 10)
    Stroke(ValueBox, Colors.Border, 1, 0.4)

    local Plus = New("TextButton", {
        Size = UDim2.fromOffset(32, 30),
        Position = UDim2.new(1, -39, 0.5, -15),
        BackgroundColor3 = Colors.CardHover,
        BorderSizePixel = 0,
        Text = "+",
        TextColor3 = Colors.Text,
        TextSize = 17,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
        ZIndex = 27
    }, row)

    Corner(Plus, 10)
    Stroke(Plus, Colors.Border, 1, 0.4)

    local value = tonumber(Config[key])

    if not value then
        value = minimum
    end

    value = math.clamp(
        value,
        minimum,
        maximum
    )

    local function UpdateValue(newValue)
        newValue = math.clamp(
            newValue,
            minimum,
            maximum
        )

        -- Keep the value aligned to the step.
        newValue =
            minimum
            + math.round(
                (newValue - minimum) / step
            ) * step

        newValue = math.clamp(
            newValue,
            minimum,
            maximum
        )

        value = newValue
        Config[key] = newValue

        ValueBox.Text =
            FormatNumber(
                newValue,
                step
            )

        if callback then
            callback(newValue)
        end

        FastTween(
            ValueBox,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.08
        )

        task.delay(0.08, function()
            if ValueBox.Parent then
                FastTween(
                    ValueBox,
                    {
                        BackgroundColor3 =
                            Colors.Panel
                    },
                    0.14
                )
            end
        end)
    end

    UpdateValue(value)

    Minus.MouseButton1Click:Connect(function()
        UpdateValue(
            value - step
        )
    end)

    Plus.MouseButton1Click:Connect(function()
        UpdateValue(
            value + step
        )
    end)

    Minus.MouseEnter:Connect(function()
        FastTween(
            Minus,
            {
                BackgroundColor3 =
                    Colors.MenuDark
            },
            0.12
        )
    end)

    Minus.MouseLeave:Connect(function()
        FastTween(
            Minus,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.12
        )
    end)

    Plus.MouseEnter:Connect(function()
        FastTween(
            Plus,
            {
                BackgroundColor3 =
                    Colors.MenuDark
            },
            0.12
        )
    end)

    Plus.MouseLeave:Connect(function()
        FastTween(
            Plus,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.12
        )
    end)

    return row
end

--==================================================
-- SELECTOR
--==================================================

local function CreateSelector(
    parent,
    title,
    description,
    key,
    options,
    callback
)
    local row = CreateRow(
        parent,
        title,
        description,
        58
    )

    local Selector = New("TextButton", {
        Size = UDim2.fromOffset(125, 32),
        Position = UDim2.new(1, -139, 0.5, -16),
        BackgroundColor3 = Colors.CardHover,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        ZIndex = 27
    }, row)

    Corner(Selector, 10)
    Stroke(Selector, Colors.Border, 1, 0.35)

    local Selected = New("TextLabel", {
        Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.fromOffset(10, 0),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = Colors.Text,
        TextSize = 10,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 28
    }, Selector)

    local Arrow = New("TextLabel", {
        Size = UDim2.fromOffset(25, 32),
        Position = UDim2.new(1, -27, 0, 0),
        BackgroundTransparency = 1,
        Text = "›",
        TextColor3 = Colors.SubText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        ZIndex = 28
    }, Selector)

    local currentIndex = 1

    for index, option in ipairs(options) do
        if option == Config[key] then
            currentIndex = index
            break
        end
    end

    local function UpdateSelector()
        local option = options[currentIndex]

        Config[key] = option
        Selected.Text = option

        if callback then
            callback(option)
        end
    end

    UpdateSelector()

    Selector.MouseEnter:Connect(function()
        FastTween(
            Selector,
            {
                BackgroundColor3 =
                    Colors.MenuDark
            },
            0.14
        )
    end)

    Selector.MouseLeave:Connect(function()
        FastTween(
            Selector,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.14
        )
    end)

    Selector.MouseButton1Click:Connect(function()
        currentIndex += 1

        if currentIndex > #options then
            currentIndex = 1
        end

        Tween(
            Selected,
            TweenInfo.new(
                0.12,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                TextTransparency = 1
            }
        )

        task.delay(0.08, function()
            UpdateSelector()

            Tween(
                Selected,
                TweenInfo.new(
                    0.18,
                    Enum.EasingStyle.Quint,
                    Enum.EasingDirection.Out
                ),
                {
                    TextTransparency = 0
                }
            )
        end)
    end)

    return row
end

--==================================================
-- SECTION
--==================================================

local function CreateSection(
    parent,
    title,
    description
)
    local section = New("Frame", {
        Size = UDim2.new(1, -2, 0, 43),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 25
    }, parent)

    local Title = New("TextLabel", {
        Size = UDim2.new(1, -10, 0, 20),
        Position = UDim2.fromOffset(4, 2),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Colors.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 26
    }, section)

    local Description = New("TextLabel", {
        Size = UDim2.new(1, -10, 0, 17),
        Position = UDim2.fromOffset(4, 22),
        BackgroundTransparency = 1,
        Text = description or "",
        TextColor3 = Colors.Muted,
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 26
    }, section)

    return section
end

--==================================================
-- COMBAT
--==================================================

CreateSection(
    CombatPage,
    "Combat",
    "Aim and targeting functions"
)

CreateToggle(
    CombatPage,
    "Aim Assist",
    "Automatically aims toward the closest enemy",
    "AimAssist"
)

CreateToggle(
    CombatPage,
    "Visible Only",
    "Ignore targets hidden behind objects",
    "VisibleOnly"
)

CreateToggle(
    CombatPage,
    "Aim FOV",
    "Limit targeting to the FOV circle",
    "AimFOV"
)

CreateValue(
    CombatPage,
    "FOV Size",
    "Size of the centered aim FOV",
    "FOVSize",
    25,
    500,
    5
)

CreateValue(
    CombatPage,
    "Smoothness",
    "Camera movement smoothing",
    "Smoothness",
    0.05,
    0.50,
    0.01
)

CreateSelector(
    CombatPage,
    "Target Part",
    "Body part selected by Aim Assist",
    "TargetPart",
    {
        "Head",
        "Body",
        "Random Part"
    }
)

--==================================================
-- VISUALS
--==================================================

CreateSection(
    VisualsPage,
    "Visuals",
    "ESP and player information"
)

CreateToggle(
    VisualsPage,
    "ESP",
    "Enable player ESP",
    "ESP"
)

CreateToggle(
    VisualsPage,
    "Model ESP",
    "Highlight player models",
    "ModelESP"
)

CreateToggle(
    VisualsPage,
    "Square Box",
    "Show a square around players",
    "SquareBox"
)

CreateToggle(
    VisualsPage,
    "Team Colors",
    "Blue allies and red enemies",
    "TeamColors"
)

CreateToggle(
    VisualsPage,
    "Names",
    "Show player names",
    "Names"
)

CreateToggle(
    VisualsPage,
    "Health",
    "Show player health",
    "Health"
)

CreateToggle(
    VisualsPage,
    "Distance",
    "Show distance to players",
    "Distance"
)

--==================================================
-- MOVEMENT
--==================================================

CreateSection(
    MovementPage,
    "Movement",
    "Movement and player controls"
)

CreateToggle(
    MovementPage,
    "Speed",
    "Change player movement speed",
    "Speed"
)

CreateValue(
    MovementPage,
    "Speed Value",
    "Movement speed",
    "SpeedValue",
    16,
    100,
    1
)

CreateToggle(
    MovementPage,
    "Jump",
    "Change jump power",
    "Jump"
)

CreateValue(
    MovementPage,
    "Jump Power",
    "Player jump power",
    "JumpPower",
    50,
    150,
    5
)

CreateToggle(
    MovementPage,
    "Noclip",
    "Walk through physical objects",
    "Noclip"
)

--==================================================
-- SETTINGS
--==================================================

CreateSection(
    SettingsPage,
    "Settings",
    "Neutralization Hub information"
)

local VersionCard = New("TextLabel", {
    Size = UDim2.new(1, -2, 0, 52),
    BackgroundColor3 = Colors.Card,
    BorderSizePixel = 0,
    Text = "Version: " .. Config.Version,
    TextColor3 = Colors.Text,
    TextSize = 11,
    Font = Enum.Font.GothamSemibold,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Center,
    ZIndex = 25
}, SettingsPage)

Corner(VersionCard, 12)
Stroke(VersionCard, Colors.Border, 1, 0.5)

local CreatorCard = New("TextLabel", {
    Size = UDim2.new(1, -2, 0, 52),
    BackgroundColor3 = Colors.Card,
    BorderSizePixel = 0,
    Text = "Creator: " .. Config.Creator,
    TextColor3 = Colors.Text,
    TextSize = 11,
    Font = Enum.Font.GothamSemibold,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Center,
    ZIndex = 25
}, SettingsPage)

Corner(CreatorCard, 12)
Stroke(CreatorCard, Colors.Border, 1, 0.5)

--==================================================
-- TELEGRAM
--==================================================

CreateSection(
    SettingsPage,
    "Telegram",
    "Lunar Hub community"
)

local TelegramButton = New("TextButton", {
    Size = UDim2.new(1, -2, 0, 50),
    BackgroundColor3 = Colors.Menu,
    BorderSizePixel = 0,
    Text = "Telegram  •  @lunarhub_script",
    TextColor3 = Colors.Text,
    TextSize = 11,
    Font = Enum.Font.GothamSemibold,
    AutoButtonColor = false,
    ZIndex = 25
}, SettingsPage)

Corner(TelegramButton, 12)
Stroke(TelegramButton, Colors.Border, 1, 0.2)

TelegramButton.MouseEnter:Connect(function()
    FastTween(
        TelegramButton,
        {
            BackgroundColor3 = Colors.MenuDark
        },
        0.15
    )
end)

TelegramButton.MouseLeave:Connect(function()
    FastTween(
        TelegramButton,
        {
            BackgroundColor3 = Colors.Menu
        },
        0.15
    )
end)

TelegramButton.MouseButton1Click:Connect(function()

    local url =
        "https://t.me/lunarhub_script"

    pcall(function()
        if setclipboard then
            setclipboard(url)
        end
    end)

    TelegramButton.Text =
        "Telegram link copied!"

    task.delay(1.5, function()
        if TelegramButton.Parent then
            TelegramButton.Text =
                "Telegram  •  @lunarhub_script"
        end
    end)
end)

--==================================================
-- STATUS
--==================================================

local StatusCard = New("Frame", {
    Size = UDim2.new(1, -2, 0, 58),
    BackgroundColor3 = Colors.Card,
    BorderSizePixel = 0,
    ZIndex = 25
}, SettingsPage)

Corner(StatusCard, 12)
Stroke(StatusCard, Colors.Border, 1, 0.5)

local StatusDot = New("Frame", {
    Size = UDim2.fromOffset(10, 10),
    Position = UDim2.fromOffset(14, 24),
    BackgroundColor3 = Color3.fromRGB(75, 220, 110),
    BorderSizePixel = 0,
    ZIndex = 27
}, StatusCard)

Corner(StatusDot, 999)

local StatusTitle = New("TextLabel", {
    Size = UDim2.new(1, -45, 0, 20),
    Position = UDim2.fromOffset(32, 8),
    BackgroundTransparency = 1,
    Text = "Status",
    TextColor3 = Colors.Text,
    TextSize = 11,
    Font = Enum.Font.GothamSemibold,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 27
}, StatusCard)

local StatusText = New("TextLabel", {
    Size = UDim2.new(1, -45, 0, 18),
    Position = UDim2.fromOffset(32, 29),
    BackgroundTransparency = 1,
    Text = "Neutralization Hub is running",
    TextColor3 = Colors.SubText,
    TextSize = 9,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 27
}, StatusCard)

--==================================================
-- PAGE SWITCH
--==================================================

local function SwitchPage(name)

    local newPage = Pages[name]

    if not newPage then
        return
    end

    if CurrentPage == name then
        return
    end

    local oldPage =
        CurrentPage
        and Pages[CurrentPage]
        or nil

    CurrentPage = name

    PageTitle.Text = name
    PageDescription.Text =
        PageDescriptions[name]

    SetCategoryVisual(name)

    -- New page enters from the right.
    newPage.Position =
        UDim2.fromOffset(35, 72)

    newPage.Visible = true

    Tween(
        newPage,
        TweenInfo.new(
            0.30,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position =
                UDim2.fromOffset(14, 72)
        }
    )

    if oldPage and oldPage ~= newPage then

        Tween(
            oldPage,
            TweenInfo.new(
                0.20,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.In
            ),
            {
                Position =
                    UDim2.fromOffset(-20, 72)
            }
        )

        task.delay(0.21, function()

            if oldPage.Parent
                and CurrentPage ~= oldPage.Name then

                oldPage.Visible = false

                oldPage.Position =
                    UDim2.fromOffset(14, 72)
            end

        end)
    end
end

--==================================================
-- CATEGORY CLICKS
--==================================================

for name, data in pairs(CategoryButtons) do

    data.Button.MouseButton1Click:Connect(function()
        SwitchPage(name)
    end)

end

--==================================================
-- INITIAL PAGE
--==================================================

SwitchPage("Combat")

--==================================================
-- END PART 2/4
--==================================================

--==================================================
-- DRAG / MINIMIZE / CLOSE
--==================================================

local dragging = false
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPos = Main.Position

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

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local delta =
        input.Position - dragStart

    Main.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )

end)

--==================================================
-- FLOATING N BUTTON
--==================================================

local Floating = New("TextButton", {
    Name = "FloatingN",
    Parent = ScreenGui,

    Size = UDim2.fromOffset(52, 52),

    Position = UDim2.new(
        0.5,
        -26,
        0.5,
        -26
    ),

    BackgroundColor3 = Colors.Menu,
    BackgroundTransparency = 0.05,

    Text = "N",
    TextColor3 = Color3.new(1, 1, 1),
    TextSize = 23,
    Font = Enum.Font.GothamBold,

    AutoButtonColor = false,
    Visible = false,

    ZIndex = 100
})

Corner(Floating, 16)
Stroke(Floating, Colors.Border, 1.5)

-- Saved floating position.
local floatingPos = Floating.Position

--==================================================
-- FLOATING BUTTON DRAG
--==================================================

local floatingDragging = false
local floatingDragStart
local floatingStartPos

Floating.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        floatingDragging = true
        floatingDragStart = input.Position
        floatingStartPos = Floating.Position

        input.Changed:Connect(function()

            if input.UserInputState == Enum.UserInputState.End then
                floatingDragging = false
            end

        end)
    end

end)

UserInputService.InputChanged:Connect(function(input)

    if not floatingDragging then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local delta =
        input.Position - floatingDragStart

    Floating.Position = UDim2.new(
        floatingStartPos.X.Scale,
        floatingStartPos.X.Offset + delta.X,
        floatingStartPos.Y.Scale,
        floatingStartPos.Y.Offset + delta.Y
    )

    floatingPos = Floating.Position

end)

--==================================================
-- FLOATING HOVER
--==================================================

Floating.MouseEnter:Connect(function()

    Tween(
        Floating,
        TweenInfo.new(
            0.18,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.fromOffset(58, 58)
        }
    )

end)

Floating.MouseLeave:Connect(function()

    Tween(
        Floating,
        TweenInfo.new(
            0.18,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.fromOffset(52, 52)
        }
    )

end)

--==================================================
-- MINIMIZE ANIMATION
--==================================================

local minimized = false
local closing = false

local function Minimize()

    if minimized or closing then
        return
    end

    minimized = true

    floatingPos = UDim2.new(
        0.5,
        -26,
        0.5,
        -26
    )

    Floating.Position = floatingPos
    Floating.Size = UDim2.fromOffset(20, 20)
    Floating.TextTransparency = 1
    Floating.Visible = true

    -- Main shrinks toward its center.
    Tween(
        Main,
        TweenInfo.new(
            0.42,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(80, 60),
            BackgroundTransparency = 1
        }
    )

    Tween(
        TopBar,
        TweenInfo.new(0.22),
        {
            BackgroundTransparency = 1
        }
    )

    Tween(
        Body,
        TweenInfo.new(0.22),
        {
            BackgroundTransparency = 1
        }
    )

    task.delay(0.22, function()

        for _, child in ipairs(Main:GetDescendants()) do

            if child:IsA("GuiObject") then
                child.Visible = false
            end

        end

    end)

    task.delay(0.38, function()

        Main.Visible = false

        Floating.Size =
            UDim2.fromOffset(20, 20)

        Tween(
            Floating,
            TweenInfo.new(
                0.38,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(52, 52)
            }
        )

        Tween(
            Floating,
            TweenInfo.new(
                0.28,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                TextTransparency = 0
            }
        )

    end)

end

--==================================================
-- RESTORE ANIMATION
--==================================================

local function Restore()

    if not minimized or closing then
        return
    end

    minimized = false

    Tween(
        Floating,
        TweenInfo.new(
            0.20,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(20, 20),
            TextTransparency = 1
        }
    )

    task.delay(0.16, function()

        Floating.Visible = false

        Main.Visible = true

        Main.Size =
            UDim2.fromOffset(80, 60)

        Main.BackgroundTransparency = 1

        -- Restore visibility.
        for _, child in ipairs(Main:GetDescendants()) do

            if child:IsA("GuiObject") then
                child.Visible = true
            end

        end

        -- Elements that must stay hidden.
        for _, page in pairs(Pages) do
            page.Visible = (page == Pages[CurrentPage])
        end

        Tween(
            Main,
            TweenInfo.new(
                0.48,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(570, 365),
                BackgroundTransparency = 0
            }
        )

        Tween(
            TopBar,
            TweenInfo.new(0.28),
            {
                BackgroundTransparency = 0
            }
        )

        Tween(
            Body,
            TweenInfo.new(0.28),
            {
                BackgroundTransparency = 0
            }
        )

    end)

end

--==================================================
-- MINIMIZE BUTTON
--==================================================

MinimizeButton.MouseButton1Click:Connect(function()
    Minimize()
end)

--==================================================
-- FLOATING N RESTORE
--==================================================

Floating.MouseButton1Click:Connect(function()
    Restore()
end)

--==================================================
-- CLOSE
--==================================================

CloseButton.MouseButton1Click:Connect(function()

    if closing then
        return
    end

    closing = true

    Tween(
        Main,
        TweenInfo.new(
            0.35,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(30, 30),
            BackgroundTransparency = 1
        }
    )

    Tween(
        Floating,
        TweenInfo.new(0.20),
        {
            Size = UDim2.fromOffset(10, 10),
            TextTransparency = 1
        }
    )

    task.delay(0.36, function()

        ScreenGui:Destroy()

    end)

end)

--==================================================
-- CENTERED AIM FOV
--==================================================

local Camera = workspace.CurrentCamera

local FOVCircle = New("Frame", {
    Name = "AimFOV",
    Parent = ScreenGui,

    AnchorPoint = Vector2.new(0.5, 0.5),

    Position = UDim2.fromScale(0.5, 0.5),

    Size = UDim2.fromOffset(
        Config.Combat.FOVSize,
        Config.Combat.FOVSize
    ),

    BackgroundTransparency = 1,

    Visible = false,

    ZIndex = 5
})

Corner(FOVCircle, 999)
Stroke(FOVCircle, Colors.Menu, 2)

-- Keep the FOV exactly in the screen center.
local function UpdateFOV()

    local viewport = Camera.ViewportSize

    FOVCircle.Position = UDim2.fromOffset(
        viewport.X / 2,
        viewport.Y / 2
    )

    local size = Config.Combat.FOVSize

    FOVCircle.Size =
        UDim2.fromOffset(size, size)

end

UpdateFOV()

Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    UpdateFOV()
end)

--==================================================
-- TARGET HELPERS
--==================================================

local function IsAlive(character)

    if not character then
        return false
    end

    local humanoid =
        character:FindFirstChildOfClass("Humanoid")

    return humanoid
        and humanoid.Health > 0

end

local function IsFriendly(player)

    if not player then
        return true
    end

    if player == LocalPlayer then
        return true
    end

    -- Same team is ALWAYS friendly.
    -- TeamColors setting never overrides this.
    if LocalPlayer.Team ~= nil
        and player.Team ~= nil
        and LocalPlayer.Team == player.Team then

        return true

    end

    return false

end

local function GetTargetPart(character)

    if not character then
        return nil
    end

    local wanted =
        Config.Combat.TargetPart

    if wanted == "Head" then

        return character:FindFirstChild("Head")
            or character:FindFirstChild("HumanoidRootPart")

    elseif wanted == "Torso" then

        return character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")
            or character:FindFirstChild("HumanoidRootPart")

    end

    return character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("Head")

end

--==================================================
-- VISIBILITY CHECK
--==================================================

local RayParams = RaycastParams.new()

RayParams.FilterType = Enum.RaycastFilterType.Exclude

local function IsVisible(character, part)

    if not Config.Combat.VisibleOnly then
        return true
    end

    if not character or not part then
        return false
    end

    RayParams.FilterDescendantsInstances = {
        LocalPlayer.Character,
        Camera
    }

    local origin =
        Camera.CFrame.Position

    local direction =
        part.Position - origin

    local result =
        workspace:Raycast(
            origin,
            direction,
            RayParams
        )

    if not result then
        return true
    end

    return result.Instance
        and result.Instance:IsDescendantOf(character)

end

--==================================================
-- BEST TARGET
--==================================================

local function GetBestTarget()

    if not Config.Combat.AimAssist then
        return nil, nil
    end

    local center =
        Vector2.new(
            Camera.ViewportSize.X / 2,
            Camera.ViewportSize.Y / 2
        )

    local radius =
        Config.Combat.FOVSize / 2

    local bestPlayer = nil
    local bestPart = nil
    local bestDistance = radius

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer
            and not IsFriendly(player) then

            local character =
                player.Character

            if IsAlive(character) then

                local part =
                    GetTargetPart(character)

                if part then

                    local screenPos, onScreen =
                        Camera:WorldToViewportPoint(
                            part.Position
                        )

                    if onScreen then

                        local point =
                            Vector2.new(
                                screenPos.X,
                                screenPos.Y
                            )

                        local distance =
                            (point - center).Magnitude

                        if distance <= bestDistance
                            and IsVisible(character, part) then

                            bestDistance = distance
                            bestPlayer = player
                            bestPart = part

                        end

                    end

                end

            end

        end

    end

    return bestPlayer, bestPart

end

--==================================================
-- END PART 3/4
--==================================================

--==================================================
-- AIM ASSIST
--==================================================

local function AimAt(part)

    if not part then
        return
    end

    local cameraPosition =
        Camera.CFrame.Position

    local direction =
        part.Position - cameraPosition

    if direction.Magnitude <= 0 then
        return
    end

    local targetCFrame =
        CFrame.lookAt(
            cameraPosition,
            part.Position
        )

    local smooth =
        math.clamp(
            Config.Combat.Smoothness,
            0.01,
            1
        )

    Camera.CFrame =
        Camera.CFrame:Lerp(
            targetCFrame,
            smooth
        )

end

--==================================================
-- ESP
--==================================================

local ESPObjects = {}

local function RemoveESP(player)

    local data = ESPObjects[player]

    if not data then
        return
    end

    if data.Highlight then
        data.Highlight:Destroy()
    end

    if data.Box then
        data.Box:Destroy()
    end

    if data.Name then
        data.Name:Destroy()
    end

    ESPObjects[player] = nil

end

local function CreateESP(player)

    if player == LocalPlayer then
        return
    end

    if ESPObjects[player] then
        return
    end

    local box =
        New("BoxHandleAdornment", {
            Name = "ESPBox",
            Parent = CoreGui,

            Size = Vector3.new(4, 6, 2),

            Color3 = Colors.Menu,
            Transparency = 0.35,

            AlwaysOnTop = true,
            ZIndex = 5,

            Visible = false
        })

    local highlight =
        New("Highlight", {
            Name = "ESPHighlight",
            Parent = CoreGui,

            FillColor = Colors.Menu,
            FillTransparency = 0.75,

            OutlineColor = Colors.Menu,
            OutlineTransparency = 0,

            Enabled = false
        })

    ESPObjects[player] = {
        Box = box,
        Highlight = highlight
    }

end

local function UpdateESP(player)

    local data =
        ESPObjects[player]

    if not data then
        CreateESP(player)
        data = ESPObjects[player]
    end

    if not data then
        return
    end

    local character =
        player.Character

    local alive =
        IsAlive(character)

    if not Config.Visuals.ESP
        or not alive then

        data.Box.Visible = false
        data.Highlight.Enabled = false

        return

    end

    local root =
        character:FindFirstChild(
            "HumanoidRootPart"
        )

    if not root then
        data.Box.Visible = false
        data.Highlight.Enabled = false
        return
    end

    -- Same-team players are not ESP targets.
    if IsFriendly(player) then
        data.Box.Visible = false
        data.Highlight.Enabled = false
        return
    end

    data.Box.Adornee = root
    data.Box.Visible =
        Config.Visuals.SquareBox

    data.Highlight.Adornee = character
    data.Highlight.Enabled =
        Config.Visuals.ModelESP

end

--==================================================
-- NOCLIP
--==================================================

local function UpdateNoclip()

    local character =
        LocalPlayer.Character

    if not character then
        return
    end

    for _, object in ipairs(character:GetDescendants()) do

        if object:IsA("BasePart") then

            if Config.Movement.Noclip then
                object.CanCollide = false
            else
                object.CanCollide = true
            end

        end

    end

end

--==================================================
-- MOVEMENT
--==================================================

local function UpdateMovement()

    local character =
        LocalPlayer.Character

    if not character then
        return
    end

    local humanoid =
        character:FindFirstChildOfClass(
            "Humanoid"
        )

    if not humanoid then
        return
    end

    if Config.Movement.Speed then
        humanoid.WalkSpeed =
            Config.Movement.SpeedValue
    else
        humanoid.WalkSpeed = 16
    end

    if Config.Movement.Jump then
        humanoid.UseJumpPower = true
        humanoid.JumpPower =
            Config.Movement.JumpPower
    else
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 50
    end

end

--==================================================
-- FOV VISIBILITY
--==================================================

local function UpdateFOVVisibility()

    FOVCircle.Visible =
        Config.Combat.AimAssist

    FOVCircle.Size =
        UDim2.fromOffset(
            Config.Combat.FOVSize,
            Config.Combat.FOVSize
        )

end

--==================================================
-- MAIN LOOP
--==================================================

RunService.RenderStepped:Connect(function()

    if closing then
        return
    end

    -- Keep FOV centered.
    UpdateFOV()

    UpdateFOVVisibility()

    -- Movement.
    UpdateMovement()
    UpdateNoclip()

    -- Aim Assist.
    if Config.Combat.AimAssist then

        local player, part =
            GetBestTarget()

        if player and part then
            AimAt(part)
        end

    end

    -- ESP.
    for _, player in ipairs(
        Players:GetPlayers()
    ) do

        if player ~= LocalPlayer then
            UpdateESP(player)
        end

    end

end)

--==================================================
-- PLAYER EVENTS
--==================================================

Players.PlayerAdded:Connect(function(player)

    if player ~= LocalPlayer then
        CreateESP(player)
    end

    player.CharacterAdded:Connect(function()

        task.wait(0.2)

        UpdateESP(player)

    end)

end)

Players.PlayerRemoving:Connect(function(player)

    RemoveESP(player)

end)

for _, player in ipairs(
    Players:GetPlayers()
) do

    if player ~= LocalPlayer then

        CreateESP(player)

        player.CharacterAdded:Connect(function()

            task.wait(0.2)

            UpdateESP(player)

        end)

    end

end

--==================================================
-- LOCAL CHARACTER
--==================================================

LocalPlayer.CharacterAdded:Connect(function()

    task.wait(0.25)

    UpdateMovement()
    UpdateNoclip()

end)

--==================================================
-- STARTUP ANIMATION
--==================================================

Main.Visible = true

Main.Size =
    UDim2.fromOffset(120, 90)

Main.BackgroundTransparency = 1

TopBar.BackgroundTransparency = 1
Body.BackgroundTransparency = 1

task.wait()

Tween(
    Main,
    TweenInfo.new(
        0.55,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = UDim2.fromOffset(570, 365),
        BackgroundTransparency = 0
    }
)

task.wait(0.08)

Tween(
    TopBar,
    TweenInfo.new(
        0.35,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    ),
    {
        BackgroundTransparency = 0
    }
)

Tween(
    Body,
    TweenInfo.new(
        0.35,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    ),
    {
        BackgroundTransparency = 0
    }
)

--==================================================
-- INITIAL VALUES
--==================================================

UpdateFOV()
UpdateFOVVisibility()
UpdateMovement()
UpdateNoclip()

--==================================================
-- FINAL
--==================================================

print(
    "[Neutralization Hub] v"
        .. Config.Version
        .. " loaded successfully."
)

--==================================================
-- END PART 4/4
--==================================================
