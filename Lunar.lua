--==================================================
-- LUNAR HUB v3.0
-- PART 1A
--==================================================

--// SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local Config = {

    -- Combat
    AimAssist = false,
    VisibleOnly = true,
    AimFOV = true,
    AimFOVSize = 150,
    AimSmoothness = 0.18,
    TargetPart = "Head",

    -- Visuals
    ESP = false,
    TeamCheck = true,
    BoxESP = true,
    Names = false,
    Health = false,
    Distance = false,

    -- Movement
    Speed = false,
    SpeedValue = 16,

    Jump = false,
    JumpPower = 50,

    Noclip = false,

    -- FOV
    FOVChanger = false,
    GameFOV = 70,

    -- Info
    Version = "v3.0",
    Creator = "By: Lunar Hub"
}

--==================================================
-- COLORS
--==================================================

local Colors = {

    Background = Color3.fromRGB(18, 18, 18),

    Panel = Color3.fromRGB(24, 24, 24),

    Menu = Color3.fromRGB(190, 25, 25),

    MenuDark = Color3.fromRGB(130, 20, 20),

    Card = Color3.fromRGB(30, 30, 30),

    CardHover = Color3.fromRGB(38, 38, 38),

    Text = Color3.fromRGB(240, 240, 240),

    SubText = Color3.fromRGB(155, 155, 155),

    Off = Color3.fromRGB(65, 65, 65),

    Border = Color3.fromRGB(55, 55, 55)
}

--==================================================
-- DESTROY PREVIOUS VERSION
--==================================================

pcall(function()

    local old =
        CoreGui:FindFirstChild("LunarHub")

    if old then
        old:Destroy()
    end

end)

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")

Gui.Name = "LunarHub"

Gui.ResetOnSpawn = false

Gui.IgnoreGuiInset = true

Gui.ZIndexBehavior =
    Enum.ZIndexBehavior.Sibling

pcall(function()
    Gui.Parent = CoreGui
end)

if not Gui.Parent then
    Gui.Parent =
        LocalPlayer:WaitForChild("PlayerGui")
end

--==================================================
-- HELPER
--==================================================

local function New(
    className,
    properties,
    parent
)

    local object =
        Instance.new(className)

    for property, value in pairs(properties) do

        pcall(function()
            object[property] = value
        end)

    end

    if parent then
        object.Parent = parent
    end

    return object
end

local function Tween(
    object,
    properties,
    duration
)

    return TweenService:Create(
        object,
        TweenInfo.new(
            duration or 0.2,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        ),
        properties
    )

end

--==================================================
-- MAIN WINDOW
--==================================================

local Main = New("Frame", {

    Name = "Main",

    Size =
        UDim2.fromOffset(
            520,
            320
        ),

    Position =
        UDim2.new(
            0.5,
            -260,
            0.5,
            -160
        ),

    BackgroundColor3 =
        Colors.Background,

    BorderSizePixel = 0,

    ClipsDescendants = true

}, Gui)

New("UICorner", {

    CornerRadius =
        UDim.new(0, 8)

}, Main)

New("UIStroke", {

    Color = Colors.Border,

    Thickness = 1,

    Transparency = 0.15

}, Main)

--==================================================
-- TOP BAR
--==================================================

local TopBar = New("Frame", {

    Size =
        UDim2.new(
            1,
            0,
            0,
            48
        ),

    BackgroundColor3 =
        Colors.Panel,

    BorderSizePixel = 0

}, Main)

--==================================================
-- LOGO
--==================================================

local Logo = New("TextLabel", {

    Size =
        UDim2.fromOffset(
            38,
            38
        ),

    Position =
        UDim2.fromOffset(
            10,
            5
        ),

    BackgroundColor3 =
        Colors.Menu,

    Text = "L",

    TextColor3 =
        Colors.Text,

    TextSize = 21,

    Font =
        Enum.Font.GothamBold

}, TopBar)

New("UICorner", {

    CornerRadius =
        UDim.new(0, 8)

}, Logo)

--==================================================
-- TITLE
--==================================================

local Title = New("TextLabel", {

    Size =
        UDim2.fromOffset(
            170,
            25
        ),

    Position =
        UDim2.fromOffset(
            58,
            6
        ),

    BackgroundTransparency = 1,

    Text = "LUNAR HUB",

    TextColor3 =
        Colors.Text,

    TextSize = 17,

    Font =
        Enum.Font.GothamBold,

    TextXAlignment =
        Enum.TextXAlignment.Left

}, TopBar)

--==================================================
-- VERSION
--==================================================

local Version = New("TextLabel", {

    Size =
        UDim2.fromOffset(
            60,
            18
        ),

    Position =
        UDim2.fromOffset(
            59,
            28
        ),

    BackgroundTransparency = 1,

    Text = "v3.0",

    TextColor3 =
        Colors.Menu,

    TextSize = 10,

    Font =
        Enum.Font.GothamBold,

    TextXAlignment =
        Enum.TextXAlignment.Left

}, TopBar)

--==================================================
-- TOP RIGHT STATUS
--==================================================

local Status = New("TextLabel", {

    Size =
        UDim2.fromOffset(
            120,
            35
        ),

    Position =
        UDim2.new(
            1,
            -165,
            0,
            7
        ),

    BackgroundTransparency = 1,

    Text = "Lunar Hub\nUser",

    TextColor3 =
        Colors.SubText,

    TextSize = 10,

    Font =
        Enum.Font.Gotham,

    TextXAlignment =
        Enum.TextXAlignment.Right,

    TextYAlignment =
        Enum.TextYAlignment.Center

}, TopBar)

--==================================================
-- CLOSE BUTTON
--==================================================

local CloseButton = New("TextButton", {

    Size =
        UDim2.fromOffset(
            30,
            30
        ),

    Position =
        UDim2.new(
            1,
            -38,
            0,
            9
        ),

    BackgroundColor3 =
        Color3.fromRGB(
            35,
            35,
            35
        ),

    Text = "×",

    TextColor3 =
        Colors.Text,

    TextSize = 18,

    Font =
        Enum.Font.GothamBold,

    AutoButtonColor = false

}, TopBar)

New("UICorner", {

    CornerRadius =
        UDim.new(1, 0)

}, CloseButton)

CloseButton.MouseEnter:Connect(function()

    Tween(
        CloseButton,
        {
            BackgroundColor3 =
                Colors.Menu
        },
        0.15
    ):Play()

end)

CloseButton.MouseLeave:Connect(function()

    Tween(
        CloseButton,
        {
            BackgroundColor3 =
                Color3.fromRGB(
                    35,
                    35,
                    35
                )
        },
        0.15
    ):Play()

end)
--==================================================
-- SIDEBAR
--==================================================

local Sidebar = New("Frame", {

    Size =
        UDim2.new(
            0,
            145,
            1,
            -58
        ),

    Position =
        UDim2.fromOffset(
            8,
            52
        ),

    BackgroundColor3 =
        Colors.Panel,

    BorderSizePixel = 0

}, Main)

New("UICorner", {

    CornerRadius =
        UDim.new(0, 7)

}, Sidebar)

--==================================================
-- CONTENT
--==================================================

local Content = New("Frame", {

    Size =
        UDim2.new(
            1,
            -165,
            1,
            -58
        ),

    Position =
        UDim2.fromOffset(
            157,
            52
        ),

    BackgroundColor3 =
        Colors.Panel,

    BorderSizePixel = 0,

    ClipsDescendants = true

}, Main)

New("UICorner", {

    CornerRadius =
        UDim.new(0, 7)

}, Content)

--==================================================
-- PAGES
--==================================================

local Pages = {}

local CombatPage = New("ScrollingFrame", {

    Name = "Combat",

    Size =
        UDim2.new(
            1,
            -12,
            1,
            -12
        ),

    Position =
        UDim2.fromOffset(
            6,
            6
        ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 3,

    ScrollBarImageColor3 =
        Colors.Menu,

    CanvasSize =
        UDim2.new(
            0,
            0,
            0,
            0
        ),

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    Visible = true

}, Content)

Pages.Combat = CombatPage

local VisualPage = New("ScrollingFrame", {

    Name = "Visuals",

    Size =
        UDim2.new(
            1,
            -12,
            1,
            -12
        ),

    Position =
        UDim2.fromOffset(
            6,
            6
        ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 3,

    ScrollBarImageColor3 =
        Colors.Menu,

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    Visible = false

}, Content)

Pages.Visuals = VisualPage

local MovementPage = New("ScrollingFrame", {

    Name = "Movement",

    Size =
        UDim2.new(
            1,
            -12,
            1,
            -12
        ),

    Position =
        UDim2.fromOffset(
            6,
            6
        ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 3,

    ScrollBarImageColor3 =
        Colors.Menu,

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    Visible = false

}, Content)

Pages.Movement = MovementPage

local MiscPage = New("ScrollingFrame", {

    Name = "Misc",

    Size =
        UDim2.new(
            1,
            -12,
            1,
            -12
        ),

    Position =
        UDim2.fromOffset(
            6,
            6
        ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 3,

    ScrollBarImageColor3 =
        Colors.Menu,

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    Visible = false

}, Content)

Pages.Misc = MiscPage

local SettingsPage = New("ScrollingFrame", {

    Name = "Settings",

    Size =
        UDim2.new(
            1,
            -12,
            1,
            -12
        ),

    Position =
        UDim2.fromOffset(
            6,
            6
        ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 3,

    ScrollBarImageColor3 =
        Colors.Menu,

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    Visible = false

}, Content)

Pages.Settings = SettingsPage

--==================================================
-- PAGE LAYOUT
--==================================================

for _, page in pairs(Pages) do

    New("UIPadding", {

        PaddingTop =
            UDim.new(0, 5),

        PaddingBottom =
            UDim.new(0, 8),

        PaddingLeft =
            UDim.new(0, 5),

        PaddingRight =
            UDim.new(0, 5)

    }, page)

    New("UIListLayout", {

        Padding =
            UDim.new(0, 7),

        SortOrder =
            Enum.SortOrder.LayoutOrder

    }, page)

end

--==================================================
-- PAGE HEADER
--==================================================

local function CreatePageHeader(
    parent,
    title,
    subtitle
)

    local frame = New("Frame", {

        Size =
            UDim2.new(
                1,
                -10,
                0,
                52
            ),

        BackgroundColor3 =
            Colors.Card,

        BorderSizePixel = 0

    }, parent)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 6)

    }, frame)

    New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -20,
                0,
                25
            ),

        Position =
            UDim2.fromOffset(
                10,
                5
            ),

        BackgroundTransparency = 1,

        Text = title,

        TextColor3 =
            Colors.Text,

        TextSize = 16,

        Font =
            Enum.Font.GothamBold,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, frame)

    New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -20,
                0,
                18
            ),

        Position =
            UDim2.fromOffset(
                10,
                29
            ),

        BackgroundTransparency = 1,

        Text = subtitle,

        TextColor3 =
            Colors.SubText,

        TextSize = 10,

        Font =
            Enum.Font.Gotham,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, frame)

    return frame
end

CreatePageHeader(
    CombatPage,
    "Combat",
    "Aim and combat functions"
)

CreatePageHeader(
    VisualPage,
    "Visuals",
    "ESP and visual settings"
)

CreatePageHeader(
    MovementPage,
    "Movement",
    "Movement and camera settings"
)

CreatePageHeader(
    MiscPage,
    "Misc",
    "Additional options"
)

CreatePageHeader(
    SettingsPage,
    "Settings",
    "Lunar Hub configuration"
)

--==================================================
-- SIDEBAR BUTTONS
--==================================================

local CategoryButtons = {}

local function CreateCategory(
    text,
    page,
    order
)

    local button = New("TextButton", {

        Size =
            UDim2.new(
                1,
                -12,
                0,
                38
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                29,
                29,
                29
            ),

        BorderSizePixel = 0,

        Text = text,

        TextColor3 =
            Colors.SubText,

        TextSize = 12,

        Font =
            Enum.Font.GothamSemibold,

        AutoButtonColor = false,

        LayoutOrder = order

    }, Sidebar)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 6)

    }, button)

    CategoryButtons[page] = button

    return button
end

New("UIListLayout", {

    Padding =
        UDim.new(0, 5),

    SortOrder =
        Enum.SortOrder.LayoutOrder

}, Sidebar)

New("UIPadding", {

    PaddingTop =
        UDim.new(0, 8),

    PaddingLeft =
        UDim.new(0, 6),

    PaddingRight =
        UDim.new(0, 6)

}, Sidebar)

CreateCategory(
    "Combat",
    CombatPage,
    1
)

CreateCategory(
    "Visuals",
    VisualPage,
    2
)

CreateCategory(
    "Movement",
    MovementPage,
    3
)

CreateCategory(
    "Misc",
    MiscPage,
    4
)

CreateCategory(
    "Settings",
    SettingsPage,
    5
)

print("[Lunar Hub] Part 1/6 loaded.")

--==================================================
-- LUNAR HUB v3.0
-- PART 2/6
--==================================================

--==================================================
-- PAGE SWITCHING
--==================================================

local CurrentPage = CombatPage

local function SetPage(page)

    for _, otherPage in pairs(Pages) do
        otherPage.Visible = false
    end

    page.Visible = true
    CurrentPage = page

    for otherPage, button in pairs(CategoryButtons) do

        if otherPage == page then

            Tween(
                button,
                {
                    BackgroundColor3 =
                        Colors.Menu,

                    TextColor3 =
                        Colors.Text
                },
                0.15
            ):Play()

        else

            Tween(
                button,
                {
                    BackgroundColor3 =
                        Color3.fromRGB(
                            29,
                            29,
                            29
                        ),

                    TextColor3 =
                        Colors.SubText
                },
                0.15
            ):Play()

        end

    end

end

for page, button in pairs(CategoryButtons) do

    button.MouseButton1Click:Connect(function()

        SetPage(page)

    end)

    button.MouseEnter:Connect(function()

        if CurrentPage ~= page then

            Tween(
                button,
                {
                    BackgroundColor3 =
                        Colors.CardHover
                },
                0.12
            ):Play()

        end

    end)

    button.MouseLeave:Connect(function()

        if CurrentPage ~= page then

            Tween(
                button,
                {
                    BackgroundColor3 =
                        Color3.fromRGB(
                            29,
                            29,
                            29
                        )
                },
                0.12
            ):Play()

        end

    end)

end

SetPage(CombatPage)

--==================================================
-- TOGGLE CREATOR
--==================================================

local function CreateToggle(
    parent,
    text,
    default,
    callback
)

    local state =
        default == true

    local holder = New("Frame", {

        Size =
            UDim2.new(
                1,
                -10,
                0,
                42
            ),

        BackgroundColor3 =
            Colors.Card,

        BorderSizePixel = 0

    }, parent)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 6)

    }, holder)

    local label = New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -75,
                1,
                0
            ),

        Position =
            UDim2.fromOffset(
                12,
                0
            ),

        BackgroundTransparency = 1,

        Text = text,

        TextColor3 =
            Colors.Text,

        TextSize = 12,

        Font =
            Enum.Font.Gotham,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, holder)

    local toggle = New("TextButton", {

        Size =
            UDim2.fromOffset(
                42,
                22
            ),

        Position =
            UDim2.new(
                1,
                -54,
                0.5,
                -11
            ),

        BackgroundColor3 =
            Colors.Off,

        BorderSizePixel = 0,

        Text = "",

        AutoButtonColor = false

    }, holder)

    New("UICorner", {

        CornerRadius =
            UDim.new(1, 0)

    }, toggle)

    local dot = New("Frame", {

        Size =
            UDim2.fromOffset(
                16,
                16
            ),

        Position =
            UDim2.fromOffset(
                3,
                3
            ),

        BackgroundColor3 =
            Colors.Text,

        BorderSizePixel = 0

    }, toggle)

    New("UICorner", {

        CornerRadius =
            UDim.new(1, 0)

    }, dot)

    local function Update()

        if state then

            Tween(
                toggle,
                {
                    BackgroundColor3 =
                        Colors.Menu
                },
                0.15
            ):Play()

            Tween(
                dot,
                {
                    Position =
                        UDim2.fromOffset(
                            23,
                            3
                        )
                },
                0.15
            ):Play()

        else

            Tween(
                toggle,
                {
                    BackgroundColor3 =
                        Colors.Off
                },
                0.15
            ):Play()

            Tween(
                dot,
                {
                    Position =
                        UDim2.fromOffset(
                            3,
                            3
                        )
                },
                0.15
            ):Play()

        end

        if callback then
            callback(state)
        end

    end

    toggle.MouseButton1Click:Connect(function()

        state = not state

        Update()

    end)

    holder.MouseEnter:Connect(function()

        Tween(
            holder,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.12
        ):Play()

    end)

    holder.MouseLeave:Connect(function()

        Tween(
            holder,
            {
                BackgroundColor3 =
                    Colors.Card
            },
            0.12
        ):Play()

    end)

    Update()

    return {

        Set = function(value)

            state =
                value == true

            Update()

        end,

        Get = function()

            return state

        end

    }

end

--==================================================
-- NUMBER VALUE CREATOR
--==================================================

local function CreateValue(
    parent,
    text,
    default,
    callback
)

    local holder = New("Frame", {

        Size =
            UDim2.new(
                1,
                -10,
                0,
                42
            ),

        BackgroundColor3 =
            Colors.Card,

        BorderSizePixel = 0

    }, parent)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 6)

    }, holder)

    New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -105,
                1,
                0
            ),

        Position =
            UDim2.fromOffset(
                12,
                0
            ),

        BackgroundTransparency = 1,

        Text = text,

        TextColor3 =
            Colors.Text,

        TextSize = 12,

        Font =
            Enum.Font.Gotham,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, holder)

    local box = New("TextBox", {

        Size =
            UDim2.fromOffset(
                70,
                26
            ),

        Position =
            UDim2.new(
                1,
                -82,
                0.5,
                -13
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                20,
                20,
                20
            ),

        BorderSizePixel = 0,

        Text =
            tostring(default),

        TextColor3 =
            Colors.Text,

        PlaceholderColor3 =
            Colors.SubText,

        TextSize = 11,

        Font =
            Enum.Font.Gotham,

        ClearTextOnFocus = false

    }, holder)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 5)

    }, box)

    New("UIStroke", {

        Color =
            Colors.Border,

        Thickness = 1,

        Transparency = 0.25

    }, box)

    box.FocusLost:Connect(function()

        local value =
            tonumber(box.Text)

        if value ~= nil then

            callback(value)

            box.Text =
                tostring(value)

        else

            box.Text =
                tostring(default)

        end

    end)

    holder.MouseEnter:Connect(function()

        Tween(
            holder,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.12
        ):Play()

    end)

    holder.MouseLeave:Connect(function()

        Tween(
            holder,
            {
                BackgroundColor3 =
                    Colors.Card
            },
            0.12
        ):Play()

    end)

    return box

end

--==================================================
-- SELECTOR CREATOR
--==================================================

local function CreateSelector(
    parent,
    text,
    values,
    default,
    callback
)

    local currentIndex = 1

    for index, value in ipairs(values) do

        if value == default then
            currentIndex = index
            break
        end

    end

    local holder = New("Frame", {

        Size =
            UDim2.new(
                1,
                -10,
                0,
                42
            ),

        BackgroundColor3 =
            Colors.Card,

        BorderSizePixel = 0

    }, parent)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 6)

    }, holder)

    New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -120,
                1,
                0
            ),

        Position =
            UDim2.fromOffset(
                12,
                0
            ),

        BackgroundTransparency = 1,

        Text = text,

        TextColor3 =
            Colors.Text,

        TextSize = 12,

        Font =
            Enum.Font.Gotham,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, holder)

    local selector = New("TextButton", {

        Size =
            UDim2.fromOffset(
                95,
                27
            ),

        Position =
            UDim2.new(
                1,
                -107,
                0.5,
                -13
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                20,
                20,
                20
            ),

        BorderSizePixel = 0,

        Text =
            tostring(
                values[currentIndex]
            ),

        TextColor3 =
            Colors.Text,

        TextSize = 11,

        Font =
            Enum.Font.GothamSemibold,

        AutoButtonColor = false

    }, holder)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 5)

    }, selector)

    New("UIStroke", {

        Color =
            Colors.Border,

        Thickness = 1,

        Transparency = 0.25

    }, selector)

    local function Update()

        selector.Text =
            tostring(
                values[currentIndex]
            )

        if callback then

            callback(
                values[currentIndex]
            )

        end

    end

    selector.MouseButton1Click:Connect(function()

        currentIndex += 1

        if currentIndex > #values then
            currentIndex = 1
        end

        Update()

    end)

    return selector

end

--==================================================
-- SECTION CREATOR
--==================================================

local function CreateSection(
    parent,
    title,
    description
)

    local section = New("Frame", {

        Size =
            UDim2.new(
                1,
                -10,
                0,
                48
            ),

        BackgroundColor3 =
            Colors.Panel,

        BorderSizePixel = 0

    }, parent)

    New("UICorner", {

        CornerRadius =
            UDim.new(0, 6)

    }, section)

    New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -20,
                0,
                21
            ),

        Position =
            UDim2.fromOffset(
                10,
                4
            ),

        BackgroundTransparency = 1,

        Text = title,

        TextColor3 =
            Colors.Text,

        TextSize = 13,

        Font =
            Enum.Font.GothamBold,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, section)

    New("TextLabel", {

        Size =
            UDim2.new(
                1,
                -20,
                0,
                17
            ),

        Position =
            UDim2.fromOffset(
                10,
                26
            ),

        BackgroundTransparency = 1,

        Text = description,

        TextColor3 =
            Colors.SubText,

        TextSize = 9,

        Font =
            Enum.Font.Gotham,

        TextXAlignment =
            Enum.TextXAlignment.Left

    }, section)

    return section

end

--==================================================
-- COMBAT PAGE
--==================================================

CreateSection(
    CombatPage,
    "Aim Assist",
    "Assistance for targeting opponents"
)

--==================================================
-- AIM ASSIST
--==================================================

CreateToggle(
    CombatPage,
    "Aim Assist",
    Config.AimAssist,
    function(value)

        Config.AimAssist =
            value

    end
)

--==================================================
-- VISIBLE ONLY
--==================================================

CreateToggle(
    CombatPage,
    "Visible Only",
    Config.VisibleOnly,
    function(value)

        Config.VisibleOnly =
            value

    end
)

--==================================================
-- TARGET PART
--==================================================

CreateSelector(
    CombatPage,
    "Target Part",
    {
        "Head",
        "UpperTorso",
        "HumanoidRootPart"
    },
    Config.TargetPart,
    function(value)

        Config.TargetPart =
            value

    end
)

--==================================================
-- AIM SMOOTHNESS
--==================================================

CreateValue(
    CombatPage,
    "Aim Smoothness",
    Config.AimSmoothness,
    function(value)

        value =
            math.clamp(
                value,
                0.01,
                1
            )

        Config.AimSmoothness =
            value

    end
)

--==================================================
-- COMBAT INFO
--==================================================

local CombatInfo = New("Frame", {

    Size =
        UDim2.new(
            1,
            -10,
            0,
            55
        ),

    BackgroundColor3 =
        Color3.fromRGB(
            27,
            27,
            27
        ),

    BorderSizePixel = 0

}, CombatPage)

New("UICorner", {

    CornerRadius =
        UDim.new(0, 6)

}, CombatInfo)

New("TextLabel", {

    Size =
        UDim2.new(
            1,
            -20,
            1,
            0
        ),

    Position =
        UDim2.fromOffset(
            10,
            0
        ),

    BackgroundTransparency = 1,

    Text =
        "Aim FOV is configured in Visuals.",

    TextColor3 =
        Colors.SubText,

    TextSize = 10,

    Font =
        Enum.Font.Gotham,

    TextXAlignment =
        Enum.TextXAlignment.Left,

    TextYAlignment =
        Enum.TextYAlignment.Center

}, CombatInfo)

--==================================================
-- PAGE OPEN
--==================================================

SetPage(CombatPage)

print("[Lunar Hub] Part 2/6 loaded.")

--==================================================
-- LUNAR HUB v3.0
-- PART 3/6
-- AIM ASSIST LOGIC
--==================================================

--==================================================
-- CAMERA
--==================================================

local Camera = workspace.CurrentCamera

--==================================================
-- CHARACTER HELPERS
--==================================================

local function GetCharacter(player)

    if not player then
        return nil
    end

    local character =
        player.Character

    if not character then
        return nil
    end

    local humanoid =
        character:FindFirstChildOfClass(
            "Humanoid"
        )

    if not humanoid then
        return nil
    end

    if humanoid.Health <= 0 then
        return nil
    end

    return character

end

--==================================================
-- TEAM CHECK
--==================================================

local function IsTeammate(player)

    if not Config.TeamCheck then
        return false
    end

    if not LocalPlayer.Team then
        return false
    end

    if not player.Team then
        return false
    end

    return player.Team == LocalPlayer.Team

end

--==================================================
-- TARGET PART
--==================================================

local function GetTargetPart(character)

    if not character then
        return nil
    end

    local part =
        character:FindFirstChild(
            Config.TargetPart
        )

    if part and part:IsA("BasePart") then
        return part
    end

    -- Fallbacks
    local head =
        character:FindFirstChild("Head")

    if head and head:IsA("BasePart") then
        return head
    end

    local root =
        character:FindFirstChild(
            "HumanoidRootPart"
        )

    if root and root:IsA("BasePart") then
        return root
    end

    return nil

end

--==================================================
-- LOCAL CHARACTER CHECK
--==================================================

local function IsLocalCharacter(character)

    if not character then
        return false
    end

    return character ==
        LocalPlayer.Character

end

--==================================================
-- SCREEN POSITION
--==================================================

local function GetScreenPosition(part)

    if not part then
        return nil, false
    end

    local screenPosition,
        onScreen =
        Camera:WorldToViewportPoint(
            part.Position
        )

    return screenPosition, onScreen

end

--==================================================
-- VISIBILITY CHECK
--==================================================

local function IsVisible(part, character)

    if not Config.VisibleOnly then
        return true
    end

    if not part or not character then
        return false
    end

    local origin =
        Camera.CFrame.Position

    local direction =
        part.Position - origin

    local rayParams =
        RaycastParams.new()

    rayParams.FilterType =
        Enum.RaycastFilterType.Exclude

    rayParams.FilterDescendantsInstances = {

        LocalPlayer.Character,

        Camera

    }

    rayParams.IgnoreWater = true

    local result =
        workspace:Raycast(
            origin,
            direction,
            rayParams
        )

    if not result then
        return true
    end

    return result.Instance:IsDescendantOf(
        character
    )

end

--==================================================
-- DISTANCE FROM FOV CENTER
--==================================================

local function GetMousePosition()

    local mouseLocation =
        UserInputService:GetMouseLocation()

    return Vector2.new(
        mouseLocation.X,
        mouseLocation.Y
    )

end

--==================================================
-- TARGET SEARCH
--==================================================

local function GetBestTarget()

    if not Camera then
        Camera =
            workspace.CurrentCamera
    end

    if not Camera then
        return nil
    end

    local bestPlayer = nil
    local bestPart = nil
    local bestDistance =
        math.huge

    local center =
        GetMousePosition()

    local fovRadius =
        math.max(
            1,
            Config.AimFOVSize
        )

    for _, player in ipairs(
        Players:GetPlayers()
    ) do

        if player ~= LocalPlayer then

            --==================================================
            -- TEAM CHECK
            --==================================================

            if not IsTeammate(player) then

                local character =
                    GetCharacter(player)

                if character and
                    not IsLocalCharacter(
                        character
                    ) then

                    local part =
                        GetTargetPart(
                            character
                        )

                    if part then

                        local screenPosition,
                            onScreen =
                            GetScreenPosition(
                                part
                            )

                        if onScreen then

                            local screenPoint =
                                Vector2.new(
                                    screenPosition.X,
                                    screenPosition.Y
                                )

                            local distance =
                                (
                                    screenPoint -
                                    center
                                ).Magnitude

                            --==================================================
                            -- FOV CHECK
                            --==================================================

                            if distance <=
                                fovRadius
                            then

                                --==================================================
                                -- VISIBLE CHECK
                                --==================================================

                                if IsVisible(
                                    part,
                                    character
                                ) then

                                    if distance <
                                        bestDistance
                                    then

                                        bestDistance =
                                            distance

                                        bestPlayer =
                                            player

                                        bestPart =
                                            part

                                    end

                                end

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
-- AIM AT TARGET
--==================================================

local function AimAt(part)

    if not part then
        return
    end

    if not Camera then
        Camera =
            workspace.CurrentCamera
    end

    if not Camera then
        return
    end

    local cameraPosition =
        Camera.CFrame.Position

    local targetPosition =
        part.Position

    local direction =
        targetPosition -
        cameraPosition

    if direction.Magnitude <= 0 then
        return
    end

    local targetCFrame =
        CFrame.lookAt(
            cameraPosition,
            targetPosition
        )

    local smoothness =
        math.clamp(
            Config.AimSmoothness,
            0.01,
            1
        )

    Camera.CFrame =
        Camera.CFrame:Lerp(
            targetCFrame,
            smoothness
        )

end

--==================================================
-- AIM ASSIST STATE
--==================================================

local CurrentTarget = nil
local CurrentTargetPart = nil

--==================================================
-- AIM ASSIST LOOP
--==================================================

local AimConnection

AimConnection =
    RunService.RenderStepped:Connect(
        function()

            if not Config.AimAssist then

                CurrentTarget = nil
                CurrentTargetPart = nil

                return

            end

            if not LocalPlayer.Character then

                CurrentTarget = nil
                CurrentTargetPart = nil

                return

            end

            local targetPlayer,
                targetPart =
                GetBestTarget()

            CurrentTarget =
                targetPlayer

            CurrentTargetPart =
                targetPart

            if targetPart then

                AimAt(targetPart)

            end

        end
    )

--==================================================
-- CHARACTER RESPAWN SUPPORT
--==================================================

LocalPlayer.CharacterAdded:Connect(
    function()

        CurrentTarget = nil
        CurrentTargetPart = nil

        task.wait(0.5)

        Camera =
            workspace.CurrentCamera

    end
)

--==================================================
-- CAMERA UPDATE SUPPORT
--==================================================

workspace:GetPropertyChangedSignal(
    "CurrentCamera"
):Connect(function()

    Camera =
        workspace.CurrentCamera

end)

--==================================================
-- AIM SETTINGS SAFETY
--==================================================

Config.AimFOVSize =
    math.clamp(
        tonumber(
            Config.AimFOVSize
        ) or 150,
        25,
        1000
    )

Config.AimSmoothness =
    math.clamp(
        tonumber(
            Config.AimSmoothness
        ) or 0.18,
        0.01,
        1
    )

--==================================================
-- DEBUG STATUS
--==================================================

local AimStatus =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    36
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text =
                "Aim Assist: Ready",

            TextColor3 =
                Colors.SubText,

            TextSize = 10,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center

        },
        CombatPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(0, 6)

    },
    AimStatus
)

--==================================================
-- AIM STATUS UPDATE
--==================================================

local function UpdateAimStatus()

    if not Config.AimAssist then

        AimStatus.Text =
            "Aim Assist: Disabled"

        AimStatus.TextColor3 =
            Colors.SubText

        return

    end

    if CurrentTarget then

        AimStatus.Text =
            "Aim Assist: Targeting " ..
            CurrentTarget.Name

        AimStatus.TextColor3 =
            Colors.Text

    else

        AimStatus.Text =
            "Aim Assist: Searching..."

        AimStatus.TextColor3 =
            Colors.SubText

    end

end

--==================================================
-- STATUS LOOP
--==================================================

RunService.RenderStepped:Connect(
    function()

        if AimStatus then
            UpdateAimStatus()
        end

    end
)

--==================================================
-- CLEANUP
--==================================================

local function StopAimAssist()

    if AimConnection then

        AimConnection:Disconnect()

        AimConnection = nil

    end

    CurrentTarget = nil
    CurrentTargetPart = nil

end

--==================================================
-- PART 3 COMPLETE
--==================================================

print(
    "[Lunar Hub] Part 3/6 loaded."
)

--==================================================
-- LUNAR HUB v3.0
-- PART 4/6
-- VISUALS + ESP + AIM FOV
--==================================================

--==================================================
-- VISUALS SECTION
--==================================================

CreateSection(
    VisualPage,
    "ESP",
    "Player visual information"
)

--==================================================
-- ESP
--==================================================

CreateToggle(
    VisualPage,
    "ESP",
    Config.ESP,
    function(value)

        Config.ESP = value

    end
)

--==================================================
-- TEAM CHECK
--==================================================

CreateToggle(
    VisualPage,
    "Team Check",
    Config.TeamCheck,
    function(value)

        Config.TeamCheck = value

    end
)

--==================================================
-- BOX ESP
--==================================================

CreateToggle(
    VisualPage,
    "Box ESP",
    Config.BoxESP,
    function(value)

        Config.BoxESP = value

    end
)

--==================================================
-- NAMES
--==================================================

CreateToggle(
    VisualPage,
    "Names",
    Config.Names,
    function(value)

        Config.Names = value

    end
)

--==================================================
-- HEALTH
--==================================================

CreateToggle(
    VisualPage,
    "Health",
    Config.Health,
    function(value)

        Config.Health = value

    end
)

--==================================================
-- DISTANCE
--==================================================

CreateToggle(
    VisualPage,
    "Distance",
    Config.Distance,
    function(value)

        Config.Distance = value

    end
)

--==================================================
-- AIM FOV SECTION
--==================================================

CreateSection(
    VisualPage,
    "Aim FOV",
    "Configure the Aim Assist field of view"
)

--==================================================
-- AIM FOV TOGGLE
--==================================================

CreateToggle(
    VisualPage,
    "Aim FOV",
    Config.AimFOV,
    function(value)

        Config.AimFOV = value

    end
)

--==================================================
-- AIM FOV SIZE
--==================================================

CreateValue(
    VisualPage,
    "FOV Size",
    Config.AimFOVSize,
    function(value)

        value =
            math.clamp(
                math.floor(value),
                25,
                1000
            )

        Config.AimFOVSize =
            value

    end
)

--==================================================
-- FOV CIRCLE
--==================================================

local FOVCircle = New(
    "Frame",
    {

        Name = "AimFOVCircle",

        Size =
            UDim2.fromOffset(
                Config.AimFOVSize * 2,
                Config.AimFOVSize * 2
            ),

        AnchorPoint =
            Vector2.new(
                0.5,
                0.5
            ),

        Position =
            UDim2.fromOffset(
                0,
                0
            ),

        BackgroundTransparency = 1,

        BorderSizePixel = 0,

        Visible = false,

        ZIndex = 100

    },
    Gui
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                1,
                0
            )

    },
    FOVCircle
)

New(
    "UIStroke",
    {

        Color =
            Colors.Menu,

        Thickness = 2,

        Transparency = 0.1

    },
    FOVCircle
)

--==================================================
-- FOV CIRCLE UPDATE
--==================================================

local function UpdateFOVCircle()

    if not FOVCircle then
        return
    end

    local mouse =
        UserInputService:GetMouseLocation()

    local radius =
        math.clamp(
            Config.AimFOVSize,
            25,
            1000
        )

    FOVCircle.Size =
        UDim2.fromOffset(
            radius * 2,
            radius * 2
        )

    FOVCircle.Position =
        UDim2.fromOffset(
            mouse.X,
            mouse.Y
        )

    FOVCircle.Visible =
        Config.AimFOV

end

RunService.RenderStepped:Connect(
    function()

        UpdateFOVCircle()

    end
)

--==================================================
-- ESP STORAGE
--==================================================

local ESPObjects = {}

--==================================================
-- CREATE ESP
--==================================================

local function CreateESP(player)

    if not player then
        return
    end

    if player == LocalPlayer then
        return
    end

    if ESPObjects[player] then
        return
    end

    --==================================================
    -- BOX
    --==================================================

    local box = New(
        "Frame",
        {

            Name =
                "Box",

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            Visible = false,

            ZIndex = 50

        },
        Gui
    )

    New(
        "UIStroke",
        {

            Color =
                Colors.Menu,

            Thickness = 2,

            Transparency = 0

        },
        box
    )

    --==================================================
    -- NAME
    --==================================================

    local nameLabel = New(
        "TextLabel",
        {

            Name =
                "Name",

            Size =
                UDim2.fromOffset(
                    180,
                    20
                ),

            AnchorPoint =
                Vector2.new(
                    0.5,
                    1
                ),

            BackgroundTransparency = 1,

            TextColor3 =
                Colors.Text,

            TextStrokeTransparency = 0,

            TextStrokeColor3 =
                Color3.new(
                    0,
                    0,
                    0
                ),

            TextSize = 11,

            Font =
                Enum.Font.GothamBold,

            Text = "",

            Visible = false,

            ZIndex = 51

        },
        Gui
    )

    --==================================================
    -- HEALTH
    --==================================================

    local healthLabel = New(
        "TextLabel",
        {

            Name =
                "Health",

            Size =
                UDim2.fromOffset(
                    80,
                    18
                ),

            BackgroundTransparency = 1,

            TextColor3 =
                Colors.Text,

            TextStrokeTransparency = 0,

            TextStrokeColor3 =
                Color3.new(
                    0,
                    0,
                    0
                ),

            TextSize = 10,

            Font =
                Enum.Font.GothamSemibold,

            Text = "",

            Visible = false,

            ZIndex = 51

        },
        Gui
    )

    --==================================================
    -- DISTANCE
    --==================================================

    local distanceLabel = New(
        "TextLabel",
        {

            Name =
                "Distance",

            Size =
                UDim2.fromOffset(
                    100,
                    18
                ),

            BackgroundTransparency = 1,

            TextColor3 =
                Colors.SubText,

            TextStrokeTransparency = 0,

            TextStrokeColor3 =
                Color3.new(
                    0,
                    0,
                    0
                ),

            TextSize = 10,

            Font =
                Enum.Font.Gotham,

            Text = "",

            Visible = false,

            ZIndex = 51

        },
        Gui
    )

    ESPObjects[player] = {

        Box = box,

        Name = nameLabel,

        Health = healthLabel,

        Distance = distanceLabel

    }

end

--==================================================
-- REMOVE ESP
--==================================================

local function RemoveESP(player)

    local data =
        ESPObjects[player]

    if not data then
        return
    end

    for _, object in pairs(data) do

        if object then
            pcall(function()
                object:Destroy()
            end)
        end

    end

    ESPObjects[player] = nil

end

--==================================================
-- PLAYER ESP INITIALIZE
--==================================================

for _, player in ipairs(
    Players:GetPlayers()
) do

    CreateESP(player)

end

Players.PlayerAdded:Connect(
    function(player)

        CreateESP(player)

    end
)

Players.PlayerRemoving:Connect(
    function(player)

        RemoveESP(player)

    end
)

--==================================================
-- GET CHARACTER BOUNDS
--==================================================

local function GetCharacterBounds(
    character
)

    if not character then
        return nil
    end

    local parts = {}

    for _, object in ipairs(
        character:GetDescendants()
    ) do

        if object:IsA("BasePart") then

            table.insert(
                parts,
                object
            )

        end

    end

    if #parts == 0 then
        return nil
    end

    local minX =
        math.huge

    local minY =
        math.huge

    local maxX =
        -math.huge

    local maxY =
        -math.huge

    local visibleCount = 0

    for _, part in ipairs(parts) do

        local halfSize =
            part.Size / 2

        local corners = {

            part.CFrame *
                Vector3.new(
                    -halfSize.X,
                    -halfSize.Y,
                    -halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    -halfSize.X,
                    -halfSize.Y,
                    halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    -halfSize.X,
                    halfSize.Y,
                    -halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    -halfSize.X,
                    halfSize.Y,
                    halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    halfSize.X,
                    -halfSize.Y,
                    -halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    halfSize.X,
                    -halfSize.Y,
                    halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    halfSize.X,
                    halfSize.Y,
                    -halfSize.Z
                ),

            part.CFrame *
                Vector3.new(
                    halfSize.X,
                    halfSize.Y,
                    halfSize.Z
                )

        }

        for _, worldPoint in ipairs(
            corners
        ) do

            local screenPoint,
                onScreen =
                Camera:WorldToViewportPoint(
                    worldPoint
                )

            if onScreen then

                visibleCount += 1

                minX =
                    math.min(
                        minX,
                        screenPoint.X
                    )

                minY =
                    math.min(
                        minY,
                        screenPoint.Y
                    )

                maxX =
                    math.max(
                        maxX,
                        screenPoint.X
                    )

                maxY =
                    math.max(
                        maxY,
                        screenPoint.Y
                    )

            end

        end

    end

    if visibleCount == 0 then
        return nil
    end

    return {

        X = minX,

        Y = minY,

        Width =
            maxX - minX,

        Height =
            maxY - minY

    }

end

--==================================================
-- UPDATE ESP
--==================================================

local function UpdateESP()

    for player, data in pairs(
        ESPObjects
    ) do

        local character =
            player.Character

        local shouldShow =
            Config.ESP

        --==================================================
        -- TEAM CHECK
        --==================================================

        if shouldShow and
            IsTeammate(player)
        then

            shouldShow = false

        end

        local humanoid

        if character then

            humanoid =
                character:FindFirstChildOfClass(
                    "Humanoid"
                )

        end

        if not humanoid or
            humanoid.Health <= 0
        then

            shouldShow = false

        end

        if shouldShow then

            local bounds =
                GetCharacterBounds(
                    character
                )

            if bounds then

                --==================================================
                -- BOX
                --==================================================

                data.Box.Visible =
                    Config.BoxESP

                if Config.BoxESP then

                    data.Box.Position =
                        UDim2.fromOffset(
                            bounds.X,
                            bounds.Y
                        )

                    data.Box.Size =
                        UDim2.fromOffset(
                            math.max(
                                bounds.Width,
                                2
                            ),
                            math.max(
                                bounds.Height,
                                2
                            )
                        )

                end

                --==================================================
                -- NAME
                --==================================================

                data.Name.Visible =
                    Config.Names

                if Config.Names then

                    data.Name.Position =
                        UDim2.fromOffset(
                            bounds.X +
                            bounds.Width / 2,

                            bounds.Y - 2
                        )

                    data.Name.Text =
                        player.Name

                end

                --==================================================
                -- HEALTH
                --==================================================

                data.Health.Visible =
                    Config.Health

                if Config.Health then

                    local health =
                        math.max(
                            0,
                            humanoid.Health
                        )

                    local maxHealth =
                        math.max(
                            1,
                            humanoid.MaxHealth
                        )

                    data.Health.Position =
                        UDim2.fromOffset(
                            bounds.X +
                            bounds.Width +
                            5,

                            bounds.Y
                        )

                    data.Health.Text =
                        string.format(
                            "HP: %d/%d",
                            math.floor(
                                health
                            ),
                            math.floor(
                                maxHealth
                            )
                        )

                end

                --==================================================
                -- DISTANCE
                --==================================================

                data.Distance.Visible =
                    Config.Distance

                if Config.Distance then

                    local root =
                        character:FindFirstChild(
                            "HumanoidRootPart"
                        )

                    if root and
                        LocalPlayer.Character
                    then

                        local localRoot =
                            LocalPlayer.Character:
                            FindFirstChild(
                                "HumanoidRootPart"
                            )

                        if localRoot then

                            local distance =
                                (
                                    root.Position -
                                    localRoot.Position
                                ).Magnitude

                            data.Distance.Position =
                                UDim2.fromOffset(
                                    bounds.X +
                                    bounds.Width +
                                    5,

                                    bounds.Y + 18
                                )

                            data.Distance.Text =
                                string.format(
                                    "%.0f studs",
                                    distance
                                )

                        end

                    end

                end

            else

                data.Box.Visible = false
                data.Name.Visible = false
                data.Health.Visible = false
                data.Distance.Visible = false

            end

        else

            data.Box.Visible = false
            data.Name.Visible = false
            data.Health.Visible = false
            data.Distance.Visible = false

        end

    end

end

--==================================================
-- ESP LOOP
--==================================================

local ESPConnection

ESPConnection =
    RunService.RenderStepped:Connect(
        function()

            if not Camera then
                Camera =
                    workspace.CurrentCamera
            end

            UpdateESP()

        end
    )

--==================================================
-- CLEANUP ESP
--==================================================

local function StopESP()

    if ESPConnection then

        ESPConnection:Disconnect()

        ESPConnection = nil

    end

    for player in pairs(
        ESPObjects
    ) do

        RemoveESP(player)

    end

end

--==================================================
-- VISUALS SAFETY
--==================================================

Config.AimFOVSize =
    math.clamp(
        tonumber(
            Config.AimFOVSize
        ) or 150,
        25,
        1000
    )

Config.TeamCheck =
    Config.TeamCheck == true

Config.ESP =
    Config.ESP == true

--==================================================
-- VISUAL STATUS
--==================================================

local VisualStatus =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    36
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text =
                "ESP: Disabled",

            TextColor3 =
                Colors.SubText,

            TextSize = 10,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center

        },
        VisualPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                0,
                6
            )

    },
    VisualStatus
)

--==================================================
-- VISUAL STATUS UPDATE
--==================================================

RunService.RenderStepped:Connect(
    function()

        if not VisualStatus then
            return
        end

        if Config.ESP then

            if Config.TeamCheck then

                VisualStatus.Text =
                    "ESP: Enabled • Team Check: ON"

            else

                VisualStatus.Text =
                    "ESP: Enabled • Team Check: OFF"

            end

            VisualStatus.TextColor3 =
                Colors.Text

        else

            VisualStatus.Text =
                "ESP: Disabled"

            VisualStatus.TextColor3 =
                Colors.SubText

        end

    end
)

--==================================================
-- VISUAL PAGE READY
--==================================================

SetPage(CombatPage)

--==================================================
-- PART 4 COMPLETE
--==================================================

print(
    "[Lunar Hub] Part 4/6 loaded."
)

--==================================================
-- LUNAR HUB v3.0
-- PART 5/6
-- MOVEMENT
--==================================================

--==================================================
-- MOVEMENT SECTION
--==================================================

CreateSection(
    MovementPage,
    "Movement",
    "Movement and character settings"
)

--==================================================
-- CHARACTER REFERENCES
--==================================================

local Character = nil
local Humanoid = nil

local OriginalWalkSpeed = 16
local OriginalJumpPower = 50
local OriginalJumpHeight = 7.2

--==================================================
-- UPDATE CHARACTER
--==================================================

local function UpdateCharacter()

    Character =
        LocalPlayer.Character

    if not Character then

        Humanoid = nil

        return

    end

    Humanoid =
        Character:FindFirstChildOfClass(
            "Humanoid"
        )

    if Humanoid then

        OriginalWalkSpeed =
            Humanoid.WalkSpeed

        pcall(function()

            OriginalJumpPower =
                Humanoid.JumpPower

        end)

        pcall(function()

            OriginalJumpHeight =
                Humanoid.JumpHeight

        end)

    end

end

UpdateCharacter()

--==================================================
-- CHARACTER ADDED
--==================================================

LocalPlayer.CharacterAdded:Connect(
    function(character)

        Character = character

        Humanoid =
            character:WaitForChild(
                "Humanoid",
                5
            )

        if Humanoid then

            OriginalWalkSpeed =
                Humanoid.WalkSpeed

            pcall(function()

                OriginalJumpPower =
                    Humanoid.JumpPower

            end)

            pcall(function()

                OriginalJumpHeight =
                    Humanoid.JumpHeight

            end)

        end

        task.wait(0.15)

        if Humanoid then

            if Config.Speed then

                Humanoid.WalkSpeed =
                    Config.SpeedValue

            end

            if Config.Jump then

                pcall(function()

                    Humanoid.UseJumpPower =
                        true

                    Humanoid.JumpPower =
                        Config.JumpPower

                end)

            end

        end

    end
)

--==================================================
-- SPEED
--==================================================

CreateToggle(
    MovementPage,
    "Speed",
    Config.Speed,
    function(value)

        Config.Speed =
            value

        if not Humanoid then
            UpdateCharacter()
        end

        if not Humanoid then
            return
        end

        if value then

            Humanoid.WalkSpeed =
                Config.SpeedValue

        else

            Humanoid.WalkSpeed =
                OriginalWalkSpeed

        end

    end
)

--==================================================
-- SPEED VALUE
--==================================================

CreateValue(
    MovementPage,
    "Speed Value",
    Config.SpeedValue,
    function(value)

        value =
            math.clamp(
                math.floor(value),
                1,
                500
            )

        Config.SpeedValue =
            value

        if Config.Speed and
            Humanoid
        then

            Humanoid.WalkSpeed =
                value

        end

    end
)

--==================================================
-- JUMP
--==================================================

CreateToggle(
    MovementPage,
    "Jump",
    Config.Jump,
    function(value)

        Config.Jump =
            value

        if not Humanoid then
            UpdateCharacter()
        end

        if not Humanoid then
            return
        end

        if value then

            pcall(function()

                Humanoid.UseJumpPower =
                    true

                Humanoid.JumpPower =
                    Config.JumpPower

            end)

        else

            pcall(function()

                Humanoid.UseJumpPower =
                    true

                Humanoid.JumpPower =
                    OriginalJumpPower

            end)

            pcall(function()

                Humanoid.JumpHeight =
                    OriginalJumpHeight

            end)

        end

    end
)

--==================================================
-- JUMP POWER
--==================================================

CreateValue(
    MovementPage,
    "Jump Power",
    Config.JumpPower,
    function(value)

        value =
            math.clamp(
                math.floor(value),
                1,
                500
            )

        Config.JumpPower =
            value

        if Config.Jump and
            Humanoid
        then

            pcall(function()

                Humanoid.UseJumpPower =
                    true

                Humanoid.JumpPower =
                    value

            end)

        end

    end
)

--==================================================
-- NOCLIP
--==================================================

CreateToggle(
    MovementPage,
    "Noclip",
    Config.Noclip,
    function(value)

        Config.Noclip =
            value

    end
)

--==================================================
-- NOCLIP LOOP
--==================================================

local NoclipConnection

NoclipConnection =
    RunService.Stepped:Connect(
        function()

            if not Config.Noclip then
                return
            end

            local character =
                LocalPlayer.Character

            if not character then
                return
            end

            for _, object in ipairs(
                character:GetDescendants()
            ) do

                if object:IsA("BasePart") then

                    object.CanCollide = false

                end

            end

        end
    )

--==================================================
-- RESTORE COLLISION
--==================================================

local function RestoreCollision()

    local character =
        LocalPlayer.Character

    if not character then
        return
    end

    for _, object in ipairs(
        character:GetDescendants()
    ) do

        if object:IsA("BasePart") then

            object.CanCollide = true

        end

    end

end

--==================================================
-- CAMERA FOV SECTION
--==================================================

CreateSection(
    MovementPage,
    "Camera",
    "Camera field of view settings"
)

--==================================================
-- FOV CHANGER
--==================================================

CreateToggle(
    MovementPage,
    "FOV Changer",
    Config.FOVChanger,
    function(value)

        Config.FOVChanger =
            value

        if not Camera then
            Camera =
                workspace.CurrentCamera
        end

        if not Camera then
            return
        end

        if value then

            Camera.FieldOfView =
                Config.GameFOV

        else

            Camera.FieldOfView = 70

        end

    end
)

--==================================================
-- GAME FOV
--==================================================

CreateValue(
    MovementPage,
    "Game FOV",
    Config.GameFOV,
    function(value)

        value =
            math.clamp(
                math.floor(value),
                40,
                120
            )

        Config.GameFOV =
            value

        if Config.FOVChanger and
            Camera
        then

            Camera.FieldOfView =
                value

        end

    end
)

--==================================================
-- MOVEMENT LOOP
--==================================================

local MovementConnection

MovementConnection =
    RunService.RenderStepped:Connect(
        function()

            if not Humanoid then

                Character =
                    LocalPlayer.Character

                if Character then

                    Humanoid =
                        Character:
                        FindFirstChildOfClass(
                            "Humanoid"
                        )

                end

            end

            if Humanoid then

                -- SPEED
                if Config.Speed then

                    if Humanoid.WalkSpeed ~=
                        Config.SpeedValue
                    then

                        Humanoid.WalkSpeed =
                            Config.SpeedValue

                    end

                end

                -- JUMP
                if Config.Jump then

                    pcall(function()

                        if Humanoid.JumpPower ~=
                            Config.JumpPower
                        then

                            Humanoid.UseJumpPower =
                                true

                            Humanoid.JumpPower =
                                Config.JumpPower

                        end

                    end)

                end

            end

            -- CAMERA FOV
            if Config.FOVChanger then

                if not Camera then
                    Camera =
                        workspace.CurrentCamera
                end

                if Camera then

                    if math.abs(
                        Camera.FieldOfView -
                        Config.GameFOV
                    ) > 0.1 then

                        Camera.FieldOfView =
                            Config.GameFOV

                    end

                end

            end

        end
    )

--==================================================
-- MOVEMENT STATUS
--==================================================

local MovementStatus =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    36
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text =
                "Movement: Ready",

            TextColor3 =
                Colors.SubText,

            TextSize = 10,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center

        },
        MovementPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                0,
                6
            )

    },
    MovementStatus
)

--==================================================
-- MOVEMENT STATUS UPDATE
--==================================================

RunService.RenderStepped:Connect(
    function()

        if not MovementStatus then
            return
        end

        local status = {}

        if Config.Speed then

            table.insert(
                status,
                "Speed"
            )

        end

        if Config.Jump then

            table.insert(
                status,
                "Jump"
            )

        end

        if Config.Noclip then

            table.insert(
                status,
                "Noclip"
            )

        end

        if Config.FOVChanger then

            table.insert(
                status,
                "FOV"
            )

        end

        if #status == 0 then

            MovementStatus.Text =
                "Movement: No features enabled"

            MovementStatus.TextColor3 =
                Colors.SubText

        else

            MovementStatus.Text =
                "Active: " ..
                table.concat(
                    status,
                    " • "
                )

            MovementStatus.TextColor3 =
                Colors.Text

        end

    end
)

--==================================================
-- DISABLE ALL MOVEMENT
--==================================================

local function DisableMovement()

    Config.Speed = false
    Config.Jump = false
    Config.Noclip = false
    Config.FOVChanger = false

    if Humanoid then

        Humanoid.WalkSpeed =
            OriginalWalkSpeed

        pcall(function()

            Humanoid.UseJumpPower =
                true

            Humanoid.JumpPower =
                OriginalJumpPower

        end)

        pcall(function()

            Humanoid.JumpHeight =
                OriginalJumpHeight

        end)

    end

    RestoreCollision()

    if Camera then

        Camera.FieldOfView = 70

    end

end

--==================================================
-- CAMERA UPDATE
--==================================================

workspace:GetPropertyChangedSignal(
    "CurrentCamera"
):Connect(
    function()

        Camera =
            workspace.CurrentCamera

        if Config.FOVChanger and
            Camera
        then

            Camera.FieldOfView =
                Config.GameFOV

        end

    end
)

--==================================================
-- PART 5 COMPLETE
--==================================================

print(
    "[Lunar Hub] Part 5/6 loaded."
)

--==================================================
-- LUNAR HUB v3.0
-- PART 6/6
-- MISC + SETTINGS + FINAL
--==================================================

--==================================================
-- MISC PAGE
--==================================================

CreateSection(
    MiscPage,
    "Misc",
    "Additional information"
)

local MiscInfo =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    70
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text =
                "LUNAR HUB\n\n"
                .. "Universal utility hub",

            TextColor3 =
                Colors.Text,

            TextSize = 11,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center,

            TextWrapped = true

        },
        MiscPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                0,
                7
            )

    },
    MiscInfo
)

--==================================================
-- SETTINGS PAGE
--==================================================

CreateSection(
    SettingsPage,
    "Lunar Hub",
    "Information and links"
)

--==================================================
-- VERSION
--==================================================

local VersionCard =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    48
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text =
                "Version: v3.0",

            TextColor3 =
                Colors.Text,

            TextSize = 11,

            Font =
                Enum.Font.GothamSemibold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center

        },
        SettingsPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                0,
                7
            )

    },
    VersionCard
)

--==================================================
-- CREATOR
--==================================================

local CreatorCard =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    48
                ),

            BackgroundColor3 =
                Colors.Card,

            BorderSizePixel = 0,

            Text =
                "By: Lunar Hub",

            TextColor3 =
                Colors.Text,

            TextSize = 11,

            Font =
                Enum.Font.GothamSemibold,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center

        },
        SettingsPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                0,
                7
            )

    },
    CreatorCard
)

--==================================================
-- TELEGRAM SECTION
--==================================================

CreateSection(
    SettingsPage,
    "Telegram",
    "Lunar Hub community"
)

local TelegramButton =
    New(
        "TextButton",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    46
                ),

            BackgroundColor3 =
                Colors.Menu,

            BorderSizePixel = 0,

            Text =
                "Telegram  •  @lunarhub_script",

            TextColor3 =
                Colors.Text,

            TextSize = 11,

            Font =
                Enum.Font.GothamSemibold,

            AutoButtonColor = false

        },
        SettingsPage
    )

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(
                0,
                7
            )

    },
    TelegramButton
)

New(
    "UIStroke",
    {

        Color =
            Colors.Border,

        Thickness = 1

    },
    TelegramButton
)

TelegramButton.MouseEnter:Connect(
    function()

        Tween(
            TelegramButton,
            {
                BackgroundColor3 =
                    Colors.CardHover
            },
            0.12
        )

    end
)

TelegramButton.MouseLeave:Connect(
    function()

        Tween(
            TelegramButton,
            {
                BackgroundColor3 =
                    Colors.Menu
            },
            0.12
        )

    end
)

TelegramButton.MouseButton1Click:Connect(
    function()

        local url =
            "https://t.me/lunarhub_script"

        pcall(
            function()

                if setclipboard then

                    setclipboard(url)

                end

            end
        )

        TelegramButton.Text =
            "Telegram link copied!"

        task.delay(
            1.5,
            function()

                if TelegramButton then

                    TelegramButton.Text =
                        "Telegram  •  @lunarhub_script"

                end

            end
        )

    end
)

--==================================================
-- STATUS
--==================================================

local SettingsStatus =
    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -10,
                    0,
                    45
                ),

            BackgroundTransparency = 1,

            Text =
                "Lunar Hub v3.0",

            TextColor3 =
                Colors.SubText,

            TextSize = 10,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left,

            TextYAlignment =
                Enum.TextYAlignment.Center

        },
        SettingsPage
    )

--==================================================
-- CLOSE BUTTON
--==================================================

local function Cleanup()

    Config.Speed =
        false

    Config.Jump =
        false

    Config.Noclip =
        false

    Config.FOVChanger =
        false

    pcall(
        function()

            if Humanoid then

                Humanoid.WalkSpeed =
                    OriginalWalkSpeed

                Humanoid.UseJumpPower =
                    true

                Humanoid.JumpPower =
                    OriginalJumpPower

                Humanoid.JumpHeight =
                    OriginalJumpHeight

            end

        end
    )

    pcall(
        function()

            RestoreCollision()

        end
    )

    pcall(
        function()

            if Camera then

                Camera.FieldOfView = 70

            end

        end
    )

    pcall(
        function()

            if NoclipConnection then

                NoclipConnection:Disconnect()

            end

        end
    )

    pcall(
        function()

            if MovementConnection then

                MovementConnection:Disconnect()

            end

    end)

    pcall(
        function()

            for player, _ in pairs(
                ESPObjects
            ) do

                StopESP(player)

            end

        end
    )

    pcall(
        function()

            if Gui then

                Gui:Destroy()

            end

        end
    )

end

CloseButton.MouseButton1Click:Connect(
    function()

        Cleanup()

    end
)

--==================================================
-- DRAG MENU
--==================================================

local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
            or
            input.UserInputType ==
            Enum.UserInputType.Touch
        then

            Dragging = true

            DragStart =
                input.Position

            StartPosition =
                Main.Position

        end

    end
)

TopBar.InputEnded:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
            or
            input.UserInputType ==
            Enum.UserInputType.Touch
        then

            Dragging = false

        end

    end
)

UserInputService.InputChanged:Connect(
    function(input)

        if not Dragging then
            return
        end

        if input.UserInputType ~=
            Enum.UserInputType.MouseMovement
            and
            input.UserInputType ~=
            Enum.UserInputType.Touch
        then

            return

        end

        local Delta =
            input.Position -
            DragStart

        Main.Position =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset +
                    Delta.X,

                StartPosition.Y.Scale,
                StartPosition.Y.Offset +
                    Delta.Y
            )

    end
)

--==================================================
-- DEFAULT PAGE
--==================================================

SetPage(CombatPage)

--==================================================
-- FINAL STATUS
--==================================================

print(
    "================================"
)

print(
    "[Lunar Hub] v3.0 loaded."
)

print(
    "[Lunar Hub] By: Lunar Hub"
)

print(
    "[Lunar Hub] All 6 parts loaded."
)

print(
    "================================"
)

--==================================================
-- END OF LUNAR HUB v3.0
--==================================================
