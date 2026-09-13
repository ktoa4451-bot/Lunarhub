--==================================================
-- NEUTRALIZATION HUB
-- CLEAN BUILD
--==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==================================================
-- CONFIG
--==================================================

local Config = {
    AimAssist = false,
    VisibleOnly = true,
    AimFOV = true,
    AimFOVSize = 150,
    AimSmoothness = 0.18,
    TargetPart = "Head",

    ESP = false,
    ModelESP = true,
    BoxESP = true,
    TeamColors = true,
    Names = false,
    Health = false,
    Distance = false,

    Speed = false,
    SpeedValue = 16,
    Jump = false,
    JumpPower = 50,
    Noclip = false,

    Version = "v32.0"
}

--==================================================
-- COLORS
--==================================================

local Colors = {
    Background = Color3.fromRGB(18,18,18),
    Panel = Color3.fromRGB(24,24,24),
    Menu = Color3.fromRGB(190,25,25),
    MenuDark = Color3.fromRGB(130,20,20),
    Card = Color3.fromRGB(30,30,30),
    CardHover = Color3.fromRGB(38,38,38),
    Text = Color3.fromRGB(240,240,240),
    SubText = Color3.fromRGB(155,155,155),
    Off = Color3.fromRGB(65,65,65),
    Border = Color3.fromRGB(55,55,55),

    Friendly = Color3.fromRGB(55,150,255),
    Enemy = Color3.fromRGB(255,55,55)
}

--==================================================
-- CLEAN OLD GUI
--==================================================

pcall(function()
    local old = CoreGui:FindFirstChild("NeutralizationHub")
    if old then
        old:Destroy()
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

    object.Parent = parent
    return object
end

local function Tween(object, properties, duration)
    local info = TweenInfo.new(
        duration or 0.2,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    )

    local animation = TweenService:Create(
        object,
        info,
        properties
    )

    animation:Play()
    return animation
end

local function Corner(object, radius)
    New("UICorner", {
        CornerRadius = UDim.new(0, radius or 8)
    }, object)
end

--==================================================
-- GUI
--==================================================

local Gui = New("ScreenGui", {
    Name = "NeutralizationHub",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, nil)

pcall(function()
    Gui.Parent = CoreGui
end)

if not Gui.Parent then
    Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

--==================================================
-- MAIN
--==================================================

local Main = New("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(520,320),
    Position = UDim2.new(0.5,-260,0.5,-160),
    BackgroundColor3 = Colors.Background,
    BorderSizePixel = 0,
    ClipsDescendants = true
}, Gui)

Corner(Main,10)

New("UIStroke", {
    Color = Colors.Border,
    Thickness = 1,
    Transparency = 0.15
}, Main)

local MainScale = New("UIScale", {
    Scale = 0.92
}, Main)

--==================================================
-- TOP BAR
--==================================================

local TopBar = New("Frame", {
    Size = UDim2.new(1,0,0,48),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0
}, Main)

--==================================================
-- LOGO
--==================================================

local Logo = New("TextLabel", {
    Size = UDim2.fromOffset(38,38),
    Position = UDim2.fromOffset(10,5),
    BackgroundColor3 = Colors.Menu,
    Text = "N",
    TextColor3 = Colors.Text,
    TextSize = 21,
    Font = Enum.Font.GothamBold
}, TopBar)

Corner(Logo,8)

--==================================================
-- TITLE
--==================================================

New("TextLabel", {
    Size = UDim2.fromOffset(220,25),
    Position = UDim2.fromOffset(58,5),
    BackgroundTransparency = 1,
    Text = "NEUTRALIZATION HUB",
    TextColor3 = Colors.Text,
    TextSize = 17,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, TopBar)

New("TextLabel", {
    Size = UDim2.fromOffset(70,18),
    Position = UDim2.fromOffset(59,28),
    BackgroundTransparency = 1,
    Text = Config.Version,
    TextColor3 = Colors.Menu,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, TopBar)

--==================================================
-- MINIMIZE
--==================================================

local MinimizeButton = New("TextButton", {
    Size = UDim2.fromOffset(30,30),
    Position = UDim2.new(1,-74,0,9),
    BackgroundColor3 = Color3.fromRGB(35,35,35),
    Text = "—",
    TextColor3 = Colors.Text,
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false
}, TopBar)

Corner(MinimizeButton,15)

--==================================================
-- CLOSE
--==================================================

local CloseButton = New("TextButton", {
    Size = UDim2.fromOffset(30,30),
    Position = UDim2.new(1,-38,0,9),
    BackgroundColor3 = Color3.fromRGB(35,35,35),
    Text = "×",
    TextColor3 = Colors.Text,
    TextSize = 18,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false
}, TopBar)

Corner(CloseButton,15)

CloseButton.MouseEnter:Connect(function()
    Tween(CloseButton,{
        BackgroundColor3 = Colors.Menu
    },0.15)
end)

CloseButton.MouseLeave:Connect(function()
    Tween(CloseButton,{
        BackgroundColor3 = Color3.fromRGB(35,35,35)
    },0.15)
end)

MinimizeButton.MouseEnter:Connect(function()
    Tween(MinimizeButton,{
        BackgroundColor3 = Colors.Menu
    },0.15)
end)

MinimizeButton.MouseLeave:Connect(function()
    Tween(MinimizeButton,{
        BackgroundColor3 = Color3.fromRGB(35,35,35)
    },0.15)
end)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = New("Frame", {
    Size = UDim2.new(0,145,1,-58),
    Position = UDim2.fromOffset(8,52),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0
}, Main)

Corner(Sidebar,8)

New("UIPadding", {
    PaddingTop = UDim.new(0,8),
    PaddingLeft = UDim.new(0,6),
    PaddingRight = UDim.new(0,6)
}, Sidebar)

New("UIListLayout", {
    Padding = UDim.new(0,5),
    SortOrder = Enum.SortOrder.LayoutOrder
}, Sidebar)

--==================================================
-- CONTENT
--==================================================

local Content = New("Frame", {
    Size = UDim2.new(1,-165,1,-58),
    Position = UDim2.fromOffset(157,52),
    BackgroundColor3 = Colors.Panel,
    BorderSizePixel = 0,
    ClipsDescendants = true
}, Main)

Corner(Content,8)

--==================================================
-- PAGES
--==================================================

local Pages = {}

local function CreatePage(name)
    local page = New("ScrollingFrame", {
        Name = name,
        Size = UDim2.new(1,-12,1,-12),
        Position = UDim2.fromOffset(6,6),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Colors.Menu,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0,0,0,0),
        Visible = false
    }, Content)

    New("UIPadding", {
        PaddingTop = UDim.new(0,5),
        PaddingBottom = UDim.new(0,8),
        PaddingLeft = UDim.new(0,5),
        PaddingRight = UDim.new(0,5)
    }, page)

    New("UIListLayout", {
        Padding = UDim.new(0,7),
        SortOrder = Enum.SortOrder.LayoutOrder
    }, page)

    Pages[name] = page
    return page
end

local CombatPage = CreatePage("Combat")
local VisualPage = CreatePage("Visuals")
local MovementPage = CreatePage("Movement")
local SettingsPage = CreatePage("Settings")

--==================================================
-- PAGE HEADER
--==================================================

local function CreatePageHeader(parent,title,subtitle)
    local frame = New("Frame", {
        Size = UDim2.new(1,-10,0,52),
        BackgroundColor3 = Colors.Card,
        BorderSizePixel = 0
    }, parent)

    Corner(frame,7)

    New("TextLabel", {
        Size = UDim2.new(1,-20,0,24),
        Position = UDim2.fromOffset(10,5),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Colors.Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left
    }, frame)

    New("TextLabel", {
        Size = UDim2.new(1,-20,0,18),
        Position = UDim2.fromOffset(10,29),
        BackgroundTransparency = 1,
        Text = subtitle,
        TextColor3 = Colors.SubText,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left
    }, frame)
end

CreatePageHeader(
    CombatPage,
    "Combat",
    "Aim and targeting"
)

CreatePageHeader(
    VisualPage,
    "Visuals",
    "ESP and player visuals"
)

CreatePageHeader(
    MovementPage,
    "Movement",
    "Movement controls"
)

CreatePageHeader(
    SettingsPage,
    "Settings",
    "Neutralization Hub settings"
)

--==================================================
-- CATEGORY BUTTONS
--==================================================

local CategoryButtons = {}

local function CreateCategory(text,page,order)
    local button = New("TextButton", {
        Size = UDim2.new(1,-12,0,38),
        BackgroundColor3 = Color3.fromRGB(29,29,29),
        BorderSizePixel = 0,
        Text = text,
        TextColor3 = Colors.SubText,
        TextSize = 12,
        Font = Enum.Font.GothamSemibold,
        AutoButtonColor = false,
        LayoutOrder = order
    }, Sidebar)

    Corner(button,7)

    CategoryButtons[page] = button

    button.MouseEnter:Connect(function()
        if page.Visible == false then
            Tween(button,{
                BackgroundColor3 = Colors.CardHover,
                TextColor3 = Colors.Text
            },0.15)
        end
    end)

    button.MouseLeave:Connect(function()
        if page.Visible == false then
            Tween(button,{
                BackgroundColor3 = Color3.fromRGB(29,29,29),
                TextColor3 = Colors.SubText
            },0.15)
        end
    end)

    return button
end

CreateCategory("Combat",CombatPage,1)
CreateCategory("Visuals",VisualPage,2)
CreateCategory("Movement",MovementPage,3)
CreateCategory("Settings",SettingsPage,4)

--==================================================
-- PAGE SWITCH
--==================================================

local CurrentPage = CombatPage

local function SwitchPage(page)
    if CurrentPage == page then
        return
    end

    for _,other in pairs(Pages) do
        other.Visible = false
    end

    page.Visible = true

    for p,button in pairs(CategoryButtons) do
        if p == page then
            Tween(button,{
                BackgroundColor3 = Colors.MenuDark,
                TextColor3 = Colors.Text
            },0.2)
        else
            Tween(button,{
                BackgroundColor3 = Color3.fromRGB(29,29,29),
                TextColor3 = Colors.SubText
            },0.2)
        end
    end

    CurrentPage = page
end

for page,button in pairs(CategoryButtons) do
    button.MouseButton1Click:Connect(function()
        SwitchPage(page)
    end)
end

SwitchPage(CombatPage)

--==================================================
-- END PART 1
--==================================================

--==================================================
-- PART 2/4
-- UI CONTROLS
--==================================================

local function Row(parent, text, sub)
    local row = New("Frame", {
        Parent = parent,
        Size = UDim2.new(1, -10, 0, sub and 58 or 46),
        BackgroundColor3 = Color3.fromRGB(25, 25, 28),
        BackgroundTransparency = 0.15,
        BorderSizePixel = 0
    })

    Corner(row, 10)

    local title = New("TextLabel", {
        Parent = row,
        Position = UDim2.new(0, 14, 0, sub and 8 or 0),
        Size = UDim2.new(1, -28, 0, sub and 22 or 46),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = Color3.fromRGB(235, 235, 240),
        Font = Enum.Font.GothamMedium,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = sub and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center
    })

    if sub then
        New("TextLabel", {
            Parent = row,
            Position = UDim2.new(0, 14, 0, 30),
            Size = UDim2.new(1, -28, 0, 20),
            BackgroundTransparency = 1,
            Text = sub,
            TextColor3 = Color3.fromRGB(145, 145, 150),
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextXAlignment = Enum.TextXAlignment.Left
        })
    end

    return row
end


--==================================================
-- TOGGLE
--==================================================

local function Toggle(parent, text, key, sub)
    local row = Row(parent, text, sub)

    local button = New("TextButton", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.new(0, 48, 0, 26),
        BackgroundColor3 = Color3.fromRGB(45, 45, 50),
        BorderSizePixel = 0,
        Text = ""
    })

    Corner(button, 13)

    local knob = New("Frame", {
        Parent = button,
        Position = UDim2.new(0, 4, 0.5, -9),
        Size = UDim2.new(0, 18, 0, 18),
        BackgroundColor3 = Color3.fromRGB(180, 180, 185),
        BorderSizePixel = 0
    })

    Corner(knob, 10)

    local function Update()
        local enabled = Config[key]

        Tween(
            button,
            {
                BackgroundColor3 = enabled
                    and Colors.Menu
                    or Color3.fromRGB(45, 45, 50)
            },
            0.22
        )

        Tween(
            knob,
            {
                Position = enabled
                    and UDim2.new(1, -22, 0.5, -9)
                    or UDim2.new(0, 4, 0.5, -9),

                BackgroundColor3 = enabled
                    and Color3.fromRGB(255, 255, 255)
                    or Color3.fromRGB(180, 180, 185)
            },
            0.22
        )
    end

    button.MouseButton1Click:Connect(function()
        Config[key] = not Config[key]
        Update()
    end)

    button.MouseEnter:Connect(function()
        Tween(row, {
            BackgroundColor3 = Color3.fromRGB(32, 32, 36)
        }, 0.12)
    end)

    button.MouseLeave:Connect(function()
        Tween(row, {
            BackgroundColor3 = Color3.fromRGB(25, 25, 28)
        }, 0.12)
    end)

    Update()

    return row
end


--==================================================
-- VALUE
--==================================================

local function Value(parent, text, key, min, max, step, sub)
    local row = Row(parent, text, sub)

    local valueLabel = New("TextLabel", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -44, 0.5, 0),
        Size = UDim2.new(0, 55, 0, 28),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(235, 235, 240),
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Center
    })

    local minus = New("TextButton", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -105, 0.5, 0),
        Size = UDim2.new(0, 28, 0, 28),
        BackgroundColor3 = Color3.fromRGB(40, 40, 44),
        BorderSizePixel = 0,
        Text = "−",
        TextColor3 = Color3.fromRGB(220, 220, 225),
        Font = Enum.Font.GothamBold,
        TextSize = 17
    })

    Corner(minus, 8)

    local plus = New("TextButton", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.new(0, 28, 0, 28),
        BackgroundColor3 = Color3.fromRGB(40, 40, 44),
        BorderSizePixel = 0,
        Text = "+",
        TextColor3 = Color3.fromRGB(220, 220, 225),
        Font = Enum.Font.GothamBold,
        TextSize = 17
    })

    Corner(plus, 8)

    local function Format(v)
        if math.abs(v - math.floor(v)) < 0.001 then
            return tostring(math.floor(v))
        end

        return string.format("%.2f", v)
    end

    local function Update()
        Config[key] = math.clamp(Config[key], min, max)
        valueLabel.Text = Format(Config[key])
    end

    minus.MouseButton1Click:Connect(function()
        Config[key] = Config[key] - step
        Update()
    end)

    plus.MouseButton1Click:Connect(function()
        Config[key] = Config[key] + step
        Update()
    end)

    Update()

    return row
end


--==================================================
-- SELECTOR
--==================================================

local function Selector(parent, text, key, options, sub)
    local row = Row(parent, text, sub)

    local current = New("TextLabel", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -42, 0.5, 0),
        Size = UDim2.new(0, 105, 0, 28),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(225, 225, 230),
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Right
    })

    local left = New("TextButton", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -150, 0.5, 0),
        Size = UDim2.new(0, 26, 0, 26),
        BackgroundColor3 = Color3.fromRGB(40, 40, 44),
        BorderSizePixel = 0,
        Text = "‹",
        TextColor3 = Color3.fromRGB(220, 220, 225),
        Font = Enum.Font.GothamBold,
        TextSize = 17
    })

    Corner(left, 8)

    local right = New("TextButton", {
        Parent = row,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.new(0, 26, 0, 26),
        BackgroundColor3 = Color3.fromRGB(40, 40, 44),
        BorderSizePixel = 0,
        Text = "›",
        TextColor3 = Color3.fromRGB(220, 220, 225),
        Font = Enum.Font.GothamBold,
        TextSize = 17
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
        Config[key] = options[index]
        current.Text = tostring(options[index])
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
-- COMBAT PAGE
--==================================================

Toggle(
    CombatPage,
    "Aim Assist",
    "AimAssist",
    "Automatically follows the closest valid enemy"
)

Toggle(
    CombatPage,
    "Visible Only",
    "VisibleOnly",
    "Ignore targets hidden behind walls"
)

Toggle(
    CombatPage,
    "Aim FOV",
    "AimFOV",
    "Limit aim assist to the circle"
)

Value(
    CombatPage,
    "FOV Size",
    "AimFOVSize",
    25,
    500,
    5,
    "Size of the centered aim field"
)

Value(
    CombatPage,
    "Smoothness",
    "AimSmoothness",
    0.05,
    0.50,
    0.01,
    "Higher values make aiming faster"
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
    "Choose which body part Aim Assist uses"
)


--==================================================
-- VISUALS PAGE
--==================================================

Toggle(
    VisualPage,
    "ESP",
    "ESP",
    "Show enemy and teammate information"
)

Toggle(
    VisualPage,
    "Model ESP",
    "ModelESP",
    "Highlight players directly on their models"
)

Toggle(
    VisualPage,
    "Square Box",
    "BoxESP",
    "Display a square ESP box around players"
)

Toggle(
    VisualPage,
    "Team Colors",
    "TeamColors",
    "Blue for allies and red for enemies"
)

Toggle(
    VisualPage,
    "Names",
    "Names",
    "Show player names"
)

Toggle(
    VisualPage,
    "Health",
    "Health",
    "Show player health"
)

Toggle(
    VisualPage,
    "Distance",
    "Distance",
    "Show distance to players"
)


--==================================================
-- MOVEMENT PAGE
--==================================================

Toggle(
    MovementPage,
    "Speed",
    "Speed",
    "Change your movement speed"
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
    "Change your jump power"
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
-- SETTINGS PAGE
--==================================================

local info = New("Frame", {
    Parent = SettingsPage,
    Size = UDim2.new(1, -10, 0, 120),
    BackgroundColor3 = Color3.fromRGB(25, 25, 28),
    BackgroundTransparency = 0.15,
    BorderSizePixel = 0
})

Corner(info, 12)

New("TextLabel", {
    Parent = info,
    Position = UDim2.new(0, 16, 0, 15),
    Size = UDim2.new(1, -32, 0, 28),
    BackgroundTransparency = 1,
    Text = "NEUTRALIZATION HUB",
    TextColor3 = Color3.fromRGB(240, 240, 245),
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left
})

New("TextLabel", {
    Parent = info,
    Position = UDim2.new(0, 16, 0, 48),
    Size = UDim2.new(1, -32, 0, 22),
    BackgroundTransparency = 1,
    Text = Config.Version,
    TextColor3 = Colors.Menu,
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left
})

New("TextLabel", {
    Parent = info,
    Position = UDim2.new(0, 16, 0, 76),
    Size = UDim2.new(1, -32, 0, 30),
    BackgroundTransparency = 1,
    Text = "Clean rebuild • Dark Red UI",
    TextColor3 = Color3.fromRGB(140, 140, 145),
    Font = Enum.Font.Gotham,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left
})


--==================================================
-- END PART 2
--==================================================

--==================================================
-- PART 3/4
-- DRAG / FLOATING BUTTON / FOV / TARGETS / ESP
--==================================================


--==================================================
-- MAIN WINDOW DRAG
--==================================================

local draggingMain = false
local dragStart = nil
local startPosition = nil

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        draggingMain = true
        dragStart = input.Position
        startPosition = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingMain = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not draggingMain then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local delta = input.Position - dragStart

    Main.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end)


--==================================================
-- FLOATING N BUTTON
--==================================================

local Floating = New("TextButton", {
    Parent = Gui,
    Size = UDim2.new(0, 58, 0, 58),
    Position = UDim2.new(0.5, -29, 0.5, -29),
    BackgroundColor3 = Colors.MenuDark,
    BorderSizePixel = 0,
    Text = "N",
    TextColor3 = Color3.fromRGB(245, 245, 248),
    Font = Enum.Font.GothamBold,
    TextSize = 23,
    AutoButtonColor = false,
    Visible = false,
    ZIndex = 50
})

Corner(Floating, 29)

local floatingStroke = New("UIStroke", {
    Parent = Floating,
    Color = Colors.Menu,
    Thickness = 1.5,
    Transparency = 0.15
})


local floatingPos = Floating.Position
local floatingDragging = false
local floatingDragStart = nil
local floatingStartPosition = nil
local floatingMoved = false


Floating.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        floatingDragging = true
        floatingMoved = false

        floatingDragStart = input.Position
        floatingStartPosition = Floating.Position

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

    local delta = input.Position - floatingDragStart

    if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
        floatingMoved = true
    end

    Floating.Position = UDim2.new(
        floatingStartPosition.X.Scale,
        floatingStartPosition.X.Offset + delta.X,
        floatingStartPosition.Y.Scale,
        floatingStartPosition.Y.Offset + delta.Y
    )

    floatingPos = Floating.Position
end)


--==================================================
-- FLOATING BUTTON HOVER
--==================================================

Floating.MouseEnter:Connect(function()
    Tween(Floating, {
        Size = UDim2.new(0, 64, 0, 64),
        BackgroundColor3 = Colors.Menu
    }, 0.16)
end)

Floating.MouseLeave:Connect(function()
    Tween(Floating, {
        Size = UDim2.new(0, 58, 0, 58),
        BackgroundColor3 = Colors.MenuDark
    }, 0.16)
end)


--==================================================
-- OPEN / CLOSE / MINIMIZE
--==================================================

local function HideMain()
    Tween(MainScale, {
        Scale = 0.88
    }, 0.28)

    Tween(Main, {
        BackgroundTransparency = 1
    }, 0.24)

    task.delay(0.28, function()
        if not Main.Visible then
            return
        end

        Main.Visible = false
        Floating.Visible = true
        Floating.Position = floatingPos

        Main.BackgroundTransparency = 0
        MainScale.Scale = 1
    end)
end


local function ShowMain()
    Floating.Visible = false
    Main.Visible = true

    MainScale.Scale = 0.84
    Main.BackgroundTransparency = 1

    Tween(MainScale, {
        Scale = 1
    }, 0.38)

    Tween(Main, {
        BackgroundTransparency = 0
    }, 0.32)
end


MinimizeButton.MouseButton1Click:Connect(function()
    HideMain()
end)


CloseButton.MouseButton1Click:Connect(function()
    Tween(MainScale, {
        Scale = 0.82
    }, 0.22)

    Tween(Main, {
        BackgroundTransparency = 1
    }, 0.20)

    task.delay(0.22, function()
        Main.Visible = false
        Floating.Visible = true
        Floating.Position = floatingPos
        Main.BackgroundTransparency = 0
        MainScale.Scale = 1
    end)
end)


Floating.MouseButton1Click:Connect(function()
    if floatingMoved then
        return
    end

    ShowMain()
end)


--==================================================
-- CENTERED AIM FOV
--==================================================

local FOVFrame = New("Frame", {
    Parent = Gui,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0, Config.AimFOVSize * 2, 0, Config.AimFOVSize * 2),
    BackgroundTransparency = 1,
    Visible = false,
    ZIndex = 2
})

Corner(FOVFrame, 999)

local FOVStroke = New("UIStroke", {
    Parent = FOVFrame,
    Color = Colors.Menu,
    Thickness = 1.5,
    Transparency = 0.15
})


local function UpdateFOV()
    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    local viewport = camera.ViewportSize

    -- ВСЕГДА ЦЕНТР ЭКРАНА.
    -- НЕ МЫШЬ.
    FOVFrame.Position = UDim2.new(
        0,
        viewport.X / 2,
        0,
        viewport.Y / 2
    )

    FOVFrame.Size = UDim2.new(
        0,
        Config.AimFOVSize * 2,
        0,
        Config.AimFOVSize * 2
    )

    FOVFrame.Visible =
        Main.Visible
        and Config.AimFOV
end


--==================================================
-- CHARACTER / TEAM HELPERS
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

    local root =
        character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("UpperTorso")
        or character:FindFirstChild("Torso")

    if not root then
        return nil
    end

    return character, humanoid, root
end


local function IsAlive(player)
    local character, humanoid = GetCharacter(player)

    return character ~= nil
        and humanoid ~= nil
        and humanoid.Health > 0
end


local function IsFriendly(player)
    if player == LocalPlayer then
        return true
    end

    if not Config.TeamColors then
        return false
    end

    if LocalPlayer.Team ~= nil
        and player.Team ~= nil
        and LocalPlayer.Team == player.Team then

        return true
    end

    return false
end


local function GetESPColor(player)
    if IsFriendly(player) then
        return Color3.fromRGB(70, 150, 255)
    end

    return Colors.Menu
end


--==================================================
-- TARGET PART
--==================================================

local function GetTargetPart(character)
    local head = character:FindFirstChild("Head")

    local body =
        character:FindFirstChild("UpperTorso")
        or character:FindFirstChild("Torso")
        or character:FindFirstChild("HumanoidRootPart")

    if Config.TargetPart == "Head" then
        return head or body
    end

    if Config.TargetPart == "Body" then
        return body or head
    end

    if Config.TargetPart == "Random Part" then
        local parts = {}

        for _, object in ipairs(character:GetChildren()) do
            if object:IsA("BasePart") then
                table.insert(parts, object)
            end
        end

        if #parts > 0 then
            return parts[math.random(1, #parts)]
        end
    end

    return head or body
end


--==================================================
-- VISIBILITY CHECK
--==================================================

local function IsVisible(part, character)
    if not Config.VisibleOnly then
        return true
    end

    local camera = workspace.CurrentCamera

    if not camera then
        return false
    end

    local origin = camera.CFrame.Position
    local direction = part.Position - origin

    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {
        LocalPlayer.Character
    }

    local result = workspace:Raycast(
        origin,
        direction,
        params
    )

    if not result then
        return true
    end

    return result.Instance:IsDescendantOf(character)
end


--==================================================
-- GET BEST TARGET
--==================================================

local function GetBestTarget()
    local camera = workspace.CurrentCamera

    if not camera then
        return nil, nil
    end

    local center = Vector2.new(
        camera.ViewportSize.X / 2,
        camera.ViewportSize.Y / 2
    )

    local maxDistance = Config.AimFOVSize
    local bestPlayer = nil
    local bestPart = nil
    local bestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer
            and not IsFriendly(player)
            and IsAlive(player) then

            local character = player.Character

            if character then
                local part = GetTargetPart(character)

                if part then
                    local screenPosition, onScreen =
                        camera:WorldToViewportPoint(part.Position)

                    if onScreen and screenPosition.Z > 0 then

                        local screenDistance =
                            (
                                Vector2.new(
                                    screenPosition.X,
                                    screenPosition.Y
                                ) - center
                            ).Magnitude

                        local insideFOV =
                            (not Config.AimFOV)
                            or screenDistance <= maxDistance

                        if insideFOV
                            and IsVisible(part, character)
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

    return bestPlayer, bestPart
end


--==================================================
-- ESP STORAGE
--==================================================

local ESPObjects = {}


local function RemoveESP(player)
    local data = ESPObjects[player]

    if not data then
        return
    end

    if data.Gui then
        data.Gui:Destroy()
    end

    if data.Highlight then
        data.Highlight:Destroy()
    end

    ESPObjects[player] = nil
end


local function CreateESP(player)
    if player == LocalPlayer then
        return nil
    end

    if ESPObjects[player] then
        return ESPObjects[player]
    end

    local holder = New("BillboardGui", {
        Parent = Gui,
        Size = UDim2.new(0, 100, 0, 100),
        AlwaysOnTop = true,
        LightInfluence = 0,
        Enabled = false
    })

    local box = New("Frame", {
        Parent = holder,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 50, 0, 50),
        BackgroundTransparency = 1,
        Visible = false
    })

    Corner(box, 0)

    local boxStroke = New("UIStroke", {
        Parent = box,
        Thickness = 1.5,
        Transparency = 0.05
    })

    local name = New("TextLabel", {
        Parent = holder,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 0, -4),
        Size = UDim2.new(0, 180, 0, 18),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(235, 235, 240),
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        Text = "",
        Visible = false
    })

    local health = New("TextLabel", {
        Parent = holder,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 1, 4),
        Size = UDim2.new(0, 180, 0, 18),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(235, 235, 240),
        Font = Enum.Font.Gotham,
        TextSize = 10,
        Text = "",
        Visible = false
    })

    local data = {
        Gui = holder,
        Box = box,
        BoxStroke = boxStroke,
        Name = name,
        Health = health,
        Highlight = nil
    }

    ESPObjects[player] = data

    return data
end


--==================================================
-- MODEL ESP
--==================================================

local function UpdateHighlight(player, character, color)
    local data = ESPObjects[player]

    if not data then
        return
    end

    if not Config.ESP or not Config.ModelESP then
        if data.Highlight then
            data.Highlight.Enabled = false
        end

        return
    end

    if not data.Highlight then
        local highlight = Instance.new("Highlight")

        highlight.Name = "NeutralizationModelESP"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillTransparency = 0.82
        highlight.OutlineTransparency = 0.05

        data.Highlight = highlight
    end

    data.Highlight.Adornee = character
    data.Highlight.Parent = character
    data.Highlight.FillColor = color
    data.Highlight.OutlineColor = color
    data.Highlight.Enabled = true
end


--==================================================
-- END PART 3
--==================================================

--==================================================
-- PART 4/4
-- AIM / ESP / MOVEMENT / RENDER / STARTUP
--==================================================


--==================================================
-- AIM
--==================================================

local function AimAt(part)
    if not part then
        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    local currentCFrame = camera.CFrame

    local targetPosition = part.Position

    local targetCFrame = CFrame.lookAt(
        currentCFrame.Position,
        targetPosition
    )

    local smoothness = math.clamp(
        Config.AimSmoothness,
        0.05,
        0.50
    )

    camera.CFrame = currentCFrame:Lerp(
        targetCFrame,
        smoothness
    )
end


--==================================================
-- ESP UPDATE
--==================================================

local function UpdateESP(player)
    if player == LocalPlayer then
        return
    end

    local character, humanoid, root = GetCharacter(player)

    local data = ESPObjects[player]

    if not data then
        data = CreateESP(player)
    end

    if not data then
        return
    end

    if not Config.ESP or not character or not root then
        data.Gui.Enabled = false

        if data.Highlight then
            data.Highlight.Enabled = false
        end

        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    local position, onScreen =
        camera:WorldToViewportPoint(root.Position)

    if not onScreen or position.Z <= 0 then
        data.Gui.Enabled = false

        if data.Highlight then
            data.Highlight.Enabled = false
        end

        return
    end

    data.Gui.Adornee = root
    data.Gui.Enabled = true

    local color = GetESPColor(player)

    --==============================================
    -- SQUARE BOX
    --==============================================

    data.Box.Visible = Config.BoxESP
    data.BoxStroke.Color = color

    -- Размер остаётся квадратным.
    local distance =
        (camera.CFrame.Position - root.Position).Magnitude

    local boxSize =
        math.clamp(
            1500 / math.max(distance, 1),
            25,
            75
        )

    data.Box.Size = UDim2.new(
        0,
        boxSize,
        0,
        boxSize
    )

    --==============================================
    -- NAME
    --==============================================

    data.Name.Visible = Config.Names

    if Config.Names then
        data.Name.Text = player.DisplayName
            ~= player.Name
            and player.DisplayName .. "  [" .. player.Name .. "]"
            or player.Name

        data.Name.TextColor3 = color
    end

    --==============================================
    -- HEALTH
    --==============================================

    data.Health.Visible = Config.Health

    if Config.Health then
        local hp = math.floor(humanoid.Health)
        local maxHp = math.floor(humanoid.MaxHealth)

        data.Health.Text =
            "HP: " .. hp .. " / " .. maxHp

        data.Health.TextColor3 = color
    end

    --==============================================
    -- DISTANCE
    --==============================================

    if Config.Distance then
        data.Health.Visible = true

        local localCharacter = LocalPlayer.Character
        local localRoot =
            localCharacter
            and localCharacter:FindFirstChild("HumanoidRootPart")

        if localRoot then
            local dist =
                math.floor(
                    (localRoot.Position - root.Position).Magnitude
                )

            if Config.Health then
                data.Health.Text =
                    "HP: "
                    .. math.floor(humanoid.Health)
                    .. " / "
                    .. math.floor(humanoid.MaxHealth)
                    .. "   •   "
                    .. dist
                    .. "m"
            else
                data.Health.Text =
                    dist .. "m"
            end

            data.Health.TextColor3 = color
        end
    end

    --==============================================
    -- MODEL ESP
    --==============================================

    UpdateHighlight(
        player,
        character,
        color
    )
end


--==================================================
-- CLEAN OLD ESP
--==================================================

Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
end)


--==================================================
-- CHARACTER RESPAWN
--==================================================

LocalPlayer.CharacterAdded:Connect(function(character)

    task.wait(0.15)

    local humanoid =
        character:WaitForChild(
            "Humanoid",
            5
        )

    if humanoid then
        humanoid.UseJumpPower = true
    end
end)


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

    --==============================================
    -- SPEED
    --==============================================

    if Config.Speed then
        humanoid.WalkSpeed = Config.SpeedValue
    else
        humanoid.WalkSpeed = 16
    end

    --==============================================
    -- JUMP
    --==============================================

    humanoid.UseJumpPower = true

    if Config.Jump then
        humanoid.JumpPower = Config.JumpPower
    else
        humanoid.JumpPower = 50
    end

    --==============================================
    -- NOCLIP
    --==============================================

    UpdateNoclip()
end


--==================================================
-- AIM UPDATE
--==================================================

local function UpdateAim()
    if not Config.AimAssist then
        return
    end

    local targetPlayer, targetPart =
        GetBestTarget()

    if not targetPlayer or not targetPart then
        return
    end

    -- Дополнительная защита:
    -- Aim Assist НИКОГДА не целится в союзника.
    if IsFriendly(targetPlayer) then
        return
    end

    AimAt(targetPart)
end


--==================================================
-- MAIN RENDER LOOP
--==================================================

local renderConnection

renderConnection =
    RunService.RenderStepped:Connect(function()

        --==========================================
        -- FOV
        --==========================================

        UpdateFOV()

        --==========================================
        -- AIM
        --==========================================

        UpdateAim()

        --==========================================
        -- MOVEMENT
        --==========================================

        UpdateMovement()

        --==========================================
        -- ESP
        --==========================================

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                UpdateESP(player)
            end
        end
    end)


--==================================================
-- PLAYER JOIN
--==================================================

Players.PlayerAdded:Connect(function(player)

    player.CharacterAdded:Connect(function()
        task.wait(0.2)

        if Config.ESP then
            CreateESP(player)
        end
    end)

    if Config.ESP then
        CreateESP(player)
    end
end)


--==================================================
-- INITIAL ESP OBJECTS
--==================================================

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end


--==================================================
-- CATEGORY ANIMATION
--==================================================

for name, button in pairs(CategoryButtons) do

    button.MouseEnter:Connect(function()
        if CurrentPage ~= Pages[name] then
            Tween(
                button,
                {
                    BackgroundColor3 =
                        Color3.fromRGB(32, 32, 36)
                },
                0.12
            )
        end
    end)

    button.MouseLeave:Connect(function()
        if CurrentPage ~= Pages[name] then
            Tween(
                button,
                {
                    BackgroundColor3 =
                        Color3.fromRGB(22, 22, 25)
                },
                0.12
            )
        end
    end)
end


--==================================================
-- FOV SIZE UPDATE
--==================================================

local lastFOVSize = Config.AimFOVSize

RunService.RenderStepped:Connect(function()

    if lastFOVSize ~= Config.AimFOVSize then
        lastFOVSize = Config.AimFOVSize

        Tween(
            FOVFrame,
            {
                Size = UDim2.new(
                    0,
                    Config.AimFOVSize * 2,
                    0,
                    Config.AimFOVSize * 2
                )
            },
            0.15
        )
    end
end)


--==================================================
-- MENU OPEN ANIMATION
--==================================================

Main.Visible = true
Floating.Visible = false

MainScale.Scale = 0.72
Main.BackgroundTransparency = 1

task.wait()

Tween(
    MainScale,
    {
        Scale = 1
    },
    0.55
)

Tween(
    Main,
    {
        BackgroundTransparency = 0
    },
    0.45
)


--==================================================
-- INITIAL FOV
--==================================================

task.defer(function()
    task.wait(0.1)
    UpdateFOV()
end)


--==================================================
-- FINAL SAFETY
--==================================================

Gui.Enabled = true

print(
    "[NEUTRALIZATION HUB] Loaded "
    .. Config.Version
)


--==================================================
-- END PART 4/4
--==================================================
