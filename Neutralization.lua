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

    local old1 =
        CoreGui:FindFirstChild("NeutralizationHub")

    if old1 then
        old1:Destroy()
    end

    local old2 =
        CoreGui:FindFirstChild("LunarHub")

    if old2 then
        old2:Destroy()
    end

end)

--==================================================
-- HELPERS
--==================================================

local function New(className, properties, parent)

    local object =
        Instance.new(className)

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

    local corner =
        Instance.new("UICorner")

    corner.CornerRadius =
        UDim.new(
            0,
            radius or 10
        )

    corner.Parent = object

    return corner

end

local function Stroke(
    object,
    color,
    thickness,
    transparency
)

    local stroke =
        Instance.new("UIStroke")

    stroke.Color =
        color or Colors.Border

    stroke.Thickness =
        thickness or 1

    stroke.Transparency =
        transparency or 0

    stroke.ApplyStrokeMode =
        Enum.ApplyStrokeMode.Border

    stroke.Parent = object

    return stroke

end

local function Tween(
    object,
    info,
    properties
)

    local tween =
        TweenService:Create(
            object,
            info,
            properties
        )

    tween:Play()

    return tween

end

local function FastTween(
    object,
    properties,
    duration
)

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

local ScreenGui =
    New(
        "ScreenGui",
        {
            Name = "NeutralizationHub",

            ResetOnSpawn = false,

            IgnoreGuiInset = true,

            ZIndexBehavior =
                Enum.ZIndexBehavior.Sibling
        }
    )

pcall(function()
    ScreenGui.Parent = CoreGui
end)

if not ScreenGui.Parent then

    ScreenGui.Parent =
        LocalPlayer:WaitForChild(
            "PlayerGui"
        )

end

--==================================================
-- MAIN
--==================================================

local Main =
    New(
        "Frame",
        {
            Name = "Main",

            Size =
                UDim2.fromOffset(
                    570,
                    365
                ),

            Position =
                UDim2.new(
                    0.5,
                    -285,
                    0.5,
                    -182
                ),

            BackgroundColor3 =
                Colors.Background,

            BorderSizePixel = 0,

            ClipsDescendants = true,

            ZIndex = 10
        },
        ScreenGui
    )

Corner(Main, 20)

Stroke(
    Main,
    Colors.Menu,
    1.5,
    0.15
)

local MainScale =
    New(
        "UIScale",
        {
            Scale = 0.78
        },
        Main
    )

--==================================================
-- ANIMATED BACKGROUND
--==================================================

local Background =
    New(
        "Frame",
        {
            Name =
                "AnimatedBackground",

            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            BackgroundColor3 =
                Colors.Background,

            BorderSizePixel = 0,

            ClipsDescendants = true,

            ZIndex = 10
        },
        Main
    )

Corner(Background, 20)

--==================================================
-- GLOW 1
--==================================================

local Glow1 =
    New(
        "Frame",
        {
            Size =
                UDim2.fromOffset(
                    260,
                    260
                ),

            Position =
                UDim2.fromOffset(
                    -120,
                    -130
                ),

            BackgroundColor3 =
                Colors.MenuDark,

            BackgroundTransparency =
                0.72,

            BorderSizePixel = 0,

            ZIndex = 11
        },
        Background
    )

Corner(Glow1, 999)

--==================================================
-- GLOW 2
--==================================================

local Glow2 =
    New(
        "Frame",
        {
            Size =
                UDim2.fromOffset(
                    240,
                    240
                ),

            Position =
                UDim2.new(
                    1,
                    -100,
                    1,
                    -90
                ),

            BackgroundColor3 =
                Colors.Menu,

            BackgroundTransparency =
                0.84,

            BorderSizePixel = 0,

            ZIndex = 11
        },
        Background
    )

Corner(Glow2, 999)

--==================================================
-- GLOW 3
--==================================================

local Glow3 =
    New(
        "Frame",
        {
            Size =
                UDim2.fromOffset(
                    150,
                    150
                ),

            Position =
                UDim2.new(
                    0.55,
                    0,
                    -70,
                    0
                ),

            BackgroundColor3 =
                Colors.Menu,

            BackgroundTransparency =
                0.90,

            BorderSizePixel = 0,

            ZIndex = 11
        },
        Background
    )

Corner(Glow3, 999)

--==================================================
-- BACKGROUND ANIMATION
--==================================================

task.spawn(function()

    while Main.Parent do

        FastTween(
            Glow1,
            {
                Position =
                    UDim2.fromOffset(
                        -45,
                        -75
                    ),

                BackgroundTransparency =
                    0.80
            },
            2.5
        )

        FastTween(
            Glow2,
            {
                Position =
                    UDim2.new(
                        1,
                        -165,
                        1,
                        -155
                    ),

                BackgroundTransparency =
                    0.90
            },
            2.5
        )

        FastTween(
            Glow3,
            {
                Position =
                    UDim2.new(
                        0.35,
                        0,
                        0,
                        35
                    ),

                BackgroundTransparency =
                    0.84
            },
            2.5
        )

        task.wait(2.5)

        FastTween(
            Glow1,
            {
                Position =
                    UDim2.fromOffset(
                        -120,
                        -130
                    ),

                BackgroundTransparency =
                    0.72
            },
            2.5
        )

        FastTween(
            Glow2,
            {
                Position =
                    UDim2.new(
                        1,
                        -100,
                        1,
                        -90
                    ),

                BackgroundTransparency =
                    0.84
            },
            2.5
        )

        FastTween(
            Glow3,
            {
                Position =
                    UDim2.new(
                        0.55,
                        0,
                        -70,
                        0
                    ),

                BackgroundTransparency =
                    0.90
            },
            2.5
        )

        task.wait(2.5)

    end

end)

--==================================================
-- TOP BAR
--==================================================

local TopBar =
    New(
        "Frame",
        {
            Name = "TopBar",

            Size =
                UDim2.new(
                    1,
                    -20,
                    0,
                    64
                ),

            Position =
                UDim2.fromOffset(
                    10,
                    10
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ZIndex = 20
        },
        Main
    )

--==================================================
-- LOGO
--==================================================

local Logo =
    New(
        "Frame",
        {
            Size =
                UDim2.fromOffset(
                    50,
                    50
                ),

            Position =
                UDim2.fromOffset(
                    4,
                    4
                ),

            BackgroundColor3 =
                Colors.Menu,

            BorderSizePixel = 0,

            ZIndex = 21
        },
        TopBar
    )

Corner(Logo, 16)

Stroke(
    Logo,
    Colors.Menu,
    1,
    0.1
)

local LogoText =
    New(
        "TextLabel",
        {
            Size =
                UDim2.fromScale(
                    1,
                    1
                ),

            BackgroundTransparency = 1,

            Text = "N",

            TextColor3 =
                Colors.Text,

            TextSize = 23,

            Font =
                Enum.Font.GothamBold,

            ZIndex = 22
        },
        Logo
    )

--==================================================
-- TITLE
--==================================================

local Title =
    New(
        "TextLabel",
        {
            Size =
                UDim2.new(
                    1,
                    -190,
                    0,
                    27
                ),

            Position =
                UDim2.fromOffset(
                    66,
                    4
                ),

            BackgroundTransparency = 1,

            Text =
                "NEUTRALIZATION HUB",

            TextColor3 =
                Colors.Text,

            TextSize = 18,

            Font =
                Enum.Font.GothamBold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            ZIndex = 21
        },
        TopBar
    )

local Version =
    New(
        "TextLabel",
        {
            Size =
                UDim2.new(
                    1,
                    -190,
                    0,
                    18
                ),

            Position =
                UDim2.fromOffset(
                    67,
                    32
                ),

            BackgroundTransparency = 1,

            Text =
                Config.Version,

            TextColor3 =
                Colors.Menu,

            TextSize = 11,

            Font =
                Enum.Font.GothamSemibold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            ZIndex = 21
        },
        TopBar
    )

--==================================================
-- MINIMIZE BUTTON
--==================================================

local MinimizeButton =
    New(
        "TextButton",
        {
            Size =
                UDim2.fromOffset(
                    42,
                    42
                ),

            Position =
                UDim2.new(
                    1,
                    -94,
                    0,
                    8
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text = "—",

            TextColor3 =
                Colors.Text,

            TextSize = 22,

            Font =
                Enum.Font.GothamBold,

            AutoButtonColor = false,

            ZIndex = 25
        },
        TopBar
    )

Corner(
    MinimizeButton,
    13
)

Stroke(
    MinimizeButton,
    Colors.Border,
    1,
    0.15
)

--==================================================
-- CLOSE BUTTON
--==================================================

local CloseButton =
    New(
        "TextButton",
        {
            Size =
                UDim2.fromOffset(
                    42,
                    42
                ),

            Position =
                UDim2.new(
                    1,
                    -46,
                    0,
                    8
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text = "×",

            TextColor3 =
                Colors.Text,

            TextSize = 21,

            Font =
                Enum.Font.GothamBold,

            AutoButtonColor = false,

            ZIndex = 25
        },
        TopBar
    )

Corner(
    CloseButton,
    13
)

Stroke(
    CloseButton,
    Colors.Border,
    1,
    0.15
)

--==================================================
-- BUTTON HOVER
--==================================================

local function ButtonHover(
    button,
    normal,
    hover
)

    local originalSize =
        button.Size

    button.MouseEnter:Connect(function()

        FastTween(
            button,
            {
                BackgroundColor3 =
                    hover,

                Size =
                    UDim2.fromOffset(
                        originalSize.X.Offset + 2,
                        originalSize.Y.Offset + 2
                    )
            },
            0.16
        )

    end)

    button.MouseLeave:Connect(function()

        FastTween(
            button,
            {
                BackgroundColor3 =
                    normal,

                Size =
                    originalSize
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
    Color3.fromRGB(
        70,
        25,
        25
    )
)

--==================================================
-- BODY
--==================================================

local Body =
    New(
        "Frame",
        {
            Name = "Body",

            Size =
                UDim2.new(
                    1,
                    -20,
                    1,
                    -88
                ),

            Position =
                UDim2.fromOffset(
                    10,
                    78
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ZIndex = 20
        },
        Main
    )

--==================================================
-- SIDEBAR
--==================================================

local Sidebar =
    New(
        "Frame",
        {
            Name = "Sidebar",

            Size =
                UDim2.new(
                    0,
                    165,
                    1,
                    0
                ),

            Position =
                UDim2.fromOffset(
                    0,
                    0
                ),

            BackgroundColor3 =
                Colors.Panel,

            BorderSizePixel = 0,

            ZIndex = 21
        },
        Body
    )

Corner(
    Sidebar,
    16
)

Stroke(
    Sidebar,
    Colors.Border,
    1,
    0.35
)

local SidebarTitle =
    New(
        "TextLabel",
        {
            Size =
                UDim2.new(
                    1,
                    -24,
                    0,
                    25
                ),

            Position =
                UDim2.fromOffset(
                    12,
                    10
                ),

            BackgroundTransparency = 1,

            Text = "CATEGORIES",

            TextColor3 =
                Colors.Muted,

            TextSize = 10,

            Font =
                Enum.Font.GothamBold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            ZIndex = 22
        },
        Sidebar
    )

local CategoryHolder =
    New(
        "Frame",
        {
            Size =
                UDim2.new(
                    1,
                    -16,
                    1,
                    -48
                ),

            Position =
                UDim2.fromOffset(
                    8,
                    40
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ZIndex = 22
        },
        Sidebar
    )

New(
    "UIListLayout",
    {
        Padding =
            UDim.new(
                0,
                8
            ),

        SortOrder =
            Enum.SortOrder.LayoutOrder
    },
    CategoryHolder
)

--==================================================
-- CONTENT
--==================================================

local Content =
    New(
        "Frame",
        {
            Name = "Content",

            Size =
                UDim2.new(
                    1,
                    -175,
                    1,
                    0
                ),

            Position =
                UDim2.fromOffset(
                    175,
                    0
                ),

            BackgroundColor3 =
                Colors.Panel,

            BorderSizePixel = 0,

            ClipsDescendants = true,

            ZIndex = 21
        },
        Body
    )

Corner(
    Content,
    16
)

Stroke(
    Content,
    Colors.Border,
    1,
    0.35
)

--========================================================
-- PAGE HEADER
--========================================================

local PageHeader = Instance.new("Frame")
PageHeader.Name = "PageHeader"
PageHeader.Parent = Content
PageHeader.BackgroundTransparency = 1
PageHeader.Position = UDim2.new(0, 18, 0, 14)
PageHeader.Size = UDim2.new(1, -36, 0, 48)
PageHeader.ZIndex = 23

local PageTitle = Instance.new("TextLabel")
PageTitle.Name = "PageTitle"
PageTitle.Parent = PageHeader
PageTitle.BackgroundTransparency = 1
PageTitle.Position = UDim2.new(0, 0, 0, 0)
PageTitle.Size = UDim2.new(1, 0, 0, 27)
PageTitle.Font = Enum.Font.GothamBold
PageTitle.Text = "Combat"
PageTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PageTitle.TextSize = 22
PageTitle.TextXAlignment = Enum.TextXAlignment.Left
PageTitle.ZIndex = 24

local PageSubtitle = Instance.new("TextLabel")
PageSubtitle.Name = "PageSubtitle"
PageSubtitle.Parent = PageHeader
PageSubtitle.BackgroundTransparency = 1
PageSubtitle.Position = UDim2.new(0, 1, 0, 27)
PageSubtitle.Size = UDim2.new(1, -2, 0, 20)
PageSubtitle.Font = Enum.Font.Gotham
PageSubtitle.Text = "Combat features and targeting"
PageSubtitle.TextColor3 = Color3.fromRGB(150, 150, 160)
PageSubtitle.TextSize = 11
PageSubtitle.TextXAlignment = Enum.TextXAlignment.Left
PageSubtitle.ZIndex = 24


--========================================================
-- PAGES CONTAINER
--========================================================

local Pages = Instance.new("Frame")
Pages.Name = "Pages"
Pages.Parent = Content
Pages.BackgroundTransparency = 1
Pages.Position = UDim2.new(0, 18, 0, 70)
Pages.Size = UDim2.new(1, -36, 1, -82)
Pages.ClipsDescendants = true
Pages.ZIndex = 23


--========================================================
-- PAGE DATA
--========================================================

local PageDescriptions = {
    Combat = "Combat features and targeting",
    Visuals = "Visual information and ESP",
    Movement = "Movement and player controls",
    Settings = "Hub information and configuration"
}


--========================================================
-- CATEGORY BUTTONS
--========================================================

local CategoryButtons = {}
local CategoryIndex = 0

local function CreateCategoryButton(name, text, icon)
    CategoryIndex = CategoryIndex + 1

    local Button = Instance.new("TextButton")
    Button.Name = name .. "Button"
    Button.Parent = Sidebar
    Button.BackgroundColor3 = Color3.fromRGB(24, 24, 29)
    Button.BackgroundTransparency = 1
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(1, -20, 0, 38)

    -- ИСПРАВЛЕНО: каждая категория получает своё место
    Button.Position = UDim2.new(
        0,
        10,
        0,
        58 + ((CategoryIndex - 1) * 48)
    )

    Button.AutoButtonColor = false
    Button.Text = ""
    Button.ZIndex = 23

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Button

    local Icon = Instance.new("TextLabel")
    Icon.Name = "Icon"
    Icon.Parent = Button
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 12, 0, 0)
    Icon.Size = UDim2.new(0, 22, 1, 0)
    Icon.Font = Enum.Font.GothamBold
    Icon.Text = icon
    Icon.TextColor3 = Color3.fromRGB(155, 155, 165)
    Icon.TextSize = 15
    Icon.ZIndex = 24

    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Parent = Button
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 42, 0, 0)
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Font = Enum.Font.GothamMedium
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(175, 175, 185)
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 24

    CategoryButtons[name] = Button

    Button.MouseEnter:Connect(function()
        if CurrentPage ~= name then
            TweenService:Create(
                Button,
                TweenInfo.new(
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    BackgroundTransparency = 0.45
                }
            ):Play()

            TweenService:Create(
                Icon,
                TweenInfo.new(
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(220, 220, 225)
                }
            ):Play()

            TweenService:Create(
                Label,
                TweenInfo.new(
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(225, 225, 230)
                }
            ):Play()
        end
    end)

    Button.MouseLeave:Connect(function()
        if CurrentPage ~= name then
            TweenService:Create(
                Button,
                TweenInfo.new(
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    BackgroundTransparency = 1
                }
            ):Play()

            TweenService:Create(
                Icon,
                TweenInfo.new(
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(155, 155, 165)
                }
            ):Play()

            TweenService:Create(
                Label,
                TweenInfo.new(
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(175, 175, 185)
                }
            ):Play()
        end
    end)

    Button.MouseButton1Click:Connect(function()
        if SwitchPage then
            SwitchPage(name)
        end
    end)

    return Button
end

CreateCategoryButton("Combat", "Combat", "⚔")
CreateCategoryButton("Visuals", "Visuals", "◉")
CreateCategoryButton("Movement", "Movement", "↕")
CreateCategoryButton("Settings", "Settings", "⚙")

--========================================================
-- INITIAL PAGE STATE
--========================================================

local CurrentPage = "Combat"
local SwitchPage
    


--========================================================
-- END OF PART 1
--========================================================

--========================================================
-- PART 2/4
-- CONTROLS + PAGES + PAGE SWITCH
--========================================================

--========================================================
-- ROW
--========================================================

local function CreateRow(parent, title, description, order)
    local Row = Instance.new("Frame")
    Row.Name = title .. "Row"
    Row.Parent = parent
    Row.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
    Row.BackgroundTransparency = 0.15
    Row.BorderSizePixel = 0
    Row.Size = UDim2.new(1, 0, 0, 58)
    Row.LayoutOrder = order or 0
    Row.ZIndex = 24

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Row

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(42, 42, 49)
    Stroke.Transparency = 0.45
    Stroke.Thickness = 1
    Stroke.Parent = Row

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Row
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 14, 0, 7)
    Title.Size = UDim2.new(1, -125, 0, 20)
    Title.Font = Enum.Font.GothamMedium
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(235, 235, 240)
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 25

    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = Row
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 14, 0, 28)
    Description.Size = UDim2.new(1, -125, 0, 18)
    Description.Font = Enum.Font.Gotham
    Description.Text = description or ""
    Description.TextColor3 = Color3.fromRGB(125, 125, 135)
    Description.TextSize = 10
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.ZIndex = 25

    return Row
end


--========================================================
-- TOGGLE
--========================================================

local function CreateToggle(parent, title, description, key, order, callback)

    local Row = CreateRow(parent, title, description, order)

    local Toggle = Instance.new("TextButton")
    Toggle.Name = "Toggle"
    Toggle.Parent = Row
    Toggle.BackgroundColor3 = Color3.fromRGB(48, 48, 55)
    Toggle.BorderSizePixel = 0
    Toggle.Position = UDim2.new(1, -76, 0.5, -12)
    Toggle.Size = UDim2.new(0, 52, 0, 24)
    Toggle.AutoButtonColor = false
    Toggle.Text = ""
    Toggle.ZIndex = 26

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = Toggle

    local Circle = Instance.new("Frame")
    Circle.Name = "Circle"
    Circle.Parent = Toggle
    Circle.AnchorPoint = Vector2.new(0, 0.5)
    Circle.BackgroundColor3 = Color3.fromRGB(215, 215, 220)
    Circle.BorderSizePixel = 0
    Circle.Position = UDim2.new(0, 3, 0.5, 0)
    Circle.Size = UDim2.new(0, 18, 0, 18)
    Circle.ZIndex = 27

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = Circle

    local function UpdateToggle(animated)

        local enabled = Config[key] == true

        local info = TweenInfo.new(
            animated and 0.18 or 0,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        )

        if enabled then
            TweenService:Create(
                Toggle,
                info,
                {
                    BackgroundColor3 = Color3.fromRGB(210, 45, 45)
                }
            ):Play()

            TweenService:Create(
                Circle,
                info,
                {
                    Position = UDim2.new(1, -21, 0.5, 0)
                }
            ):Play()

        else
            TweenService:Create(
                Toggle,
                info,
                {
                    BackgroundColor3 = Color3.fromRGB(48, 48, 55)
                }
            ):Play()

            TweenService:Create(
                Circle,
                info,
                {
                    Position = UDim2.new(0, 3, 0.5, 0)
                }
            ):Play()
        end
    end

    Toggle.MouseEnter:Connect(function()
        TweenService:Create(
            Toggle,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad),
            {
                Size = UDim2.new(0, 55, 0, 25)
            }
        ):Play()
    end)

    Toggle.MouseLeave:Connect(function()
        TweenService:Create(
            Toggle,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad),
            {
                Size = UDim2.new(0, 52, 0, 24)
            }
        ):Play()
    end)

    Toggle.MouseButton1Click:Connect(function()

        Config[key] = not (Config[key] == true)

        UpdateToggle(true)

        if callback then
            task.spawn(function()
                callback(Config[key])
            end)
        end
    end)

    UpdateToggle(false)

    return Row
end


--========================================================
-- VALUE
--========================================================

local function FormatValue(value)
    if typeof(value) == "number" then
        if value % 1 == 0 then
            return tostring(value)
        end

        return string.format("%.2f", value)
    end

    return tostring(value)
end


local function CreateValue(parent, title, description, key, minValue, maxValue, step, order, callback)

    local Row = CreateRow(parent, title, description, order)

    local ValueButton = Instance.new("TextButton")
    ValueButton.Name = "Value"
    ValueButton.Parent = Row
    ValueButton.BackgroundColor3 = Color3.fromRGB(31, 31, 37)
    ValueButton.BorderSizePixel = 0
    ValueButton.AnchorPoint = Vector2.new(1, 0.5)
    ValueButton.Position = UDim2.new(1, -14, 0.5, 0)
    ValueButton.Size = UDim2.new(0, 72, 0, 32)
    ValueButton.AutoButtonColor = false
    ValueButton.Font = Enum.Font.GothamMedium
    ValueButton.TextColor3 = Color3.fromRGB(230, 230, 235)
    ValueButton.TextSize = 11
    ValueButton.Text = FormatValue(Config[key])
    ValueButton.ZIndex = 26

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 9)
    Corner.Parent = ValueButton

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(55, 55, 62)
    Stroke.Transparency = 0.3
    Stroke.Parent = ValueButton

    ValueButton.MouseEnter:Connect(function()
        TweenService:Create(
            ValueButton,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad),
            {
                BackgroundColor3 = Color3.fromRGB(40, 40, 47)
            }
        ):Play()
    end)

    ValueButton.MouseLeave:Connect(function()
        TweenService:Create(
            ValueButton,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad),
            {
                BackgroundColor3 = Color3.fromRGB(31, 31, 37)
            }
        ):Play()
    end)

    ValueButton.MouseButton1Click:Connect(function()

        local current = tonumber(Config[key]) or minValue

        current = current + step

        if current > maxValue then
            current = minValue
        end

        Config[key] = current
        ValueButton.Text = FormatValue(current)

        if callback then
            task.spawn(function()
                callback(current)
            end)
        end
    end)

    return Row
end


--========================================================
-- SELECTOR
--========================================================

local function CreateSelector(parent, title, description, key, options, order, callback)

    local Row = CreateRow(parent, title, description, order)

    local Selector = Instance.new("TextButton")
    Selector.Name = "Selector"
    Selector.Parent = Row
    Selector.BackgroundColor3 = Color3.fromRGB(31, 31, 37)
    Selector.BorderSizePixel = 0
    Selector.AnchorPoint = Vector2.new(1, 0.5)
    Selector.Position = UDim2.new(1, -14, 0.5, 0)
    Selector.Size = UDim2.new(0, 105, 0, 32)
    Selector.AutoButtonColor = false
    Selector.Font = Enum.Font.GothamMedium
    Selector.TextColor3 = Color3.fromRGB(230, 230, 235)
    Selector.TextSize = 10
    Selector.Text = tostring(Config[key])
    Selector.ZIndex = 26

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 9)
    Corner.Parent = Selector

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(55, 55, 62)
    Stroke.Transparency = 0.3
    Stroke.Parent = Selector

    local currentIndex = 1

    for i, option in ipairs(options) do
        if tostring(option) == tostring(Config[key]) then
            currentIndex = i
            break
        end
    end

    Selector.MouseEnter:Connect(function()
        TweenService:Create(
            Selector,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad),
            {
                BackgroundColor3 = Color3.fromRGB(40, 40, 47)
            }
        ):Play()
    end)

    Selector.MouseLeave:Connect(function()
        TweenService:Create(
            Selector,
            TweenInfo.new(0.12, Enum.EasingStyle.Quad),
            {
                BackgroundColor3 = Color3.fromRGB(31, 31, 37)
            }
        ):Play()
    end)

    Selector.MouseButton1Click:Connect(function()

        currentIndex = currentIndex + 1

        if currentIndex > #options then
            currentIndex = 1
        end

        Config[key] = options[currentIndex]
        Selector.Text = tostring(Config[key])

        if callback then
            task.spawn(function()
                callback(Config[key])
            end)
        end
    end)

    return Row
end


--========================================================
-- SECTION
--========================================================

local function CreateSection(parent, title, order)

    local Section = Instance.new("TextLabel")
    Section.Name = title .. "Section"
    Section.Parent = parent
    Section.BackgroundTransparency = 1
    Section.Size = UDim2.new(1, 0, 0, 30)
    Section.LayoutOrder = order or 0
    Section.Font = Enum.Font.GothamBold
    Section.Text = title
    Section.TextColor3 = Color3.fromRGB(245, 245, 250)
    Section.TextSize = 14
    Section.TextXAlignment = Enum.TextXAlignment.Left
    Section.ZIndex = 25

    return Section
end


--========================================================
-- PAGE CREATION HELPER
--========================================================

local function CreatePage(name)

    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Parent = Pages
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.Position = UDim2.new(0, 0, 0, 0)
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageTransparency = 0.25
    Page.ScrollingDirection = Enum.ScrollingDirection.Y
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.Visible = false
    Page.ZIndex = 23

    local Padding = Instance.new("UIPadding")
    Padding.PaddingTop = UDim.new(0, 2)
    Padding.PaddingBottom = UDim.new(0, 15)
    Padding.PaddingLeft = UDim.new(0, 2)
    Padding.PaddingRight = UDim.new(0, 2)
    Padding.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = Page

    return Page
end


--========================================================
-- CREATE PAGES
--========================================================

local CombatPage = CreatePage("Combat")
local VisualsPage = CreatePage("Visuals")
local MovementPage = CreatePage("Movement")
local SettingsPage = CreatePage("Settings")


--========================================================
-- COMBAT
--========================================================

CreateSection(
    CombatPage,
    "Aim & Targeting",
    1
)

CreateToggle(
    CombatPage,
    "Aim Assist",
    "Automatically assists your aim toward valid targets.",
    "AimAssist",
    2
)

CreateToggle(
    CombatPage,
    "Visible Only",
    "Ignore targets hidden behind walls or objects.",
    "VisibleOnly",
    3
)

CreateToggle(
    CombatPage,
    "Aim FOV",
    "Show the centered field-of-view circle.",
    "AimFOV",
    4
)

CreateValue(
    CombatPage,
    "FOV Size",
    "Adjust the size of the centered aim FOV.",
    "FOVSize",
    80,
    600,
    20,
    5
)

CreateValue(
    CombatPage,
    "Smoothness",
    "Controls how smoothly the camera follows the target.",
    "Smoothness",
    0.05,
    1,
    0.05,
    6
)

CreateSelector(
    CombatPage,
    "Target Part",
    "Select the body part used for aiming.",
    "TargetPart",
    {
        "Head",
        "HumanoidRootPart",
        "Torso"
    },
    7
)


--========================================================
-- VISUALS
--========================================================

CreateSection(
    VisualsPage,
    "ESP",
    1
)

CreateToggle(
    VisualsPage,
    "ESP",
    "Display visual information around players.",
    "ESP",
    2
)

CreateToggle(
    VisualsPage,
    "Model ESP",
    "Highlight the target character model.",
    "ModelESP",
    3
)

CreateToggle(
    VisualsPage,
    "Square Box",
    "Display a box around player characters.",
    "SquareBox",
    4
)

CreateToggle(
    VisualsPage,
    "Team Colors",
    "Use team colors for visual indicators.",
    "TeamColors",
    5
)

CreateToggle(
    VisualsPage,
    "Names",
    "Display player names.",
    "Names",
    6
)

CreateToggle(
    VisualsPage,
    "Health",
    "Display player health information.",
    "Health",
    7
)

CreateToggle(
    VisualsPage,
    "Distance",
    "Display distance from your character.",
    "Distance",
    8
)


--========================================================
-- MOVEMENT
--========================================================

CreateSection(
    MovementPage,
    "Movement",
    1
)

CreateToggle(
    MovementPage,
    "Speed",
    "Enable custom player movement speed.",
    "Speed",
    2
)

CreateValue(
    MovementPage,
    "Speed Value",
    "Choose your custom movement speed.",
    "SpeedValue",
    3,
    16,
    100,
    4,
    2
)

CreateToggle(
    MovementPage,
    "Jump",
    "Enable custom jump power.",
    "Jump",
    5
)

CreateValue(
    MovementPage,
    "Jump Power",
    "Choose your custom jump power.",
    "JumpPower",
    25,
    150,
    5,
    6
)

CreateToggle(
    MovementPage,
    "Noclip",
    "Walk through physical objects.",
    "Noclip",
    7
)


--========================================================
-- SETTINGS
--========================================================

CreateSection(
    SettingsPage,
    "NEUTRALIZATION HUB",
    1
)


local InfoCard = Instance.new("Frame")
InfoCard.Name = "InfoCard"
InfoCard.Parent = SettingsPage
InfoCard.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
InfoCard.BackgroundTransparency = 0.1
InfoCard.BorderSizePixel = 0
InfoCard.Size = UDim2.new(1, 0, 0, 178)
InfoCard.LayoutOrder = 2
InfoCard.ZIndex = 24

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 14)
InfoCorner.Parent = InfoCard

local InfoStroke = Instance.new("UIStroke")
InfoStroke.Color = Color3.fromRGB(48, 48, 55)
InfoStroke.Transparency = 0.35
InfoStroke.Parent = InfoCard


local InfoTitle = Instance.new("TextLabel")
InfoTitle.Name = "Title"
InfoTitle.Parent = InfoCard
InfoTitle.BackgroundTransparency = 1
InfoTitle.Position = UDim2.new(0, 16, 0, 14)
InfoTitle.Size = UDim2.new(1, -32, 0, 24)
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.Text = "NEUTRALIZATION HUB"
InfoTitle.TextColor3 = Color3.fromRGB(245, 245, 250)
InfoTitle.TextSize = 16
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.ZIndex = 25


local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "Version"
VersionLabel.Parent = InfoCard
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 16, 0, 48)
VersionLabel.Size = UDim2.new(1, -32, 0, 20)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = "Version: " .. tostring(Config.Version)
VersionLabel.TextColor3 = Color3.fromRGB(165, 165, 175)
VersionLabel.TextSize = 11
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.ZIndex = 25


local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Name = "Creator"
CreatorLabel.Parent = InfoCard
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Position = UDim2.new(0, 16, 0, 72)
CreatorLabel.Size = UDim2.new(1, -32, 0, 20)
CreatorLabel.Font = Enum.Font.Gotham
CreatorLabel.Text = "Creator: " .. tostring(Config.Creator)
CreatorLabel.TextColor3 = Color3.fromRGB(165, 165, 175)
CreatorLabel.TextSize = 11
CreatorLabel.TextXAlignment = Enum.TextXAlignment.Left
CreatorLabel.ZIndex = 25


local TelegramLabel = Instance.new("TextLabel")
TelegramLabel.Name = "Telegram"
TelegramLabel.Parent = InfoCard
TelegramLabel.BackgroundTransparency = 1
TelegramLabel.Position = UDim2.new(0, 16, 0, 96)
TelegramLabel.Size = UDim2.new(1, -32, 0, 20)
TelegramLabel.Font = Enum.Font.Gotham
TelegramLabel.Text = "Telegram: @lunarhub_script"
TelegramLabel.TextColor3 = Color3.fromRGB(165, 165, 175)
TelegramLabel.TextSize = 11
TelegramLabel.TextXAlignment = Enum.TextXAlignment.Left
TelegramLabel.ZIndex = 25


local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "Status"
StatusLabel.Parent = InfoCard
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 16, 0, 124)
StatusLabel.Size = UDim2.new(1, -32, 0, 20)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Neutralization Hub is running"
StatusLabel.TextColor3 = Color3.fromRGB(125, 200, 135)
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.ZIndex = 25


local TelegramButton = Instance.new("TextButton")
TelegramButton.Name = "TelegramButton"
TelegramButton.Parent = InfoCard
TelegramButton.BackgroundColor3 = Color3.fromRGB(31, 31, 37)
TelegramButton.BorderSizePixel = 0
TelegramButton.Position = UDim2.new(0, 16, 1, -39)
TelegramButton.Size = UDim2.new(0, 150, 0, 28)
TelegramButton.AutoButtonColor = false
TelegramButton.Font = Enum.Font.GothamMedium
TelegramButton.Text = "Open Telegram"
TelegramButton.TextColor3 = Color3.fromRGB(220, 220, 225)
TelegramButton.TextSize = 10
TelegramButton.ZIndex = 26

local TelegramCorner = Instance.new("UICorner")
TelegramCorner.CornerRadius = UDim.new(0, 9)
TelegramCorner.Parent = TelegramButton


TelegramButton.MouseEnter:Connect(function()
    TweenService:Create(
        TelegramButton,
        TweenInfo.new(0.12, Enum.EasingStyle.Quad),
        {
            BackgroundColor3 = Color3.fromRGB(42, 42, 49)
        }
    ):Play()
end)

TelegramButton.MouseLeave:Connect(function()
    TweenService:Create(
        TelegramButton,
        TweenInfo.new(0.12, Enum.EasingStyle.Quad),
        {
            BackgroundColor3 = Color3.fromRGB(31, 31, 37)
        }
    ):Play()
end)

TelegramButton.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then
            setclipboard("https://t.me/lunarhub_script")
        end
    end)
end)


--========================================================
-- PAGE SWITCH
--========================================================

local pageObjects = {
    Combat = CombatPage,
    Visuals = VisualsPage,
    Movement = MovementPage,
    Settings = SettingsPage
}


local function SetCategoryState(name, active)

    local Button = CategoryButtons[name]

    if not Button then
        return
    end

    local Icon = Button:FindFirstChild("Icon")
    local Label = Button:FindFirstChild("Label")

    if active then

        TweenService:Create(
            Button,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                BackgroundColor3 = Color3.fromRGB(205, 42, 42),
                BackgroundTransparency = 0
            }
        ):Play()

        if Icon then
            TweenService:Create(
                Icon,
                TweenInfo.new(
                    0.18,
                    Enum.EasingStyle.Quart,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }
            ):Play()
        end

        if Label then
            TweenService:Create(
                Label,
                TweenInfo.new(
                    0.18,
                    Enum.EasingStyle.Quart,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }
            ):Play()
        end

    else

        TweenService:Create(
            Button,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.Out
            ),
            {
                BackgroundColor3 = Color3.fromRGB(24, 24, 29),
                BackgroundTransparency = 1
            }
        ):Play()

        if Icon then
            TweenService:Create(
                Icon,
                TweenInfo.new(
                    0.18,
                    Enum.EasingStyle.Quart,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(155, 155, 165)
                }
            ):Play()
        end

        if Label then
            TweenService:Create(
                Label,
                TweenInfo.new(
                    0.18,
                    Enum.EasingStyle.Quart,
                    Enum.EasingDirection.Out
                ),
                {
                    TextColor3 = Color3.fromRGB(175, 175, 185)
                }
            ):Play()
        end
    end
end


SwitchPage = function(name)

    if not pageObjects[name] then
        return
    end

    if CurrentPage == name and pageObjects[name].Visible then
        return
    end

    local oldPage = pageObjects[CurrentPage]
    local newPage = pageObjects[name]

    local oldName = CurrentPage

    CurrentPage = name

    -- Header
    PageTitle.Text = name
    PageSubtitle.Text = PageDescriptions[name] or ""

    -- Category buttons
    SetCategoryState(oldName, false)
    SetCategoryState(name, true)

    -- Animate old page out
    if oldPage and oldPage ~= newPage and oldPage.Visible then

        TweenService:Create(
            oldPage,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quart,
                Enum.EasingDirection.In
            ),
            {
                Position = UDim2.new(-0.08, 0, 0, 0)
            }
        ):Play()

        task.delay(0.18, function()

            if oldPage then
                oldPage.Visible = false
                oldPage.Position = UDim2.new(0, 0, 0, 0)
            end

        end)
    end

    -- Prepare new page
    newPage.Visible = true
    newPage.Position = UDim2.new(0.08, 0, 0, 0)

    -- Animate new page in
    TweenService:Create(
        newPage,
        TweenInfo.new(
            0.25,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        {
            Position = UDim2.new(0, 0, 0, 0)
        }
    ):Play()
end


--========================================================
-- CATEGORY BUTTON CONNECTIONS
--========================================================

for name, Button in pairs(CategoryButtons) do

    Button.MouseButton1Click:Connect(function()

        if CurrentPage ~= name then
            SwitchPage(name)
        end

    end)

end


--========================================================
-- INITIALIZE ALL PAGES
--========================================================

for name, page in pairs(pageObjects) do

    page.Visible = false
    page.Position = UDim2.new(0, 0, 0, 0)

end


--========================================================
-- INITIAL PAGE
--========================================================

CurrentPage = "Combat"

SwitchPage("Combat")


--========================================================
-- END OF PART 2/4
--========================================================

--========================================================
-- PART 3/4
-- COMBAT + VISUALS + MOVEMENT LOGIC
--========================================================

--========================================================
-- SERVICES
--========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera


--========================================================
-- CHARACTER HELPERS
--========================================================

local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHumanoid(character)
    if not character then
        return nil
    end

    return character:FindFirstChildOfClass("Humanoid")
end

local function GetRoot(character)
    if not character then
        return nil
    end

    return character:FindFirstChild("HumanoidRootPart")
end


local function IsAlive(character)

    local Humanoid = GetHumanoid(character)

    return Humanoid ~= nil
        and Humanoid.Health > 0
end


--========================================================
-- TEAM CHECK
--========================================================

local function IsFriendly(player)

    if not player or player == LocalPlayer then
        return true
    end

    -- Same team is ALWAYS friendly.
    if LocalPlayer.Team ~= nil
        and player.Team ~= nil
        and LocalPlayer.Team == player.Team then

        return true
    end

    return false
end


--========================================================
-- TARGET PART
--========================================================

local function GetTargetPart(character)

    local partName = Config.TargetPart or "Head"

    local part = character:FindFirstChild(partName)

    if part and part:IsA("BasePart") then
        return part
    end

    -- Fallbacks
    local head = character:FindFirstChild("Head")

    if head and head:IsA("BasePart") then
        return head
    end

    return GetRoot(character)
end


--========================================================
-- VISIBILITY CHECK
--========================================================

local function IsVisible(targetPart)

    if not targetPart or not Camera then
        return false
    end

    local origin = Camera.CFrame.Position
    local direction = targetPart.Position - origin

    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {
        LocalPlayer.Character
    }
    params.IgnoreWater = true

    local result = workspace:Raycast(
        origin,
        direction,
        params
    )

    if not result then
        return true
    end

    return result.Instance:IsDescendantOf(
        targetPart.Parent
    )
end


--========================================================
-- FOV CIRCLE
--========================================================

local FOVCircle = Drawing and Drawing.new("Circle") or nil

if FOVCircle then

    FOVCircle.Visible = false
    FOVCircle.Filled = false
    FOVCircle.Thickness = 1.5
    FOVCircle.NumSides = 64
    FOVCircle.Radius = Config.FOVSize or 250
    FOVCircle.Color = Color3.fromRGB(220, 45, 45)
    FOVCircle.Transparency = 0.9

end


local function UpdateFOV()

    if not FOVCircle then
        return
    end

    Camera = workspace.CurrentCamera

    if not Camera then
        FOVCircle.Visible = false
        return
    end

    local viewport = Camera.ViewportSize

    -- ALWAYS center of the screen.
    local center = Vector2.new(
        viewport.X / 2,
        viewport.Y / 2
    )

    FOVCircle.Position = center
    FOVCircle.Radius = tonumber(Config.FOVSize) or 250
    FOVCircle.Visible = Config.AimFOV == true

end


--========================================================
-- GET BEST TARGET
--========================================================

local function GetBestTarget()

    if not Camera then
        return nil
    end

    local viewport = Camera.ViewportSize

    local center = Vector2.new(
        viewport.X / 2,
        viewport.Y / 2
    )

    local fov = tonumber(Config.FOVSize) or 250

    local bestPlayer = nil
    local bestPart = nil
    local bestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer
            and not IsFriendly(player) then

            local character = player.Character

            if character and IsAlive(character) then

                local targetPart = GetTargetPart(character)

                if targetPart then

                    local screenPosition, onScreen =
                        Camera:WorldToViewportPoint(
                            targetPart.Position
                        )

                    if onScreen and screenPosition.Z > 0 then

                        local screenPoint = Vector2.new(
                            screenPosition.X,
                            screenPosition.Y
                        )

                        local distance =
                            (screenPoint - center).Magnitude

                        if distance <= fov then

                            local visible = true

                            if Config.VisibleOnly == true then
                                visible = IsVisible(targetPart)
                            end

                            if visible and distance < bestDistance then
                                bestDistance = distance
                                bestPlayer = player
                                bestPart = targetPart
                            end
                        end
                    end
                end
            end
        end
    end

    return bestPlayer, bestPart
end


--========================================================
-- AIM
--========================================================

local function AimAt(targetPart)

    if not targetPart then
        return
    end

    Camera = workspace.CurrentCamera

    if not Camera then
        return
    end

    local smoothness = tonumber(Config.Smoothness) or 0.15

    smoothness = math.clamp(
        smoothness,
        0.01,
        1
    )

    local cameraPosition = Camera.CFrame.Position

    local targetCFrame = CFrame.lookAt(
        cameraPosition,
        targetPart.Position
    )

    Camera.CFrame = Camera.CFrame:Lerp(
        targetCFrame,
        smoothness
    )
end


--========================================================
-- ESP STORAGE
--========================================================

local ESPObjects = {}


--========================================================
-- REMOVE ESP
--========================================================

local function RemoveESP(player)

    local data = ESPObjects[player]

    if not data then
        return
    end

    if data.Highlight then
        pcall(function()
            data.Highlight:Destroy()
        end)
    end

    if data.Box then
        pcall(function()
            data.Box:Destroy()
        end)
    end

    if data.Billboard then
        pcall(function()
            data.Billboard:Destroy()
        end)
    end

    ESPObjects[player] = nil
end


--========================================================
-- ESP COLOR
--========================================================

local function GetESPColor(player)

    if Config.TeamColors == true then

        if player.Team then

            local teamColor =
                player.Team.TeamColor.Color

            if teamColor then
                return teamColor
            end
        end
    end

    return Color3.fromRGB(
        220,
        45,
        45
    )
end


--========================================================
-- CREATE ESP
--========================================================

local function CreateESP(player)

    if player == LocalPlayer then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    if not IsAlive(character) then
        return
    end

    RemoveESP(player)

    local root = GetRoot(character)

    if not root then
        return
    end

    local data = {}

    ESPObjects[player] = data

    local espColor = GetESPColor(player)


    --====================================================
    -- MODEL ESP
    --====================================================

    if Config.ESP == true
        and Config.ModelESP == true then

        local highlight = Instance.new("Highlight")

        highlight.Name = "NeutralizationESP"
        highlight.Adornee = character
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = espColor
        highlight.FillTransparency = 0.72
        highlight.OutlineColor = espColor
        highlight.OutlineTransparency = 0.05
        highlight.Parent = character

        data.Highlight = highlight
    end


    --====================================================
    -- SQUARE BOX
    --====================================================

    if Config.ESP == true
        and Config.SquareBox == true then

        local box = Instance.new("BoxHandleAdornment")

        box.Name = "NeutralizationBox"
        box.Adornee = root
        box.AlwaysOnTop = true
        box.ZIndex = 5
        box.Size = Vector3.new(
            4,
            6,
            2
        )
        box.Transparency = 0.35
        box.Color3 = espColor
        box.Parent = root

        data.Box = box
    end


    --====================================================
    -- TEXT ESP
    --====================================================

    if Config.ESP == true
        and (
            Config.Names == true
            or Config.Health == true
            or Config.Distance == true
        ) then

        local billboard = Instance.new("BillboardGui")

        billboard.Name = "NeutralizationInfo"
        billboard.Adornee = root
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(
            0,
            180,
            0,
            65
        )
        billboard.StudsOffset = Vector3.new(
            0,
            3.5,
            0
        )
        billboard.Parent = root

        local text = Instance.new("TextLabel")

        text.Name = "Info"
        text.Parent = billboard
        text.BackgroundTransparency = 1
        text.Size = UDim2.fromScale(1, 1)
        text.Font = Enum.Font.GothamBold
        text.TextColor3 = espColor
        text.TextStrokeTransparency = 0.4
        text.TextSize = 11
        text.TextWrapped = true
        text.ZIndex = 2

        data.Billboard = billboard
        data.Text = text
    end
end


--========================================================
-- UPDATE ESP
--========================================================

local function UpdateESP(player)

    if player == LocalPlayer then
        return
    end

    local data = ESPObjects[player]
    local character = player.Character

    if not character or not IsAlive(character) then

        RemoveESP(player)

        return
    end

    local root = GetRoot(character)

    if not root then
        RemoveESP(player)
        return
    end

    local espEnabled = Config.ESP == true

    if not espEnabled then
        RemoveESP(player)
        return
    end

    local espColor = GetESPColor(player)


    --====================================================
    -- HIGHLIGHT
    --====================================================

    if Config.ModelESP == true then

        if not data or not data.Highlight then
            CreateESP(player)
            data = ESPObjects[player]
        end

        if data and data.Highlight then

            data.Highlight.FillColor = espColor
            data.Highlight.OutlineColor = espColor
        end

    elseif data and data.Highlight then

        data.Highlight:Destroy()
        data.Highlight = nil
    end


    --====================================================
    -- BOX
    --====================================================

    if Config.SquareBox == true then

        if not data or not data.Box then
            CreateESP(player)
            data = ESPObjects[player]
        end

        if data and data.Box then
            data.Box.Adornee = root
            data.Box.Color3 = espColor
        end

    elseif data and data.Box then

        data.Box:Destroy()
        data.Box = nil
    end


    --====================================================
    -- TEXT
    --====================================================

    local needsText =
        Config.Names == true
        or Config.Health == true
        or Config.Distance == true

    if needsText then

        if not data or not data.Billboard then
            CreateESP(player)
            data = ESPObjects[player]
        end

        if data and data.Text then

            local parts = {}

            if Config.Names == true then
                table.insert(
                    parts,
                    player.DisplayName
                )
            end

            if Config.Health == true then

                local humanoid =
                    GetHumanoid(character)

                if humanoid then

                    table.insert(
                        parts,
                        "HP: "
                            .. math.floor(
                                humanoid.Health
                            )
                    )
                end
            end

            if Config.Distance == true then

                local localRoot =
                    GetRoot(
                        LocalPlayer.Character
                    )

                if localRoot then

                    local distance =
                        (
                            localRoot.Position
                            - root.Position
                        ).Magnitude

                    table.insert(
                        parts,
                        math.floor(distance)
                            .. " studs"
                    )
                end
            end

            data.Text.Text =
                table.concat(parts, "\n")

            data.Text.TextColor3 =
                espColor
        end

    elseif data and data.Billboard then

        data.Billboard:Destroy()
        data.Billboard = nil
        data.Text = nil
    end
end


--========================================================
-- REFRESH ALL ESP
--========================================================

local function RefreshESP()

    for _, player in ipairs(
        Players:GetPlayers()
    ) do

        if player ~= LocalPlayer then
            UpdateESP(player)
        end
    end
end


--========================================================
-- PLAYER EVENTS
--========================================================

local function SetupPlayer(player)

    if player == LocalPlayer then
        return
    end

    player.CharacterAdded:Connect(function()

        task.wait(0.5)

        if Config.ESP == true then
            CreateESP(player)
        end
    end)

    player.CharacterRemoving:Connect(function()
        RemoveESP(player)
    end)
end


for _, player in ipairs(
    Players:GetPlayers()
) do
    SetupPlayer(player)
end


Players.PlayerAdded:Connect(function(player)
    SetupPlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)


--========================================================
-- MOVEMENT
--========================================================

local DefaultWalkSpeed = 16
local DefaultJumpPower = 50


local function UpdateMovement()

    local character = LocalPlayer.Character

    if not character then
        return
    end

    local humanoid = GetHumanoid(character)

    if not humanoid then
        return
    end


    --====================================================
    -- SPEED
    --====================================================

    if Config.Speed == true then

        local speed =
            tonumber(Config.SpeedValue)
            or DefaultWalkSpeed

        humanoid.WalkSpeed = speed

    else

        humanoid.WalkSpeed =
            DefaultWalkSpeed
    end


    --====================================================
    -- JUMP
    --====================================================

    if Config.Jump == true then

        local jumpPower =
            tonumber(Config.JumpPower)
            or DefaultJumpPower

        humanoid.UseJumpPower = true
        humanoid.JumpPower = jumpPower

    else

        humanoid.UseJumpPower = true
        humanoid.JumpPower =
            DefaultJumpPower
    end


    --====================================================
    -- NOCLIP
    --====================================================

    if Config.Noclip == true then

        for _, object in ipairs(
            character:GetDescendants()
        ) do

            if object:IsA("BasePart") then
                object.CanCollide = false
            end
        end

    else

        for _, object in ipairs(
            character:GetDescendants()
        ) do

            if object:IsA("BasePart") then

                if object.Name
                    ~= "HumanoidRootPart" then

                    object.CanCollide = true
                end
            end
        end
    end
end


--========================================================
-- CONFIG CHANGE HELPERS
--========================================================

local function RefreshFeatures()

    UpdateFOV()
    RefreshESP()
    UpdateMovement()

end


--========================================================
-- MAIN RENDER LOOP
--========================================================

RunService.RenderStepped:Connect(function()

    Camera = workspace.CurrentCamera

    -- FOV always follows screen center.
    UpdateFOV()

    -- Movement.
    UpdateMovement()

    -- ESP.
    if Config.ESP == true then
        RefreshESP()
    end

    -- Aim.
    if Config.AimAssist == true then

        local targetPlayer, targetPart =
            GetBestTarget()

        if targetPlayer and targetPart then
            AimAt(targetPart)
        end
    end

end)


--========================================================
-- CHARACTER RESPAWN
--========================================================

LocalPlayer.CharacterAdded:Connect(function()

    task.wait(0.5)

    UpdateMovement()

    if Config.ESP == true then
        RefreshESP()
    end

end)


--========================================================
-- END OF PART 3/4
--========================================================

--========================================================
-- PART 4/4
-- WINDOW CONTROL + MINIMIZE + RESTORE + CLOSE
--========================================================


--========================================================
-- WINDOW STATE
--========================================================

local IsMinimized = false
local IsClosing = false

local FullSize = UDim2.new(0, 570, 0, 365)
local MiniSize = UDim2.new(0, 90, 0, 90)

local FullPosition = Main.Position

local SavedFloatingPosition = UDim2.new(
    0.5,
    -45,
    0.5,
    -45
)


--========================================================
-- FLOATING N BUTTON
--========================================================

local Floating = Instance.new("TextButton")
Floating.Name = "NeutralizationFloating"
Floating.Parent = ScreenGui
Floating.AnchorPoint = Vector2.new(0.5, 0.5)
Floating.Position = SavedFloatingPosition
Floating.Size = UDim2.new(0, 76, 0, 76)
Floating.BackgroundColor3 = Color3.fromRGB(205, 42, 42)
Floating.BackgroundTransparency = 0.05
Floating.BorderSizePixel = 0
Floating.AutoButtonColor = false
Floating.Text = "N"
Floating.TextColor3 = Color3.fromRGB(255, 255, 255)
Floating.Font = Enum.Font.GothamBlack
Floating.TextSize = 30
Floating.Visible = false
Floating.ZIndex = 100


local FloatingCorner = Instance.new("UICorner")
FloatingCorner.CornerRadius = UDim.new(1, 0)
FloatingCorner.Parent = Floating


local FloatingStroke = Instance.new("UIStroke")
FloatingStroke.Color = Color3.fromRGB(255, 95, 95)
FloatingStroke.Thickness = 2
FloatingStroke.Transparency = 0.2
FloatingStroke.Parent = Floating


--========================================================
-- FLOATING SHADOW
--========================================================

local FloatingGlow = Instance.new("Frame")
FloatingGlow.Name = "Glow"
FloatingGlow.Parent = Floating
FloatingGlow.AnchorPoint = Vector2.new(0.5, 0.5)
FloatingGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
FloatingGlow.Size = UDim2.new(1, 14, 1, 14)
FloatingGlow.BackgroundColor3 = Color3.fromRGB(205, 42, 42)
FloatingGlow.BackgroundTransparency = 0.82
FloatingGlow.BorderSizePixel = 0
FloatingGlow.ZIndex = 99


local FloatingGlowCorner = Instance.new("UICorner")
FloatingGlowCorner.CornerRadius = UDim.new(1, 0)
FloatingGlowCorner.Parent = FloatingGlow


--========================================================
-- FLOATING HOVER
--========================================================

Floating.MouseEnter:Connect(function()

    TweenService:Create(
        Floating,
        TweenInfo.new(
            0.16,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.new(0, 84, 0, 84),
            BackgroundColor3 = Color3.fromRGB(225, 48, 48)
        }
    ):Play()

    TweenService:Create(
        FloatingStroke,
        TweenInfo.new(
            0.16,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        {
            Thickness = 3,
            Transparency = 0
        }
    ):Play()

end)


Floating.MouseLeave:Connect(function()

    TweenService:Create(
        Floating,
        TweenInfo.new(
            0.16,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.new(0, 76, 0, 76),
            BackgroundColor3 = Color3.fromRGB(205, 42, 42)
        }
    ):Play()

    TweenService:Create(
        FloatingStroke,
        TweenInfo.new(
            0.16,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        {
            Thickness = 2,
            Transparency = 0.2
        }
    ):Play()

end)


--========================================================
-- MINIMIZE
--========================================================

local function Minimize()

    if IsMinimized or IsClosing then
        return
    end

    IsMinimized = true

    -- Save the current position.
    FullPosition = Main.Position

    -- Keep the animated background alive.
    -- Only hide the actual interface layers.
    TopBar.Visible = false
    Body.Visible = false
    Sidebar.Visible = false
    Content.Visible = false
    PageHeader.Visible = false
    Pages.Visible = false

    -- Animate main window away.
    local shrinkTween = TweenService:Create(
        Main,
        TweenInfo.new(
            0.28,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.new(0, 30, 0, 30),
            BackgroundTransparency = 1
        }
    )

    shrinkTween:Play()

    -- Rotate/scale effect for the N button.
    Floating.Visible = true
    Floating.Size = UDim2.new(0, 20, 0, 20)
    Floating.BackgroundTransparency = 1
    Floating.TextTransparency = 1

    local floatingIn = TweenService:Create(
        Floating,
        TweenInfo.new(
            0.32,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.new(0, 76, 0, 76),
            BackgroundTransparency = 0.05,
            TextTransparency = 0
        }
    )

    floatingIn:Play()

    task.delay(0.3, function()

        if IsMinimized and not IsClosing then
            Main.Visible = false
        end

    end)

end


--========================================================
-- RESTORE
--========================================================

local function Restore()

    if not IsMinimized or IsClosing then
        return
    end

    IsMinimized = false

    Main.Visible = true

    -- Restore the background FIRST.
    Background.Visible = true
    Glow1.Visible = true
    Glow2.Visible = true
    Glow3.Visible = true

    -- Restore only the interface layers.
    TopBar.Visible = true
    Body.Visible = true
    Sidebar.Visible = true
    Content.Visible = true
    PageHeader.Visible = true
    Pages.Visible = true

    -- Restore current page state.
    for name, page in pairs(pageObjects) do
        page.Visible = (name == CurrentPage)
        page.Position = UDim2.new(0, 0, 0, 0)
    end

    -- Restore category state.
    for name, _ in pairs(CategoryButtons) do
        SetCategoryState(
            name,
            name == CurrentPage
        )
    end

    -- Prepare main window for animation.
    Main.Size = UDim2.new(0, 30, 0, 30)
    Main.BackgroundTransparency = 1

    -- Hide N.
    local floatingOut = TweenService:Create(
        Floating,
        TweenInfo.new(
            0.2,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.new(0, 20, 0, 20),
            BackgroundTransparency = 1,
            TextTransparency = 1
        }
    )

    floatingOut:Play()

    -- Restore main window.
    TweenService:Create(
        Main,
        TweenInfo.new(
            0.32,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        ),
        {
            Size = FullSize,
            BackgroundTransparency = 0
        }
    ):Play()

    task.delay(0.22, function()

        if not IsMinimized and not IsClosing then
            Floating.Visible = false
        end

    end)

end


--========================================================
-- CLOSE
--========================================================

local function CloseHub()

    if IsClosing then
        return
    end

    IsClosing = true

    -- Hide floating button.
    Floating.Visible = false

    -- Animate window away.
    local closeTween = TweenService:Create(
        Main,
        TweenInfo.new(
            0.22,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.new(0, 30, 0, 30),
            BackgroundTransparency = 1
        }
    )

    closeTween:Play()

    task.delay(0.23, function()

        if ScreenGui then
            ScreenGui:Destroy()
        end

    end)

end


--========================================================
-- TOPBAR BUTTONS
--========================================================

if MinimizeButton then

    MinimizeButton.MouseButton1Click:Connect(function()
        Minimize()
    end)

end


if CloseButton then

    CloseButton.MouseButton1Click:Connect(function()
        CloseHub()
    end)

end


--========================================================
-- FLOATING RESTORE
--========================================================

Floating.MouseButton1Click:Connect(function()
    Restore()
end)


--========================================================
-- DRAG SYSTEM
--========================================================

local Dragging = false
local DragStart = nil
local StartPosition = nil
local DragInput = nil


local function UpdateDrag(input)

    if not DragStart or not StartPosition then
        return
    end

    local Delta = input.Position - DragStart

    Main.Position = UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,
        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )

end


TopBar.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = input.Position
        StartPosition = Main.Position

        input.Changed:Connect(function()

            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end

        end)

    end

end)


TopBar.InputChanged:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        DragInput = input

    end

end)


UserInputService.InputChanged:Connect(function(input)

    if input == DragInput and Dragging then
        UpdateDrag(input)
    end

end)


--========================================================
-- FLOATING N DRAG
--========================================================

local FloatingDragging = false
local FloatingDragStart = nil
local FloatingStartPosition = nil
local FloatingDragInput = nil


local function UpdateFloatingDrag(input)

    if not FloatingDragStart
        or not FloatingStartPosition then

        return
    end

    local Delta =
        input.Position - FloatingDragStart

    Floating.Position = UDim2.new(
        FloatingStartPosition.X.Scale,
        FloatingStartPosition.X.Offset + Delta.X,
        FloatingStartPosition.Y.Scale,
        FloatingStartPosition.Y.Offset + Delta.Y
    )

    SavedFloatingPosition =
        Floating.Position

end


Floating.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        FloatingDragging = true
        FloatingDragStart = input.Position
        FloatingStartPosition = Floating.Position

        input.Changed:Connect(function()

            if input.UserInputState
                == Enum.UserInputState.End then

                FloatingDragging = false

            end

        end)

    end

end)


Floating.InputChanged:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        FloatingDragInput = input

    end

end)


UserInputService.InputChanged:Connect(function(input)

    if input == FloatingDragInput
        and FloatingDragging then

        UpdateFloatingDrag(input)

    end

end)


--========================================================
-- STARTUP ANIMATION
--========================================================

Main.Visible = true
Main.Size = UDim2.new(0, 80, 0, 50)
Main.BackgroundTransparency = 1

TopBar.Visible = true
Body.Visible = true
Sidebar.Visible = true
Content.Visible = true
PageHeader.Visible = true
Pages.Visible = true

Background.Visible = true
Glow1.Visible = true
Glow2.Visible = true
Glow3.Visible = true


task.delay(0.05, function()

    if IsClosing then
        return
    end

    TweenService:Create(
        Main,
        TweenInfo.new(
            0.42,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        ),
        {
            Size = FullSize,
            BackgroundTransparency = 0
        }
    ):Play()

end)


--========================================================
-- INITIAL UI UPDATE
--========================================================

task.defer(function()

    UpdateFOV()
    UpdateMovement()

    if Config.ESP == true then
        RefreshESP()
    end

end)


--========================================================
-- BACKGROUND ANIMATION SAFETY
--========================================================

task.spawn(function()

    while ScreenGui
        and ScreenGui.Parent
        and not IsClosing do

        if Background
            and Background.Parent then

            local pulseInfo = TweenInfo.new(
                2.4,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut
            )

            TweenService:Create(
                Glow1,
                pulseInfo,
                {
                    BackgroundTransparency = 0.35
                }
            ):Play()

            TweenService:Create(
                Glow2,
                pulseInfo,
                {
                    BackgroundTransparency = 0.5
                }
            ):Play()

            TweenService:Create(
                Glow3,
                pulseInfo,
                {
                    BackgroundTransparency = 0.6
                }
            ):Play()

            task.wait(2.4)

            if IsClosing then
                break
            end

            TweenService:Create(
                Glow1,
                pulseInfo,
                {
                    BackgroundTransparency = 0.58
                }
            ):Play()

            TweenService:Create(
                Glow2,
                pulseInfo,
                {
                    BackgroundTransparency = 0.7
                }
            ):Play()

            TweenService:Create(
                Glow3,
                pulseInfo,
                {
                    BackgroundTransparency = 0.78
                }
            ):Play()

            task.wait(2.4)

        else
            break
        end
    end

end)


--========================================================
-- CLEANUP
--========================================================

ScreenGui.AncestryChanged:Connect(function(_, parent)

    if not parent then

        IsClosing = true

        if FOVCircle then
            pcall(function()
                FOVCircle:Remove()
            end)
        end

        for player, _ in pairs(ESPObjects) do
            RemoveESP(player)
        end

    end

end)


--========================================================
-- FINAL
--========================================================

print("Neutralization Hub " .. tostring(Config.Version) .. " loaded successfully.")


--========================================================
-- END OF PART 4/4
--========================================================
