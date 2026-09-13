--==================================================
-- NEUTRALIZATION HUB v4.5
-- CLEAN REBUILD
-- PART 1/4
--==================================================

--==================================================
-- SERVICES
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local Config = {
    Version = "v4.5",

    -- COMBAT
    AimAssist = false,
    VisibleOnly = true,
    AimFOV = true,
    AimFOVSize = 150,
    AimSmoothness = 0.18,
    TargetPart = "Head",

    -- VISUALS
    ESP = false,
    ModelESP = true,
    BoxESP = true,
    TeamColors = true,
    Names = false,
    Health = false,
    Distance = false,

    -- MOVEMENT
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
    Menu = Color3.fromRGB(190, 25, 25),
    MenuDark = Color3.fromRGB(130, 20, 20),

    Background = Color3.fromRGB(13, 13, 15),
    Background2 = Color3.fromRGB(18, 18, 21),

    Panel = Color3.fromRGB(22, 22, 25),
    PanelHover = Color3.fromRGB(30, 30, 34),

    Text = Color3.fromRGB(240, 240, 243),
    TextDim = Color3.fromRGB(145, 145, 150),

    White = Color3.fromRGB(255, 255, 255)
}

--==================================================
-- HELPERS
--==================================================

local function New(className, properties)
    local object = Instance.new(className)

    for property, value in pairs(properties) do
        object[property] = value
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

    stroke.Color = color or Colors.Menu
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0

    stroke.Parent = object

    return stroke
end


local function Tween(object, properties, duration, style, direction)
    local info = TweenInfo.new(
        duration or 0.25,
        style or Enum.EasingStyle.Quint,
        direction or Enum.EasingDirection.Out
    )

    local tween = TweenService:Create(
        object,
        info,
        properties
    )

    tween:Play()

    return tween
end


local function SetTransparencyRecursive(object, value)
    if object:IsA("GuiObject") then
        object.BackgroundTransparency = value
    end

    for _, child in ipairs(object:GetChildren()) do
        if child:IsA("GuiObject") then
            child.BackgroundTransparency = value
        end
    end
end

--==================================================
-- SCREEN GUI
--==================================================

local Gui = New("ScreenGui", {
    Name = "NeutralizationHub",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Parent = LocalPlayer:WaitForChild("PlayerGui")
})

--==================================================
-- MAIN SCALE
--==================================================

local MainScale = New("UIScale", {
    Scale = 1
})

--==================================================
-- MAIN WINDOW
--==================================================

local Main = New("Frame", {
    Parent = Gui,

    Size = UDim2.new(0, 520, 0, 320),
    Position = UDim2.new(0.5, -260, 0.5, -160),

    BackgroundColor3 = Colors.Background,
    BackgroundTransparency = 0,

    BorderSizePixel = 0,

    ClipsDescendants = true
})

MainScale.Parent = Main

Corner(Main, 18)

local MainStroke = Stroke(
    Main,
    Colors.Menu,
    1.5,
    0.18
)

--==================================================
-- ANIMATED BACKGROUND
--==================================================

local Background = New("Frame", {
    Parent = Main,

    Position = UDim2.new(-0.25, 0, -0.35, 0),
    Size = UDim2.new(1.5, 0, 1.7, 0),

    BackgroundColor3 = Colors.Background,
    BorderSizePixel = 0,

    ZIndex = 0
})

Corner(Background, 24)


local Glow1 = New("Frame", {
    Parent = Background,

    Position = UDim2.new(-0.18, 0, 0.10, 0),
    Size = UDim2.new(0, 230, 0, 230),

    BackgroundColor3 = Colors.MenuDark,
    BackgroundTransparency = 0.78,

    BorderSizePixel = 0,

    ZIndex = 0
})

Corner(Glow1, 999)


local Glow2 = New("Frame", {
    Parent = Background,

    Position = UDim2.new(0.65, 0, 0.48, 0),
    Size = UDim2.new(0, 270, 0, 270),

    BackgroundColor3 = Colors.Menu,
    BackgroundTransparency = 0.88,

    BorderSizePixel = 0,

    ZIndex = 0
})

Corner(Glow2, 999)


local Glow3 = New("Frame", {
    Parent = Background,

    Position = UDim2.new(0.35, 0, -0.25, 0),
    Size = UDim2.new(0, 190, 0, 190),

    BackgroundColor3 = Colors.MenuDark,
    BackgroundTransparency = 0.91,

    BorderSizePixel = 0,

    ZIndex = 0
})

Corner(Glow3, 999)

--==================================================
-- BACKGROUND ANIMATION
--==================================================

task.spawn(function()

    while Gui.Parent do

        Tween(
            Glow1,
            {
                Position = UDim2.new(
                    0.12,
                    0,
                    0.35,
                    0
                ),

                BackgroundTransparency = 0.84
            },
            4.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )

        Tween(
            Glow2,
            {
                Position = UDim2.new(
                    0.48,
                    0,
                    0.18,
                    0
                ),

                BackgroundTransparency = 0.82
            },
            5.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )

        Tween(
            Glow3,
            {
                Position = UDim2.new(
                    0.58,
                    0,
                    0.50,
                    0
                ),

                BackgroundTransparency = 0.87
            },
            4,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )

        task.wait(4.5)

        Tween(
            Glow1,
            {
                Position = UDim2.new(
                    -0.18,
                    0,
                    0.10,
                    0
                ),

                BackgroundTransparency = 0.78
            },
            4.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )

        Tween(
            Glow2,
            {
                Position = UDim2.new(
                    0.65,
                    0,
                    0.48,
                    0
                ),

                BackgroundTransparency = 0.88
            },
            5.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )

        Tween(
            Glow3,
            {
                Position = UDim2.new(
                    0.35,
                    0,
                    -0.25,
                    0
                ),

                BackgroundTransparency = 0.91
            },
            4,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut
        )

        task.wait(4.5)
    end
end)

--==================================================
-- TOP BAR
--==================================================

local TopBar = New("Frame", {
    Parent = Main,

    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(1, 0, 0, 62),

    BackgroundTransparency = 1,
    BorderSizePixel = 0,

    ZIndex = 10
})

--==================================================
-- LOGO
--==================================================

local LogoBack = New("Frame", {
    Parent = TopBar,

    Position = UDim2.new(0, 15, 0.5, -19),
    Size = UDim2.new(0, 38, 0, 38),

    BackgroundColor3 = Colors.MenuDark,
    BackgroundTransparency = 0.08,

    BorderSizePixel = 0,

    ZIndex = 11
})

Corner(LogoBack, 12)

Stroke(
    LogoBack,
    Colors.Menu,
    1,
    0.25
)


local Logo = New("TextLabel", {
    Parent = LogoBack,

    Size = UDim2.new(1, 0, 1, 0),

    BackgroundTransparency = 1,

    Text = "N",
    TextColor3 = Colors.White,

    Font = Enum.Font.GothamBold,
    TextSize = 20,

    TextXAlignment = Enum.TextXAlignment.Center,
    TextYAlignment = Enum.TextYAlignment.Center,

    ZIndex = 12
})

--==================================================
-- TITLE
--==================================================

local Title = New("TextLabel", {
    Parent = TopBar,

    Position = UDim2.new(0, 65, 0, 10),
    Size = UDim2.new(0, 270, 0, 25),

    BackgroundTransparency = 1,

    Text = "NEUTRALIZATION HUB",
    TextColor3 = Colors.Text,

    Font = Enum.Font.GothamBold,
    TextSize = 16,

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 11
})


local Version = New("TextLabel", {
    Parent = TopBar,

    Position = UDim2.new(0, 66, 0, 34),
    Size = UDim2.new(0, 100, 0, 16),

    BackgroundTransparency = 1,

    Text = Config.Version,
    TextColor3 = Colors.Menu,

    Font = Enum.Font.GothamMedium,
    TextSize = 10,

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 11
})

--==================================================
-- MINIMIZE BUTTON
--==================================================

local MinimizeButton = New("TextButton", {
    Parent = TopBar,

    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -48, 0.5, 0),

    Size = UDim2.new(0, 28, 0, 28),

    BackgroundColor3 = Colors.Panel,
    BackgroundTransparency = 0.15,

    BorderSizePixel = 0,

    Text = "—",
    TextColor3 = Colors.TextDim,

    Font = Enum.Font.GothamBold,
    TextSize = 15,

    AutoButtonColor = false,

    ZIndex = 12
})

Corner(MinimizeButton, 9)


--==================================================
-- CLOSE BUTTON
--==================================================

local CloseButton = New("TextButton", {
    Parent = TopBar,

    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -13, 0.5, 0),

    Size = UDim2.new(0, 28, 0, 28),

    BackgroundColor3 = Colors.Panel,
    BackgroundTransparency = 0.15,

    BorderSizePixel = 0,

    Text = "×",
    TextColor3 = Colors.TextDim,

    Font = Enum.Font.GothamBold,
    TextSize = 17,

    AutoButtonColor = false,

    ZIndex = 12
})

Corner(CloseButton, 9)

--==================================================
-- BUTTON HOVER
--==================================================

local function ButtonHover(button)

    button.MouseEnter:Connect(function()

        Tween(
            button,
            {
                BackgroundColor3 = Colors.Menu,
                TextColor3 = Colors.White
            },
            0.16
        )

        Tween(
            button,
            {
                Size = UDim2.new(0, 31, 0, 31)
            },
            0.16
        )
    end)


    button.MouseLeave:Connect(function()

        Tween(
            button,
            {
                BackgroundColor3 = Colors.Panel,
                TextColor3 = Colors.TextDim
            },
            0.18
        )

        Tween(
            button,
            {
                Size = UDim2.new(0, 28, 0, 28)
            },
            0.18
        )
    end)
end

ButtonHover(MinimizeButton)
ButtonHover(CloseButton)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = New("Frame", {
    Parent = Main,

    Position = UDim2.new(0, 12, 0, 70),
    Size = UDim2.new(0, 145, 1, -82),

    BackgroundColor3 = Colors.Panel,
    BackgroundTransparency = 0.18,

    BorderSizePixel = 0,

    ZIndex = 5
})

Corner(Sidebar, 15)

Stroke(
    Sidebar,
    Color3.fromRGB(45, 45, 50),
    1,
    0.55
)

--==================================================
-- SIDEBAR TITLE
--==================================================

New("TextLabel", {
    Parent = Sidebar,

    Position = UDim2.new(0, 15, 0, 12),
    Size = UDim2.new(1, -30, 0, 20),

    BackgroundTransparency = 1,

    Text = "CATEGORIES",
    TextColor3 = Colors.TextDim,

    Font = Enum.Font.GothamBold,
    TextSize = 9,

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 6
})

--==================================================
-- CATEGORY CONTAINER
--==================================================

local CategoryContainer = New("Frame", {
    Parent = Sidebar,

    Position = UDim2.new(0, 8, 0, 39),
    Size = UDim2.new(1, -16, 1, -47),

    BackgroundTransparency = 1,

    ZIndex = 6
})

local CategoryLayout = New("UIListLayout", {
    Parent = CategoryContainer,

    Padding = UDim.new(0, 7),

    SortOrder = Enum.SortOrder.LayoutOrder
})

--==================================================
-- CONTENT
--==================================================

local Content = New("Frame", {
    Parent = Main,

    Position = UDim2.new(0, 169, 0, 70),
    Size = UDim2.new(1, -181, 1, -82),

    BackgroundColor3 = Colors.Panel,
    BackgroundTransparency = 0.14,

    BorderSizePixel = 0,

    ClipsDescendants = true,

    ZIndex = 5
})

Corner(Content, 15)

Stroke(
    Content,
    Color3.fromRGB(45, 45, 50),
    1,
    0.55
)

--==================================================
-- PAGE TITLE
--==================================================

local PageTitle = New("TextLabel", {
    Parent = Content,

    Position = UDim2.new(0, 17, 0, 13),
    Size = UDim2.new(1, -34, 0, 27),

    BackgroundTransparency = 1,

    Text = "Combat",
    TextColor3 = Colors.Text,

    Font = Enum.Font.GothamBold,
    TextSize = 17,

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 8
})


local PageDescription = New("TextLabel", {
    Parent = Content,

    Position = UDim2.new(0, 18, 0, 38),
    Size = UDim2.new(1, -36, 0, 20),

    BackgroundTransparency = 1,

    Text = "Combat functions",
    TextColor3 = Colors.TextDim,

    Font = Enum.Font.Gotham,
    TextSize = 10,

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 8
})

--==================================================
-- PAGES
--==================================================

local Pages = {}

local CombatPage = New("ScrollingFrame", {
    Parent = Content,

    Position = UDim2.new(0, 12, 0, 67),
    Size = UDim2.new(1, -24, 1, -77),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 2,
    ScrollBarImageColor3 = Colors.Menu,

    CanvasSize = UDim2.new(0, 0, 0, 0),

    AutomaticCanvasSize = Enum.AutomaticSize.Y,

    Visible = true,

    ZIndex = 7
})

local VisualPage = CombatPage:Clone()
VisualPage.Name = "VisualPage"
VisualPage.Parent = Content
VisualPage.Visible = false

local MovementPage = CombatPage:Clone()
MovementPage.Name = "MovementPage"
MovementPage.Parent = Content
MovementPage.Visible = false

local SettingsPage = CombatPage:Clone()
SettingsPage.Name = "SettingsPage"
SettingsPage.Parent = Content
SettingsPage.Visible = false

-- очистка клонированных элементов
for _, child in ipairs(VisualPage:GetChildren()) do
    child:Destroy()
end

for _, child in ipairs(MovementPage:GetChildren()) do
    child:Destroy()
end

for _, child in ipairs(SettingsPage:GetChildren()) do
    child:Destroy()
end

Pages.Combat = CombatPage
Pages.Visuals = VisualPage
Pages.Movement = MovementPage
Pages.Settings = SettingsPage

--==================================================
-- CATEGORY BUTTONS
--==================================================

local CategoryButtons = {}

local CategoryData = {
    {
        Name = "Combat",
        Description = "Combat functions",
        LayoutOrder = 1
    },

    {
        Name = "Visuals",
        Description = "Visual functions",
        LayoutOrder = 2
    },

    {
        Name = "Movement",
        Description = "Movement functions",
        LayoutOrder = 3
    },

    {
        Name = "Settings",
        Description = "Menu settings",
        LayoutOrder = 4
    }
}


local function CreateCategory(data)

    local button = New("TextButton", {
        Parent = CategoryContainer,

        Size = UDim2.new(1, 0, 0, 43),

        BackgroundColor3 = Colors.Background2,
        BackgroundTransparency = 0.25,

        BorderSizePixel = 0,

        Text = data.Name,

        TextColor3 = Colors.TextDim,

        Font = Enum.Font.GothamMedium,
        TextSize = 12,

        TextXAlignment = Enum.TextXAlignment.Left,

        AutoButtonColor = false,

        LayoutOrder = data.LayoutOrder,

        ZIndex = 7
    })

    Corner(button, 11)


    local indicator = New("Frame", {
        Parent = button,

        Position = UDim2.new(0, 6, 0.5, -10),
        Size = UDim2.new(0, 3, 0, 20),

        BackgroundColor3 = Colors.Menu,
        BackgroundTransparency = 1,

        BorderSizePixel = 0,

        ZIndex = 8
    })

    Corner(indicator, 5)


    local label = New("TextLabel", {
        Parent = button,

        Position = UDim2.new(0, 20, 0, 0),
        Size = UDim2.new(1, -25, 1, 0),

        BackgroundTransparency = 1,

        Text = data.Name,
        TextColor3 = Colors.TextDim,

        Font = Enum.Font.GothamMedium,
        TextSize = 12,

        TextXAlignment = Enum.TextXAlignment.Left,

        ZIndex = 8
    })


    CategoryButtons[data.Name] = {
        Button = button,
        Label = label,
        Indicator = indicator
    }

    return button
end


for _, data in ipairs(CategoryData) do
    CreateCategory(data)
end

--==================================================
-- CURRENT PAGE
--==================================================

local CurrentPage = "Combat"

local function SetCategoryVisual(name, active)

    local data = CategoryButtons[name]

    if not data then
        return
    end

    if active then

        Tween(
            data.Button,
            {
                BackgroundColor3 = Colors.MenuDark,
                BackgroundTransparency = 0.05
            },
            0.24
        )

        Tween(
            data.Label,
            {
                TextColor3 = Colors.White
            },
            0.22
        )

        Tween(
            data.Indicator,
            {
                BackgroundTransparency = 0
            },
            0.22
        )

    else

        Tween(
            data.Button,
            {
                BackgroundColor3 = Colors.Background2,
                BackgroundTransparency = 0.25
            },
            0.22
        )

        Tween(
            data.Label,
            {
                TextColor3 = Colors.TextDim
            },
            0.22
        )

        Tween(
            data.Indicator,
            {
                BackgroundTransparency = 1
            },
            0.22
        )
    end
end

--==================================================
-- END PART 1
--==================================================

--==================================================
-- NEUTRALIZATION HUB v4.5
-- PART 2/4
-- CONTROLS + PAGES
--==================================================

--==================================================
-- ROW
--==================================================

local function Row(parent, text, sub)

    local row = New("Frame", {
        Parent = parent,

        Size = UDim2.new(1, -8, 0, sub and 58 or 46),

        BackgroundColor3 = Colors.Background2,
        BackgroundTransparency = 0.20,

        BorderSizePixel = 0
    })

    Corner(row, 11)

    local title = New("TextLabel", {
        Parent = row,

        Position = UDim2.new(
            0,
            14,
            0,
            sub and 8 or 0
        ),

        Size = UDim2.new(
            1,
            -28,
            0,
            sub and 22 or 46
        ),

        BackgroundTransparency = 1,

        Text = text,
        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamMedium,
        TextSize = 13,

        TextXAlignment = Enum.TextXAlignment.Left,

        TextYAlignment =
            sub
            and Enum.TextYAlignment.Top
            or Enum.TextYAlignment.Center
    })


    if sub then

        New("TextLabel", {
            Parent = row,

            Position = UDim2.new(
                0,
                14,
                0,
                31
            ),

            Size = UDim2.new(
                1,
                -28,
                0,
                18
            ),

            BackgroundTransparency = 1,

            Text = sub,
            TextColor3 = Colors.TextDim,

            Font = Enum.Font.Gotham,
            TextSize = 10,

            TextXAlignment = Enum.TextXAlignment.Left
        })

    end

    return row
end


--==================================================
-- TOGGLE
--==================================================

local function Toggle(parent, text, key, sub)

    local row = Row(
        parent,
        text,
        sub
    )

    local switch = New("TextButton", {
        Parent = row,

        AnchorPoint = Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -12,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            48,
            0,
            26
        ),

        BackgroundColor3 =
            Color3.fromRGB(43, 43, 47),

        BorderSizePixel = 0,

        Text = "",

        AutoButtonColor = false
    })

    Corner(switch, 20)


    local knob = New("Frame", {
        Parent = switch,

        Position = UDim2.new(
            0,
            4,
            0.5,
            -9
        ),

        Size = UDim2.new(
            0,
            18,
            0,
            18
        ),

        BackgroundColor3 =
            Color3.fromRGB(180, 180, 185),

        BorderSizePixel = 0
    })

    Corner(knob, 20)


    local function Update(animated)

        local enabled = Config[key]

        local duration =
            animated
            and 0.28
            or 0

        if enabled then

            Tween(
                switch,
                {
                    BackgroundColor3 =
                        Colors.Menu
                },
                duration,
                Enum.EasingStyle.Quint
            )

            Tween(
                knob,
                {
                    Position = UDim2.new(
                        1,
                        -22,
                        0.5,
                        -9
                    ),

                    BackgroundColor3 =
                        Colors.White
                },
                duration,
                Enum.EasingStyle.Back
            )

        else

            Tween(
                switch,
                {
                    BackgroundColor3 =
                        Color3.fromRGB(
                            43,
                            43,
                            47
                        )
                },
                duration,
                Enum.EasingStyle.Quint
            )

            Tween(
                knob,
                {
                    Position = UDim2.new(
                        0,
                        4,
                        0.5,
                        -9
                    ),

                    BackgroundColor3 =
                        Color3.fromRGB(
                            180,
                            180,
                            185
                        )
                },
                duration,
                Enum.EasingStyle.Back
            )
        end
    end


    switch.MouseButton1Click:Connect(function()

        Config[key] = not Config[key]

        Update(true)
    end)


    switch.MouseEnter:Connect(function()

        Tween(
            row,
            {
                BackgroundColor3 =
                    Colors.PanelHover
            },
            0.15
        )
    end)


    switch.MouseLeave:Connect(function()

        Tween(
            row,
            {
                BackgroundColor3 =
                    Colors.Background2
            },
            0.18
        )
    end)


    Update(false)

    return row
end


--==================================================
-- VALUE
--==================================================

local function Value(
    parent,
    text,
    key,
    min,
    max,
    step,
    sub
)

    local row = Row(
        parent,
        text,
        sub
    )


    local valueLabel = New("TextLabel", {
        Parent = row,

        AnchorPoint =
            Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -44,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            48,
            0,
            26
        ),

        BackgroundTransparency = 1,

        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamBold,
        TextSize = 12,

        TextXAlignment =
            Enum.TextXAlignment.Center
    })


    local minus = New("TextButton", {
        Parent = row,

        AnchorPoint =
            Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -102,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            27,
            0,
            27
        ),

        BackgroundColor3 =
            Color3.fromRGB(40, 40, 44),

        BorderSizePixel = 0,

        Text = "−",

        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamBold,
        TextSize = 16,

        AutoButtonColor = false
    })

    Corner(minus, 8)


    local plus = New("TextButton", {
        Parent = row,

        AnchorPoint =
            Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -10,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            27,
            0,
            27
        ),

        BackgroundColor3 =
            Color3.fromRGB(40, 40, 44),

        BorderSizePixel = 0,

        Text = "+",

        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamBold,
        TextSize = 16,

        AutoButtonColor = false
    })

    Corner(plus, 8)


    local function Format(value)

        if math.abs(
            value - math.floor(value)
        ) < 0.001 then

            return tostring(
                math.floor(value)
            )
        end

        return string.format(
            "%.2f",
            value
        )
    end


    local function Update()

        Config[key] = math.clamp(
            Config[key],
            min,
            max
        )

        valueLabel.Text =
            Format(Config[key])
    end


    minus.MouseButton1Click:Connect(function()

        Config[key] =
            Config[key] - step

        Update()

    end)


    plus.MouseButton1Click:Connect(function()

        Config[key] =
            Config[key] + step

        Update()

    end)


    minus.MouseEnter:Connect(function()

        Tween(
            minus,
            {
                BackgroundColor3 =
                    Colors.MenuDark
            },
            0.12
        )
    end)


    minus.MouseLeave:Connect(function()

        Tween(
            minus,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        40,
                        40,
                        44
                    )
            },
            0.12
        )
    end)


    plus.MouseEnter:Connect(function()

        Tween(
            plus,
            {
                BackgroundColor3 =
                    Colors.MenuDark
            },
            0.12
        )
    end)


    plus.MouseLeave:Connect(function()

        Tween(
            plus,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        40,
                        40,
                        44
                    )
            },
            0.12
        )
    end)


    Update()

    return row
end


--==================================================
-- SELECTOR
--==================================================

local function Selector(
    parent,
    text,
    key,
    options,
    sub
)

    local row = Row(
        parent,
        text,
        sub
    )


    local current = New("TextLabel", {
        Parent = row,

        AnchorPoint =
            Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -43,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            92,
            0,
            25
        ),

        BackgroundTransparency = 1,

        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamMedium,
        TextSize = 11,

        TextXAlignment =
            Enum.TextXAlignment.Right
    })


    local left = New("TextButton", {
        Parent = row,

        AnchorPoint =
            Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -143,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            27,
            0,
            27
        ),

        BackgroundColor3 =
            Color3.fromRGB(40, 40, 44),

        BorderSizePixel = 0,

        Text = "‹",

        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamBold,
        TextSize = 17,

        AutoButtonColor = false
    })

    Corner(left, 8)


    local right = New("TextButton", {
        Parent = row,

        AnchorPoint =
            Vector2.new(1, 0.5),

        Position = UDim2.new(
            1,
            -10,
            0.5,
            0
        ),

        Size = UDim2.new(
            0,
            27,
            0,
            27
        ),

        BackgroundColor3 =
            Color3.fromRGB(40, 40, 44),

        BorderSizePixel = 0,

        Text = "›",

        TextColor3 = Colors.Text,

        Font = Enum.Font.GothamBold,
        TextSize = 17,

        AutoButtonColor = false
    })

    Corner(right, 8)


    local index = 1

    for i, option in ipairs(options) do

        if option == Config[key] then
            index = i
            break
        end
    end


    local function Update()

        Config[key] =
            options[index]

        current.Text =
            tostring(options[index])

    end


    left.MouseButton1Click:Connect(function()

        index -= 1

        if index < 1 then
            index = #options
        end

        Update()
    end)


    right.MouseButton1Click:Connect(function()

        index += 1

        if index > #options then
            index = 1
        end

        Update()
    end)


    Update()

    return row
end


--==================================================
-- COMBAT
--==================================================

Toggle(
    CombatPage,
    "Aim Assist",
    "AimAssist",
    "Automatically follows a valid enemy"
)

Toggle(
    CombatPage,
    "Visible Only",
    "VisibleOnly",
    "Ignore enemies hidden behind walls"
)

Toggle(
    CombatPage,
    "Aim FOV",
    "AimFOV",
    "Use the centered FOV circle"
)

Value(
    CombatPage,
    "FOV Size",
    "AimFOVSize",
    25,
    500,
    5,
    "Radius of the aim field"
)

Value(
    CombatPage,
    "Smoothness",
    "AimSmoothness",
    0.05,
    0.50,
    0.01,
    "Aim movement smoothness"
)

Selector(
    CombatPage,
    "Target Part",
    "TargetPart",
    {
        "Head",
        "Body",
        "Random Part"
    },
    "Part selected by Aim Assist"
)


--==================================================
-- VISUALS
--==================================================

Toggle(
    VisualPage,
    "ESP",
    "ESP",
    "Display player visual information"
)

Toggle(
    VisualPage,
    "Model ESP",
    "ModelESP",
    "Highlight the player model directly"
)

Toggle(
    VisualPage,
    "Square Box",
    "BoxESP",
    "Display a square around the player"
)

Toggle(
    VisualPage,
    "Team Colors",
    "TeamColors",
    "Blue allies and red enemies"
)

Toggle(
    VisualPage,
    "Names",
    "Names",
    "Display player names"
)

Toggle(
    VisualPage,
    "Health",
    "Health",
    "Display player health"
)

Toggle(
    VisualPage,
    "Distance",
    "Distance",
    "Display distance to players"
)


--==================================================
-- MOVEMENT
--==================================================

Toggle(
    MovementPage,
    "Speed",
    "Speed",
    "Change movement speed"
)

Value(
    MovementPage,
    "Speed Value",
    "SpeedValue",
    16,
    100,
    1,
    "WalkSpeed"
)

Toggle(
    MovementPage,
    "Jump",
    "Jump",
    "Change jump power"
)

Value(
    MovementPage,
    "Jump Power",
    "JumpPower",
    50,
    150,
    5,
    "JumpPower"
)

Toggle(
    MovementPage,
    "Noclip",
    "Noclip",
    "Walk through physical objects"
)


--==================================================
-- SETTINGS
--==================================================
-- Здесь Settings НЕ УДАЛЯЕМ.
-- Сохраняем существующее содержимое,
-- которое было в чистой версии.
--==================================================

local SettingsInfo = New("Frame", {
    Parent = SettingsPage,

    Size = UDim2.new(
        1,
        -8,
        0,
        120
    ),

    BackgroundColor3 =
        Colors.Background2,

    BackgroundTransparency = 0.20,

    BorderSizePixel = 0
})

Corner(SettingsInfo, 12)


New("TextLabel", {
    Parent = SettingsInfo,

    Position = UDim2.new(
        0,
        16,
        0,
        14
    ),

    Size = UDim2.new(
        1,
        -32,
        0,
        25
    ),

    BackgroundTransparency = 1,

    Text = "NEUTRALIZATION HUB",

    TextColor3 = Colors.Text,

    Font = Enum.Font.GothamBold,
    TextSize = 15,

    TextXAlignment =
        Enum.TextXAlignment.Left
})


New("TextLabel", {
    Parent = SettingsInfo,

    Position = UDim2.new(
        0,
        16,
        0,
        43
    ),

    Size = UDim2.new(
        1,
        -32,
        0,
        20
    ),

    BackgroundTransparency = 1,

    Text = Config.Version,

    TextColor3 = Colors.Menu,

    Font = Enum.Font.GothamBold,
    TextSize = 12,

    TextXAlignment =
        Enum.TextXAlignment.Left
})


New("TextLabel", {
    Parent = SettingsInfo,

    Position = UDim2.new(
        0,
        16,
        0,
        70
    ),

    Size = UDim2.new(
        1,
        -32,
        0,
        35
    ),

    BackgroundTransparency = 1,

    Text = "Menu settings and information",

    TextColor3 = Colors.TextDim,

    Font = Enum.Font.Gotham,
    TextSize = 10,

    TextXAlignment =
        Enum.TextXAlignment.Left
})


--==================================================
-- PAGE SWITCHING
--==================================================

local PageDescriptions = {
    Combat = "Combat functions",
    Visuals = "Visual functions",
    Movement = "Movement functions",
    Settings = "Menu settings"
}


local function SwitchPage(name)

    if not Pages[name] then
        return
    end

    if CurrentPage == name then
        return
    end

    local oldPage = Pages[CurrentPage]
    local newPage = Pages[name]

    CurrentPage = name

    PageTitle.Text = name
    PageDescription.Text =
        PageDescriptions[name]
        or ""


    SetCategoryVisual(
        name,
        true
    )

    for pageName, page in pairs(Pages) do

        if pageName ~= name then

            SetCategoryVisual(
                pageName,
                false
            )

        end
    end


    -- плавный переход страницы

    newPage.Position =
        UDim2.new(
            0,
            35,
            0,
            67
        )

    newPage.Visible = true

    Tween(
        newPage,
        {
            Position =
                UDim2.new(
                    0,
                    12,
                    0,
                    67
                )
        },
        0.34,
        Enum.EasingStyle.Quint
    )


    if oldPage then

        Tween(
            oldPage,
            {
                Position =
                    UDim2.new(
                        0,
                        -20,
                        0,
                        67
                    )
            },
            0.20,
            Enum.EasingStyle.Quint
        )

        task.delay(
            0.21,
            function()

                if CurrentPage ~= name then
                    oldPage.Visible = false
                end

            end
        )
    end
end


for name, data in pairs(CategoryButtons) do

    data.Button.MouseButton1Click:Connect(function()
        SwitchPage(name)
    end)

end


--==================================================
-- INITIAL CATEGORY
--==================================================

CurrentPage = "Combat"

SetCategoryVisual(
    "Combat",
    true
)

for name in pairs(CategoryButtons) do

    if name ~= "Combat" then
        SetCategoryVisual(
            name,
            false
        )
    end

end


--==================================================
-- END PART 2/4
--==================================================

--==================================================
-- NEUTRALIZATION HUB v4.5
-- PART 3/4
--==================================================

--==================================================
-- MAIN WINDOW DRAG
--==================================================

local DraggingMain = false
local MainDragStart = nil
local MainStartPos = nil

TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		DraggingMain = true
		MainDragStart = input.Position
		MainStartPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				DraggingMain = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not DraggingMain then
		return
	end

	if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	local delta = input.Position - MainDragStart

	Main.Position = UDim2.new(
		MainStartPos.X.Scale,
		MainStartPos.X.Offset + delta.X,
		MainStartPos.Y.Scale,
		MainStartPos.Y.Offset + delta.Y
	)
end)

--==================================================
-- FLOATING N BUTTON
--==================================================

local Floating = New("TextButton", {
	Name = "FloatingN",
	Parent = ScreenGui,
	Size = UDim2.new(0, 58, 0, 58),
	Position = UDim2.new(0.5, -29, 0.5, -29),
	BackgroundColor3 = Colors.Menu,
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Text = "N",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 24,
	Font = Enum.Font.GothamBold,
	AutoButtonColor = false,
	Visible = false,
	ZIndex = 100
})

Corner(Floating, 999)
Stroke(Floating, Colors.Menu, 1.5, 0.15)

local FloatingScale = New("UIScale", {
	Parent = Floating,
	Scale = 0.65
})

local FloatingGlow = New("Frame", {
	Name = "Glow",
	Parent = Floating,
	Size = UDim2.new(1, 14, 1, 14),
	Position = UDim2.new(0, -7, 0, -7),
	BackgroundColor3 = Colors.Menu,
	BackgroundTransparency = 0.82,
	BorderSizePixel = 0,
	ZIndex = 99
})

Corner(FloatingGlow, 999)

local FloatingText = New("TextLabel", {
	Name = "Letter",
	Parent = Floating,
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "N",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 25,
	Font = Enum.Font.GothamBold,
	ZIndex = 102
})

local floatingPos = UDim2.new(0.5, -29, 0.5, -29)

Floating.Position = floatingPos

--==================================================
-- FLOATING BUTTON DRAG
--==================================================

local DraggingFloating = false
local FloatingDragStart = nil
local FloatingStartPos = nil
local FloatingMoved = false

Floating.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		DraggingFloating = true
		FloatingMoved = false
		FloatingDragStart = input.Position
		FloatingStartPos = Floating.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				DraggingFloating = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not DraggingFloating then
		return
	end

	if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	local delta = input.Position - FloatingDragStart

	if math.abs(delta.X) > 4 or math.abs(delta.Y) > 4 then
		FloatingMoved = true
	end

	Floating.Position = UDim2.new(
		FloatingStartPos.X.Scale,
		FloatingStartPos.X.Offset + delta.X,
		FloatingStartPos.Y.Scale,
		FloatingStartPos.Y.Offset + delta.Y
	)

	floatingPos = Floating.Position
end)

--==================================================
-- MINIMIZE / RESTORE ANIMATION
--==================================================

local MenuMinimized = false
local MenuAnimating = false

local function ShowFloatingButton()
	Floating.Visible = true
	Floating.Position = floatingPos
	Floating.BackgroundTransparency = 1
	FloatingScale.Scale = 0.45
	FloatingGlow.BackgroundTransparency = 1
	FloatingText.TextTransparency = 1

	Tween(
		FloatingScale,
		TweenInfo.new(
			0.42,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{Scale = 1}
	)

	Tween(
		Floating,
		TweenInfo.new(
			0.30,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{BackgroundTransparency = 0}
	)

	Tween(
		FloatingGlow,
		TweenInfo.new(
			0.45,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{BackgroundTransparency = 0.82}
	)

	Tween(
		FloatingText,
		TweenInfo.new(
			0.30,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{TextTransparency = 0}
	)
end

local function HideFloatingButton()
	Tween(
		FloatingScale,
		TweenInfo.new(
			0.22,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{Scale = 0.55}
	)

	Tween(
		Floating,
		TweenInfo.new(
			0.20,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{BackgroundTransparency = 1}
	)

	Tween(
		FloatingGlow,
		TweenInfo.new(
			0.20,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{BackgroundTransparency = 1}
	)

	Tween(
		FloatingText,
		TweenInfo.new(
			0.15,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{TextTransparency = 1}
	)

	task.delay(0.23, function()
		if not MenuMinimized then
			Floating.Visible = false
		end
	end)
end

local function MinimizeMenu()
	if MenuAnimating or MenuMinimized then
		return
	end

	MenuAnimating = true
	MenuMinimized = true

	-- N появляется уже во время сворачивания
	ShowFloatingButton()

	-- Сильное плавное уменьшение меню
	Tween(
		MainScale,
		TweenInfo.new(
			0.46,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{Scale = 0.72}
	)

	Tween(
		Main,
		TweenInfo.new(
			0.34,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{BackgroundTransparency = 1}
	)

	Tween(
		Main,
		TweenInfo.new(
			0.38,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.In
		),
		{Rotation = 2}
	)

	task.delay(0.40, function()
		Main.Visible = false
		Main.Rotation = 0
		MainScale.Scale = 1
		Main.BackgroundTransparency = 0

		MenuAnimating = false
	end)
end

local function RestoreMenu()
	if MenuAnimating or not MenuMinimized then
		return
	end

	MenuAnimating = true
	MenuMinimized = false

	-- Сначала скрываем N
	HideFloatingButton()

	-- Потом возвращаем меню
	Main.Visible = true
	Main.Rotation = -2
	Main.BackgroundTransparency = 1
	MainScale.Scale = 0.72

	Tween(
		MainScale,
		TweenInfo.new(
			0.55,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{Scale = 1}
	)

	Tween(
		Main,
		TweenInfo.new(
			0.40,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{BackgroundTransparency = 0}
	)

	Tween(
		Main,
		TweenInfo.new(
			0.48,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{Rotation = 0}
	)

	task.delay(0.50, function()
		MainScale.Scale = 1
		Main.Rotation = 0
		Main.BackgroundTransparency = 0
		MenuAnimating = false
	end)
end

MinimizeButton.MouseButton1Click:Connect(function()
	MinimizeMenu()
end)

Floating.MouseButton1Click:Connect(function()
	if FloatingMoved then
		FloatingMoved = false
		return
	end

	RestoreMenu()
end)

CloseButton.MouseButton1Click:Connect(function()
	MinimizeMenu()
end)

--==================================================
-- FOV CIRCLE
--==================================================

local FOVFrame = New("Frame", {
	Name = "AimFOVCircle",
	Parent = ScreenGui,
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	Size = UDim2.new(0, Config.FOVSize, 0, Config.FOVSize),
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Visible = false,
	ZIndex = 5
})

Corner(FOVFrame, 999)

local FOVStroke = Stroke(
	FOVFrame,
	Colors.Menu,
	1.5,
	0.15
)

--==================================================
-- FOV CENTER UPDATE
--==================================================

local function UpdateFOVCircle()
	local Camera = workspace.CurrentCamera

	if not Camera then
		return
	end

	local viewport = Camera.ViewportSize

	FOVFrame.Position = UDim2.fromOffset(
		viewport.X / 2,
		viewport.Y / 2
	)

	FOVFrame.Size = UDim2.fromOffset(
		Config.FOVSize,
		Config.FOVSize
	)

	FOVFrame.Visible =
		Config.AimAssist
		and Config.AimFOV
end

Config.FOVSize = Config.FOVSize or 250

--==================================================
-- TARGET HELPERS
--==================================================

local function GetCharacter(player)
	if not player then
		return nil
	end

	local character = player.Character

	if not character then
		return nil
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if not humanoid or humanoid.Health <= 0 then
		return nil
	end

	return character
end

local function IsFriendly(player)
	if not player or player == LocalPlayer then
		return true
	end

	-- Командники НИКОГДА не являются целью Aim Assist.
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

	if Config.TargetPart == "Head" then
		return character:FindFirstChild("Head")
	end

	if Config.TargetPart == "Body" then
		return character:FindFirstChild("HumanoidRootPart")
			or character:FindFirstChild("UpperTorso")
			or character:FindFirstChild("Torso")
	end

	-- Random Part
	local Parts = {}

	for _, obj in ipairs(character:GetChildren()) do
		if obj:IsA("BasePart")
			and obj.Transparency < 1
			and obj.Name ~= "HumanoidRootPart" then

			table.insert(Parts, obj)
		end
	end

	if #Parts == 0 then
		return character:FindFirstChild("Head")
	end

	return Parts[math.random(1, #Parts)]
end

--==================================================
-- VISIBILITY CHECK
--==================================================

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Exclude

local function IsVisible(player, part)
	if not player or not part then
		return false
	end

	local character = GetCharacter(player)

	if not character then
		return false
	end

	local Camera = workspace.CurrentCamera

	if not Camera then
		return false
	end

	local origin = Camera.CFrame.Position
	local direction = part.Position - origin

	RayParams.FilterDescendantsInstances = {
		LocalPlayer.Character
	}

	local result = workspace:Raycast(
		origin,
		direction,
		RayParams
	)

	if not result then
		return true
	end

	return result.Instance:IsDescendantOf(character)
end

--==================================================
-- BEST TARGET
--==================================================

local function GetBestTarget()
	local Camera = workspace.CurrentCamera

	if not Camera then
		return nil, nil
	end

	local viewport = Camera.ViewportSize
	local center = Vector2.new(
		viewport.X / 2,
		viewport.Y / 2
	)

	local bestPlayer = nil
	local bestPart = nil
	local bestDistance = math.huge

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer
			and not IsFriendly(player) then

			local character = GetCharacter(player)

			if character then
				local part = GetTargetPart(character)

				if part then
					local screenPos, onScreen =
						Camera:WorldToViewportPoint(part.Position)

					if onScreen and screenPos.Z > 0 then
						local screenDistance =
							(Vector2.new(
								screenPos.X,
								screenPos.Y
							) - center).Magnitude

						local allowed =
							not Config.AimFOV
							or screenDistance <= Config.FOVSize / 2

						if allowed then
							local visible =
								not Config.VisibleOnly
								or IsVisible(player, part)

							if visible
								and screenDistance < bestDistance then

								bestDistance = screenDistance
								bestPlayer = player
								bestPart = part
							end
						end
					end
				end
			end
		end
	end

	return bestPlayer, bestPart
end

--==================================================
-- ESP STORAGE
--==================================================

local ESPObjects = {}

--==================================================
-- ESP COLOR
--==================================================

local function GetESPColor(player)
	if Config.TeamColors then
		if player == LocalPlayer then
			return Color3.fromRGB(80, 150, 255)
		end

		if LocalPlayer.Team ~= nil
			and player.Team ~= nil
			and LocalPlayer.Team == player.Team then

			return Color3.fromRGB(80, 150, 255)
		end

		return Color3.fromRGB(255, 70, 70)
	end

	return Colors.Menu
end

--==================================================
-- CREATE ESP
--==================================================

local function CreateESP(player)
	if not player or player == LocalPlayer then
		return
	end

	if ESPObjects[player] then
		return ESPObjects[player]
	end

	local data = {}

	-- Square Box
	local Billboard = New("BillboardGui", {
		Name = "NeutralizationESP",
		Parent = ScreenGui,
		Adornee = nil,
		Size = UDim2.fromOffset(70, 70),
		StudsOffset = Vector3.new(0, 1.2, 0),
		AlwaysOnTop = true,
		Enabled = false
	})

	local Box = New("Frame", {
		Name = "SquareBox",
		Parent = Billboard,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	})

	Stroke(Box, Colors.Menu, 1.5, 0)

	local Info = New("Frame", {
		Name = "Info",
		Parent = Billboard,
		Size = UDim2.new(1, 0, 0, 42),
		Position = UDim2.new(0, 0, 1, 4),
		BackgroundTransparency = 1
	})

	local NameLabel = New("TextLabel", {
		Name = "Name",
		Parent = Info,
		Size = UDim2.new(1, 0, 0, 14),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		Text = player.DisplayName,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeTransparency = 0.25,
		TextSize = 11,
		Font = Enum.Font.GothamBold
	})

	local HealthLabel = New("TextLabel", {
		Name = "Health",
		Parent = Info,
		Size = UDim2.new(1, 0, 0, 14),
		Position = UDim2.new(0, 0, 0, 14),
		BackgroundTransparency = 1,
		Text = "",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeTransparency = 0.25,
		TextSize = 10,
		Font = Enum.Font.Gotham
	})

	local DistanceLabel = New("TextLabel", {
		Name = "Distance",
		Parent = Info,
		Size = UDim2.new(1, 0, 0, 14),
		Position = UDim2.new(0, 0, 0, 28),
		BackgroundTransparency = 1,
		Text = "",
		TextColor3 = Color3.fromRGB(210, 210, 210),
		TextStrokeTransparency = 0.25,
		TextSize = 10,
		Font = Enum.Font.Gotham
	})

	data.Billboard = Billboard
	data.Box = Box
	data.Info = Info
	data.NameLabel = NameLabel
	data.HealthLabel = HealthLabel
	data.DistanceLabel = DistanceLabel

	-- Model ESP
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "NeutralizationModelESP"
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.FillTransparency = 0.82
	Highlight.OutlineTransparency = 0
	Highlight.Enabled = false

	data.Highlight = Highlight

	ESPObjects[player] = data

	return data
end

--==================================================
-- REMOVE ESP
--==================================================

local function RemoveESP(player)
	local data = ESPObjects[player]

	if not data then
		return
	end

	if data.Billboard then
		data.Billboard:Destroy()
	end

	if data.Highlight then
		data.Highlight:Destroy()
	end

	ESPObjects[player] = nil
end

--==================================================
-- CHARACTER ESP SETUP
--==================================================

local function SetupCharacterESP(player, character)
	if player == LocalPlayer then
		return
	end

	local data = CreateESP(player)

	if not data then
		return
	end

	local root =
		character:FindFirstChild("HumanoidRootPart")
		or character:FindFirstChild("UpperTorso")
		or character:FindFirstChild("Torso")

	if root then
		data.Billboard.Adornee = root
	end

	-- Highlight directly on character
	if data.Highlight then
		data.Highlight.Adornee = character
		data.Highlight.Parent = character
	end
end

--==================================================
-- PLAYER ESP INITIALIZATION
--==================================================

for _, player in ipairs(Players:GetPlayers()) do
	if player ~= LocalPlayer then
		CreateESP(player)

		if player.Character then
			SetupCharacterESP(
				player,
				player.Character
			)
		end
	end
end

--==================================================
-- END PART 3/4
--==================================================

--==================================================
-- NEUTRALIZATION HUB v4.5
-- PART 4/4
--==================================================

--==================================================
-- AIM SYSTEM
--==================================================

local function AimAt(part)
	if not part then
		return
	end

	local Camera = workspace.CurrentCamera

	if not Camera then
		return
	end

	local cameraPosition = Camera.CFrame.Position
	local targetPosition = part.Position

	local smoothness = tonumber(Config.Smoothness) or 0.15

	-- Чем меньше значение, тем плавнее движение.
	local alpha = math.clamp(
		smoothness * 0.35,
		0.01,
		0.35
	)

	local targetCFrame = CFrame.lookAt(
		cameraPosition,
		targetPosition
	)

	Camera.CFrame = Camera.CFrame:Lerp(
		targetCFrame,
		alpha
	)
end

--==================================================
-- ESP UPDATE
--==================================================

local function UpdateESP()
	for player, data in pairs(ESPObjects) do
		if not player
			or not player.Parent
			or player == LocalPlayer then

			RemoveESP(player)
			continue
		end

		local character = GetCharacter(player)

		if not character then
			data.Billboard.Enabled = false

			if data.Highlight then
				data.Highlight.Enabled = false
			end

			continue
		end

		local humanoid =
			character:FindFirstChildOfClass("Humanoid")

		local root =
			character:FindFirstChild("HumanoidRootPart")
			or character:FindFirstChild("UpperTorso")
			or character:FindFirstChild("Torso")

		if not root then
			continue
		end

		local color = GetESPColor(player)

		--==========================================
		-- SQUARE BOX
		--==========================================

		if Config.ESP and Config.SquareBox then
			data.Billboard.Enabled = true
			data.Billboard.Adornee = root

			local camera =
				workspace.CurrentCamera

			if camera then
				local distance =
					(camera.CFrame.Position - root.Position).Magnitude

				local boxSize =
					math.clamp(
						1700 / math.max(distance, 1),
						35,
						110
					)

				data.Billboard.Size =
					UDim2.fromOffset(
						boxSize,
						boxSize
					)
			end

			local boxStroke =
				data.Box:FindFirstChildOfClass(
					"UIStroke"
				)

			if boxStroke then
				boxStroke.Color = color
				boxStroke.Transparency = 0
			end
		else
			data.Billboard.Enabled = false
		end

		--==========================================
		-- NAME
		--==========================================

		data.NameLabel.Visible =
			Config.ESP
			and Config.Names

		if Config.Names then
			data.NameLabel.Text =
				player.DisplayName
		end

		--==========================================
		-- HEALTH
		--==========================================

		data.HealthLabel.Visible =
			Config.ESP
			and Config.Health

		if humanoid and Config.Health then
			data.HealthLabel.Text =
				"HP: "
				.. math.floor(humanoid.Health)
				.. " / "
				.. math.floor(humanoid.MaxHealth)
		end

		--==========================================
		-- DISTANCE
		--==========================================

		data.DistanceLabel.Visible =
			Config.ESP
			and Config.Distance

		if Config.Distance then
			local camera =
				workspace.CurrentCamera

			if camera then
				local distance =
					(camera.CFrame.Position - root.Position).Magnitude

				data.DistanceLabel.Text =
					math.floor(distance) .. " studs"
			end
		end

		--==========================================
		-- MODEL ESP
		--==========================================

		if Config.ESP and Config.ModelESP then
			data.Highlight.Enabled = true
			data.Highlight.Adornee = character
			data.Highlight.FillColor = color
			data.Highlight.OutlineColor = color
			data.Highlight.FillTransparency = 0.82
			data.Highlight.OutlineTransparency = 0
		else
			data.Highlight.Enabled = false
		end
	end
end

--==================================================
-- NOCLIP
--==================================================

local function UpdateNoclip()
	local character = LocalPlayer.Character

	if not character then
		return
	end

	for _, object in ipairs(character:GetDescendants()) do
		if object:IsA("BasePart") then
			object.CanCollide = not Config.Noclip
		end
	end
end

--==================================================
-- MOVEMENT
--==================================================

local function UpdateMovement()
	local character = LocalPlayer.Character

	if not character then
		return
	end

	local humanoid =
		character:FindFirstChildOfClass("Humanoid")

	if not humanoid then
		return
	end

	if Config.Speed then
		humanoid.WalkSpeed =
			math.clamp(
				tonumber(Config.SpeedValue) or 16,
				16,
				100
			)
	else
		humanoid.WalkSpeed = 16
	end

	if Config.Jump then
		humanoid.UseJumpPower = true
		humanoid.JumpPower =
			math.clamp(
				tonumber(Config.JumpPower) or 50,
				50,
				150
			)
	else
		humanoid.UseJumpPower = true
		humanoid.JumpPower = 50
	end
end

--==================================================
-- AIM UPDATE
--==================================================

local AimCooldown = 0

local function UpdateAim(deltaTime)
	if not Config.AimAssist then
		return
	end

	AimCooldown += deltaTime

	-- Не дёргаем камеру каждый микротик.
	if AimCooldown < 0.01 then
		return
	end

	AimCooldown = 0

	local targetPlayer, targetPart =
		GetBestTarget()

	if targetPlayer and targetPart then
		AimAt(targetPart)
	end
end

--==================================================
-- FOV UPDATE
--==================================================

local LastFOVSize = Config.FOVSize

local function CheckFOV()
	if LastFOVSize ~= Config.FOVSize then
		LastFOVSize = Config.FOVSize

		UpdateFOVCircle()
	end

	local camera = workspace.CurrentCamera

	if camera then
		local viewport = camera.ViewportSize

		FOVFrame.Position =
			UDim2.fromOffset(
				viewport.X / 2,
				viewport.Y / 2
			)
	end

	FOVFrame.Visible =
		Config.AimAssist
		and Config.AimFOV
end

--==================================================
-- RENDER LOOP
--==================================================

local ESPTimer = 0
local MovementTimer = 0

RunService.RenderStepped:Connect(function(deltaTime)

	-- Aim
	UpdateAim(deltaTime)

	-- FOV
	CheckFOV()

	-- Noclip
	if Config.Noclip then
		UpdateNoclip()
	end

	-- Movement
	MovementTimer += deltaTime

	if MovementTimer >= 0.05 then
		MovementTimer = 0
		UpdateMovement()
	end

	-- ESP
	ESPTimer += deltaTime

	if ESPTimer >= 0.05 then
		ESPTimer = 0
		UpdateESP()
	end
end)

--==================================================
-- PLAYER EVENTS
--==================================================

local CharacterConnections = {}

local function ConnectCharacter(player, character)
	if player == LocalPlayer then
		return
	end

	if CharacterConnections[player] then
		CharacterConnections[player]:Disconnect()
		CharacterConnections[player] = nil
	end

	local data = CreateESP(player)

	if data then
		SetupCharacterESP(
			player,
			character
		)
	end

	local humanoid =
		character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		CharacterConnections[player] =
			humanoid.Died:Connect(function()
				if data then
					data.Billboard.Enabled = false

					if data.Highlight then
						data.Highlight.Enabled = false
					end
				end
			end)
	end
end

Players.PlayerAdded:Connect(function(player)

	CreateESP(player)

	player.CharacterAdded:Connect(function(character)
		task.wait(0.15)

		if player.Parent then
			ConnectCharacter(
				player,
				character
			)
		end
	end)

	if player.Character then
		task.spawn(function()
			task.wait(0.15)

			if player.Parent then
				ConnectCharacter(
					player,
					player.Character
				)
			end
		end)
	end
end)

Players.PlayerRemoving:Connect(function(player)

	if CharacterConnections[player] then
		CharacterConnections[player]:Disconnect()
		CharacterConnections[player] = nil
	end

	RemoveESP(player)
end)

--==================================================
-- LOCAL CHARACTER
--==================================================

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.2)

	UpdateMovement()

	if Config.Noclip then
		UpdateNoclip()
	end
end)

--==================================================
-- CATEGORY BUTTON EFFECTS
--==================================================

for name, button in pairs(CategoryButtons) do

	button.MouseEnter:Connect(function()
		if CurrentPage ~= name then
			Tween(
				button,
				TweenInfo.new(
					0.18,
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				),
				{
					BackgroundTransparency = 0.78
				}
			)
		end
	end)

	button.MouseLeave:Connect(function()
		if CurrentPage ~= name then
			Tween(
				button,
				TweenInfo.new(
					0.18,
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				),
				{
					BackgroundTransparency = 1
				}
			)
		end
	end)

end

--==================================================
-- CONTROL UPDATE CONNECTIONS
--==================================================

local function RefreshAll()
	UpdateFOVCircle()
	UpdateMovement()
	UpdateNoclip()
	UpdateESP()
end

--==================================================
-- INITIAL STATE
--==================================================

Config.AimAssist = Config.AimAssist or false
Config.VisibleOnly = Config.VisibleOnly or false
Config.AimFOV = Config.AimFOV or false

Config.FOVSize =
	math.clamp(
		tonumber(Config.FOVSize) or 250,
		25,
		500
	)

Config.Smoothness =
	math.clamp(
		tonumber(Config.Smoothness) or 0.15,
		0.05,
		0.50
	)

Config.TargetPart =
	Config.TargetPart or "Head"

Config.ESP = Config.ESP or false
Config.ModelESP = Config.ModelESP or false
Config.SquareBox = Config.SquareBox or false
Config.TeamColors = Config.TeamColors or true
Config.Names = Config.Names or false
Config.Health = Config.Health or false
Config.Distance = Config.Distance or false

Config.Speed = Config.Speed or false
Config.SpeedValue =
	math.clamp(
		tonumber(Config.SpeedValue) or 16,
		16,
		100
	)

Config.Jump = Config.Jump or false
Config.JumpPower =
	math.clamp(
		tonumber(Config.JumpPower) or 50,
		50,
		150
	)

Config.Noclip = Config.Noclip or false

RefreshAll()

--==================================================
-- STARTUP ANIMATION
--==================================================

Main.Visible = true
MainScale.Scale = 0.72
Main.BackgroundTransparency = 1
Main.Rotation = -2

for _, object in ipairs(Main:GetDescendants()) do
	if object:IsA("TextLabel")
		or object:IsA("TextButton") then

		object.TextTransparency = 1

	elseif object:IsA("ImageLabel")
		or object:IsA("ImageButton") then

		object.ImageTransparency = 1
	end
end

task.spawn(function()

	task.wait(0.05)

	Tween(
		MainScale,
		TweenInfo.new(
			0.65,
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		),
		{
			Scale = 1
		}
	)

	Tween(
		Main,
		TweenInfo.new(
			0.48,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			BackgroundTransparency = 0,
			Rotation = 0
		}
	)

	task.wait(0.18)

	for _, object in ipairs(Main:GetDescendants()) do

		if object:IsA("TextLabel")
			or object:IsA("TextButton") then

			Tween(
				object,
				TweenInfo.new(
					0.32,
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				),
				{
					TextTransparency = 0
				}
			)

		elseif object:IsA("ImageLabel")
			or object:IsA("ImageButton") then

			Tween(
				object,
				TweenInfo.new(
					0.32,
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				),
				{
					ImageTransparency = 0
				}
			)

		end

	end

end)

--==================================================
-- INITIAL CATEGORY
--==================================================

SwitchPage("Combat")

--==================================================
-- FINAL FOV POSITION
--==================================================

task.defer(function()
	UpdateFOVCircle()
	UpdateMovement()
	UpdateESP()
end)

--==================================================
-- LOADED
--==================================================

print(
	"[Neutralization Hub] "
	.. Config.Version
	.. " loaded successfully."
)

--==================================================
-- END PART 4/4
--==================================================
