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

--==================================================
-- NEUTRALIZATION HUB UPDATE
-- PART 1/8 - TITLE / LOGO
--==================================================

pcall(function()
    -- Цвет НЕ меняем.
    Logo.Text = "N"
    Title.Text = "NEUTRALIZATION HUB"

    Status.Text = "Neutralization Hub\nUser"

    Version.Text = "v3.0"
end)

print("[Neutralization Hub] Part 1/8 applied.")

--==================================================
-- NEUTRALIZATION HUB UPDATE
-- PART 2/8 - CENTERED AIM FOV
--==================================================

pcall(function()

    GetMousePosition = function()
        local camera = workspace.CurrentCamera

        if not camera then
            return Vector2.new(0, 0)
        end

        local viewport = camera.ViewportSize

        return Vector2.new(
            viewport.X / 2,
            viewport.Y / 2
        )
    end

    UpdateFOVCircle = function()

        if not FOVCircle then
            return
        end

        local camera = workspace.CurrentCamera

        if not camera then
            return
        end

        local viewport = camera.ViewportSize

        local center = Vector2.new(
            viewport.X / 2,
            viewport.Y / 2
        )

        local radius = math.clamp(
            Config.AimFOVSize,
            25,
            1000
        )

        FOVCircle.Size = UDim2.fromOffset(
            radius * 2,
            radius * 2
        )

        FOVCircle.AnchorPoint =
            Vector2.new(0.5, 0.5)

        FOVCircle.Position =
            UDim2.fromOffset(
                center.X,
                center.Y
            )

        FOVCircle.Visible =
            Config.AimFOV == true
    end

end)

print("[Neutralization Hub] Part 2/8 applied.")

--==================================================
-- NEUTRALIZATION HUB UPDATE
-- PART 4-8/8
--==================================================

pcall(function()

    --==================================================
    -- PART 4 - AIM FOV -> COMBAT
    --==================================================

    -- Удаляем старые контролы Aim FOV из Visuals.
    if VisualPage then
        for _, child in ipairs(VisualPage:GetChildren()) do
            if child:IsA("GuiObject") then

                local remove = false

                for _, obj in ipairs(child:GetDescendants()) do
                    if obj:IsA("TextLabel")
                        or obj:IsA("TextButton")
                        or obj:IsA("TextBox")
                    then
                        local text = tostring(obj.Text)

                        if text == "Aim FOV"
                            or text == "FOV Size"
                        then
                            remove = true
                            break
                        end
                    end
                end

                if remove then
                    child:Destroy()
                end
            end
        end
    end

    -- Добавляем Aim FOV в Combat.
    if CombatPage and CreateSection then
        pcall(function()
            CreateSection(
                CombatPage,
                "Aim FOV",
                "Configure the Aim Assist field of view"
            )
        end)
    end

    if CombatPage and CreateToggle then
        pcall(function()
            CreateToggle(
                CombatPage,
                "Aim FOV",
                Config.AimFOV,
                function(value)
                    Config.AimFOV = value
                end
            )
        end)
    end

    if CombatPage and CreateValue then
        pcall(function()
            CreateValue(
                CombatPage,
                "FOV Size",
                Config.AimFOVSize,
                function(value)
                    Config.AimFOVSize = math.clamp(
                        math.floor(value),
                        25,
                        1000
                    )
                end
            )
        end)
    end


    --==================================================
    -- PART 5 - ESP TEAM FILTER
    --==================================================

    -- Team Check больше не является отдельной
    -- настройкой. Союзники всегда исключаются из ESP.
    Config.TeamCheck = true

    if IsTeammate then

        local OldIsTeammate = IsTeammate

        IsTeammate = function(player)

            if not player then
                return false
            end

            if player == LocalPlayer then
                return false
            end

            if LocalPlayer
                and LocalPlayer.Team
                and player.Team
            then
                return player.Team == LocalPlayer.Team
            end

            return OldIsTeammate(player)
        end

    end


    --==================================================
    -- PART 6 - REMOVE TEAM CHECK / FOV CHANGER
    --==================================================

    -- Убираем Team Check из Visuals.
    if VisualPage then

        for _, child in ipairs(
            VisualPage:GetChildren()
        ) do

            if child:IsA("GuiObject") then

                local remove = false

                for _, obj in ipairs(
                    child:GetDescendants()
                ) do

                    if obj:IsA("TextLabel")
                        or obj:IsA("TextButton")
                        or obj:IsA("TextBox")
                    then

                        if tostring(obj.Text)
                            == "Team Check"
                        then
                            remove = true
                            break
                        end

                    end
                end

                if remove then
                    child:Destroy()
                end

            end
        end
    end


    -- Полностью отключаем FOV Changer.
    Config.FOVChanger = false

    -- Возвращаем стандартный FOV камеры.
    pcall(function()

        local camera = workspace.CurrentCamera

        if camera then
            camera.FieldOfView = 70
        end

    end)


    -- Убираем контролы FOV Changer / Game FOV
    -- из Movement.
    if MovementPage then

        for _, child in ipairs(
            MovementPage:GetChildren()
        ) do

            if child:IsA("GuiObject") then

                local remove = false

                for _, obj in ipairs(
                    child:GetDescendants()
                ) do

                    if obj:IsA("TextLabel")
                        or obj:IsA("TextButton")
                        or obj:IsA("TextBox")
                    then

                        local text = tostring(obj.Text)

                        if text == "FOV Changer"
                            or text == "Game FOV"
                        then
                            remove = true
                            break
                        end

                    end
                end

                if remove then
                    child:Destroy()
                end

            end
        end
    end


    --==================================================
    -- PART 7 - REMOVE MISC / ROUND CORNERS
    --==================================================

    -- Удаляем Misc страницу.
    if MiscPage then
        pcall(function()
            MiscPage:Destroy()
        end)
    end

    -- Удаляем кнопку Misc.
    if CategoryButtons and MiscPage then
        pcall(function()

            local button =
                CategoryButtons[MiscPage]

            if button then
                button:Destroy()
            end

            CategoryButtons[MiscPage] = nil

        end)
    end


    -- Скругляем существующие UI элементы.
    if Gui then

        for _, object in ipairs(
            Gui:GetDescendants()
        ) do

            if object:IsA("Frame")
                or object:IsA("TextButton")
                or object:IsA("TextLabel")
                or object:IsA("TextBox")
                or object:IsA("ScrollingFrame")
            then

                if not object:FindFirstChildOfClass(
                    "UICorner"
                ) then

                    local corner =
                        Instance.new("UICorner")

                    corner.CornerRadius =
                        UDim.new(0, 8)

                    corner.Parent = object

                end
            end
        end
    end


    --==================================================
    -- PART 8 - MINIMIZE / RESTORE
    --==================================================

    if Main and TopBar and Gui then

        local MinimizeButton =
            Instance.new("TextButton")

        MinimizeButton.Name =
            "NeutralizationMinimize"

        MinimizeButton.Size =
            UDim2.fromOffset(30, 30)

        MinimizeButton.Position =
            UDim2.new(1, -73, 0, 9)

        MinimizeButton.BackgroundColor3 =
            Colors.Menu

        MinimizeButton.BorderSizePixel = 0

        MinimizeButton.Text = "−"

        MinimizeButton.TextColor3 =
            Colors.Text

        MinimizeButton.TextSize = 18

        MinimizeButton.Font =
            Enum.Font.GothamBold

        MinimizeButton.AutoButtonColor = false

        MinimizeButton.Parent = TopBar


        local MiniCorner =
            Instance.new("UICorner")

        MiniCorner.CornerRadius =
            UDim.new(1, 0)

        MiniCorner.Parent =
            MinimizeButton


        local FloatingButton =
            Instance.new("TextButton")

        FloatingButton.Name =
            "NeutralizationFloatingButton"

        FloatingButton.Size =
            UDim2.fromOffset(52, 52)

        FloatingButton.Position =
            Main.Position

        FloatingButton.AnchorPoint =
            Vector2.new(0.5, 0.5)

        FloatingButton.BackgroundColor3 =
            Colors.Menu

        FloatingButton.BorderSizePixel = 0

        FloatingButton.Text = "N"

        FloatingButton.TextColor3 =
            Colors.Text

        FloatingButton.TextSize = 22

        FloatingButton.Font =
            Enum.Font.GothamBold

        FloatingButton.Visible = false

        FloatingButton.AutoButtonColor = false

        FloatingButton.Parent = Gui


        local FloatingCorner =
            Instance.new("UICorner")

        FloatingCorner.CornerRadius =
            UDim.new(1, 0)

        FloatingCorner.Parent =
            FloatingButton


        local FloatingStroke =
            Instance.new("UIStroke")

        FloatingStroke.Color =
            Colors.Border

        FloatingStroke.Thickness = 1

        FloatingStroke.Transparency = 0.15

        FloatingStroke.Parent =
            FloatingButton


        local MenuOpen = true


        -- Сворачивание.
        MinimizeButton.MouseButton1Click:Connect(
            function()

                if not MenuOpen then
                    return
                end

                MenuOpen = false

                FloatingButton.Position =
                    UDim2.new(
                        Main.Position.X.Scale,
                        Main.Position.X.Offset + 260,
                        Main.Position.Y.Scale,
                        Main.Position.Y.Offset + 160
                    )

                local tween

                if Tween then
                    tween = Tween(
                        Main,
                        {
                            Size =
                                UDim2.fromOffset(0, 0)
                        },
                        0.28
                    )

                    tween:Play()
                else
                    Main.Size =
                        UDim2.fromOffset(0, 0)
                end

                task.delay(
                    0.28,
                    function()

                        Main.Visible = false
                        FloatingButton.Visible = true

                    end
                )

            end
        )


        -- Раскрытие.
        FloatingButton.MouseButton1Click:Connect(
            function()

                if MenuOpen then
                    return
                end

                MenuOpen = true

                FloatingButton.Visible = false
                Main.Visible = true

                Main.Size =
                    UDim2.fromOffset(0, 0)

                if Tween then

                    local tween = Tween(
                        Main,
                        {
                            Size =
                                UDim2.fromOffset(
                                    520,
                                    320
                                )
                        },
                        0.35
                    )

                    tween:Play()

                else

                    Main.Size =
                        UDim2.fromOffset(
                            520,
                            320
                        )

                end

            end
        )


        -- Hover мини-кнопки.
        FloatingButton.MouseEnter:Connect(
            function()

                if Tween then

                    Tween(
                        FloatingButton,
                        {
                            Size =
                                UDim2.fromOffset(
                                    56,
                                    56
                                )
                        },
                        0.15
                    ):Play()

                else

                    FloatingButton.Size =
                        UDim2.fromOffset(
                            56,
                            56
                        )

                end

            end
        )


        FloatingButton.MouseLeave:Connect(
            function()

                if Tween then

                    Tween(
                        FloatingButton,
                        {
                            Size =
                                UDim2.fromOffset(
                                    52,
                                    52
                                )
                        },
                        0.15
                    ):Play()

                else

                    FloatingButton.Size =
                        UDim2.fromOffset(
                            52,
                            52
                        )

                end

            end
        )

    end


    --==================================================
    -- FINAL
    --==================================================

    print(
        "[Neutralization Hub] Update 4-8 applied."
    )

    print(
        "[Neutralization Hub] Menu size preserved: 520x320"
    )

    print(
        "[Neutralization Hub] Aim FOV: CENTER"
    )

    print(
        "[Neutralization Hub] ESP: TEAMMATES FILTERED"
    )

    print(
        "[Neutralization Hub] FOV Changer: REMOVED"
    )

    print(
        "[Neutralization Hub] Misc: REMOVED"
    )

end)

-- =========================================================
-- NEUTRALIZATION HUB - FINAL UPDATE
-- INSERT THIS ENTIRE BLOCK AT THE VERY END OF THE FILE
-- =========================================================

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- =========================================================
-- 1. TITLE / LOGO
-- =========================================================

pcall(function()
    if Logo then
        Logo.Text = "N"
    end

    if Title then
        Title.Text = "NEUTRALIZATION HUB"
    end

    if Status then
        Status.Text = "Neutralization Hub\nUser"
    end

    if Version then
        Version.Text = "v3.0"
    end
end)


-- =========================================================
-- 2. KEEP MENU SIZE 520x320
-- =========================================================

pcall(function()
    Main.Size = UDim2.fromOffset(520, 320)
end)


-- =========================================================
-- 3. FORCE AIM FOV TO SCREEN CENTER
-- =========================================================

local function Neutralization_GetScreenCenter()
    local Camera = workspace.CurrentCamera

    if not Camera then
        return Vector2.new(0, 0)
    end

    local Viewport = Camera.ViewportSize

    return Vector2.new(
        Viewport.X / 2,
        Viewport.Y / 2
    )
end

pcall(function()
    GetMousePosition = function()
        return Neutralization_GetScreenCenter()
    end
end)

pcall(function()
    UpdateFOVCircle = function()
        if not FOVCircle then
            return
        end

        if not FOVCircle.Parent then
            return
        end

        local Center = Neutralization_GetScreenCenter()

        FOVCircle.Position = UDim2.fromOffset(
            Center.X,
            Center.Y
        )
    end
end)


-- =========================================================
-- 4. FORCE ALLIES TO BE FRIENDLY
-- =========================================================

local function Neutralization_IsFriendly(player)
    if not player then
        return true
    end

    if player == LocalPlayer then
        return true
    end

    -- Normal Roblox Team system
    if LocalPlayer.Team ~= nil and player.Team ~= nil then
        if LocalPlayer.Team == player.Team then
            return true
        end
    end

    return false
end


-- Replace the old teammate check completely
pcall(function()
    IsTeammate = function(player)
        return Neutralization_IsFriendly(player)
    end
end)


-- =========================================================
-- 5. AIM ASSIST - NEVER TARGET ALLIES
-- =========================================================

pcall(function()

    if GetBestTarget then

        local Neutralization_OriginalGetBestTarget = GetBestTarget

        GetBestTarget = function(...)

            local Target = Neutralization_OriginalGetBestTarget(...)

            if Target and Neutralization_IsFriendly(Target) then
                return nil
            end

            return Target
        end

    end

end)


-- =========================================================
-- 6. EXTRA AIM SAFETY
-- =========================================================

pcall(function()

    if Players then

        for _, Player in ipairs(Players:GetPlayers()) do

            if Player ~= LocalPlayer then

                Player.CharacterAdded:Connect(function()
                    task.wait(0.2)

                    -- Nothing required here.
                    -- This keeps the target filtering active
                    -- after character respawns.
                end)

            end

        end

    end

end)


-- =========================================================
-- 7. REMOVE TEAM CHECK FROM VISUALS
-- =========================================================

pcall(function()

    if VisualsPage then

        for _, Object in ipairs(VisualsPage:GetDescendants()) do

            if Object:IsA("TextLabel")
                or Object:IsA("TextButton")
                or Object:IsA("TextBox") then

                local Text = tostring(Object.Text or "")

                if Text == "Team Check"
                    or Text == "Team check"
                    or Text == "TEAM CHECK" then

                    local Parent = Object.Parent

                    if Parent then
                        Parent:Destroy()
                    else
                        Object:Destroy()
                    end

                end

            end

        end

    end

end)


-- =========================================================
-- 8. FORCE ESP TO IGNORE ALLIES
-- =========================================================

pcall(function()

    if UpdateESP then

        local Neutralization_OriginalUpdateESP = UpdateESP

        UpdateESP = function(...)

            local Result = Neutralization_OriginalUpdateESP(...)

            -- Existing ESP system already uses IsTeammate.
            -- Our replacement above makes the teammate check
            -- independent from the Visuals Team Check toggle.

            return Result
        end

    end

end)


-- =========================================================
-- 9. REMOVE FOV CHANGER FROM MOVEMENT
-- =========================================================

pcall(function()

    if Config then
        Config.FOVChanger = false
    end

    local Camera = workspace.CurrentCamera

    if Camera then
        Camera.FieldOfView = 70
    end

end)


pcall(function()

    if MovementPage then

        for _, Object in ipairs(MovementPage:GetDescendants()) do

            if Object:IsA("TextLabel")
                or Object:IsA("TextButton")
                or Object:IsA("TextBox") then

                local Text = tostring(Object.Text or "")

                if Text == "FOV Changer"
                    or Text == "FOV changer"
                    or Text == "Game FOV"
                    or Text == "Game fov" then

                    local Parent = Object.Parent

                    if Parent then
                        Parent:Destroy()
                    else
                        Object:Destroy()
                    end

                end

            end

        end

    end

end)


-- =========================================================
-- 10. REMOVE MISC CATEGORY
-- =========================================================

pcall(function()

    if MiscPage then
        MiscPage:Destroy()
    end

end)

pcall(function()

    if CategoryButtons and CategoryButtons.Misc then

        local Button = CategoryButtons.Misc

        if Button then
            Button:Destroy()
        end

        CategoryButtons.Misc = nil
    end

end)


-- =========================================================
-- 11. ROUNDED CORNERS EVERYWHERE
-- =========================================================

pcall(function()

    local function AddRound(Object)

        if Object:IsA("Frame")
            or Object:IsA("TextButton")
            or Object:IsA("TextLabel")
            or Object:IsA("TextBox")
            or Object:IsA("ScrollingFrame") then

            local Corner = Object:FindFirstChildOfClass("UICorner")

            if not Corner then

                Corner = Instance.new("UICorner")
                Corner.CornerRadius = UDim.new(0, 8)
                Corner.Parent = Object

            end

        end

    end

    for _, Object in ipairs(Gui:GetDescendants()) do
        AddRound(Object)
    end

end)


-- =========================================================
-- 12. FIND / CREATE MINIMIZE BUTTON
-- =========================================================

local Neutralization_Minimize = nil
local Neutralization_Floating = nil

pcall(function()

    Neutralization_Minimize = TopBar:FindFirstChild("NeutralizationMinimize")

    if not Neutralization_Minimize then

        Neutralization_Minimize = Instance.new("TextButton")
        Neutralization_Minimize.Name = "NeutralizationMinimize"
        Neutralization_Minimize.Parent = TopBar

        Neutralization_Minimize.BackgroundTransparency = 1
        Neutralization_Minimize.Size = UDim2.fromOffset(30, 30)
        Neutralization_Minimize.Position = UDim2.new(1, -68, 0, 5)

        Neutralization_Minimize.Text = "−"
        Neutralization_Minimize.TextSize = 22
        Neutralization_Minimize.Font = Enum.Font.GothamBold
        Neutralization_Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)

        Neutralization_Minimize.AutoButtonColor = false

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(1, 0)
        Corner.Parent = Neutralization_Minimize

    end

end)


-- =========================================================
-- 13. CREATE MOVABLE FLOATING BUTTON
-- =========================================================

pcall(function()

    Neutralization_Floating = Gui:FindFirstChild(
        "NeutralizationFloatingButton"
    )

    if not Neutralization_Floating then

        Neutralization_Floating = Instance.new("TextButton")
        Neutralization_Floating.Name = "NeutralizationFloatingButton"
        Neutralization_Floating.Parent = Gui

        Neutralization_Floating.Size = UDim2.fromOffset(54, 54)

        -- Bottom-left instead of center
        Neutralization_Floating.AnchorPoint = Vector2.new(0.5, 0.5)
        Neutralization_Floating.Position = UDim2.new(
            0,
            65,
            1,
            -65
        )

        Neutralization_Floating.Text = "N"

        Neutralization_Floating.Font = Enum.Font.GothamBold
        Neutralization_Floating.TextSize = 24
        Neutralization_Floating.TextColor3 = Color3.fromRGB(
            255,
            255,
            255
        )

        Neutralization_Floating.BackgroundColor3 =
            Color3.fromRGB(190, 25, 25)

        Neutralization_Floating.AutoButtonColor = false
        Neutralization_Floating.Visible = false
        Neutralization_Floating.ZIndex = 999

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(1, 0)
        Corner.Parent = Neutralization_Floating

        local Stroke = Instance.new("UIStroke")
        Stroke.Thickness = 1.5
        Stroke.Transparency = 0.25
        Stroke.Parent = Neutralization_Floating

    end

end)


-- =========================================================
-- 14. DRAG FLOATING BUTTON
-- =========================================================

pcall(function()

    if Neutralization_Floating then

        local Dragging = false
        local DragStart = nil
        local StartPosition = nil

        Neutralization_Floating.InputBegan:Connect(function(Input)

            if Input.UserInputType == Enum.UserInputType.MouseButton1
                or Input.UserInputType == Enum.UserInputType.Touch then

                Dragging = true
                DragStart = Input.Position
                StartPosition = Neutralization_Floating.Position

            end

        end)


        Neutralization_Floating.InputEnded:Connect(function(Input)

            if Input.UserInputType == Enum.UserInputType.MouseButton1
                or Input.UserInputType == Enum.UserInputType.Touch then

                Dragging = false

            end

        end)


        UIS.InputChanged:Connect(function(Input)

            if not Dragging then
                return
            end

            if Input.UserInputType ~= Enum.UserInputType.MouseMovement
                and Input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            if not DragStart or not StartPosition then
                return
            end

            local Delta = Input.Position - DragStart

            Neutralization_Floating.Position = UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,

                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )

        end)

    end

end)


-- =========================================================
-- 15. ANIMATION SETUP
-- =========================================================

local Neutralization_MainScale = nil

pcall(function()

    Neutralization_MainScale =
        Main:FindFirstChild("NeutralizationUIScale")

    if not Neutralization_MainScale then

        Neutralization_MainScale = Instance.new("UIScale")
        Neutralization_MainScale.Name = "NeutralizationUIScale"
        Neutralization_MainScale.Scale = 1
        Neutralization_MainScale.Parent = Main

    end

end)


local function Neutralization_Tween(
    Object,
    Properties,
    Duration,
    Style,
    Direction
)

    if not Object then
        return
    end

    local Info = TweenInfo.new(
        Duration or 0.25,
        Style or Enum.EasingStyle.Quart,
        Direction or Enum.EasingDirection.Out
    )

    local Tween = TweenService:Create(
        Object,
        Info,
        Properties
    )

    Tween:Play()

    return Tween
end


-- =========================================================
-- 16. MINIMIZE / RESTORE
-- =========================================================

pcall(function()

    if Neutralization_Minimize
        and Neutralization_Floating then

        local IsMinimized = false

        Neutralization_Minimize.MouseEnter:Connect(function()

            Neutralization_Tween(
                Neutralization_Minimize,
                {
                    TextSize = 26
                },
                0.15
            )

        end)


        Neutralization_Minimize.MouseLeave:Connect(function()

            Neutralization_Tween(
                Neutralization_Minimize,
                {
                    TextSize = 22
                },
                0.15
            )

        end)


        Neutralization_Minimize.MouseButton1Click:Connect(function()

            if IsMinimized then
                return
            end

            IsMinimized = true

            -- Small press animation
            if Neutralization_MainScale then

                Neutralization_Tween(
                    Neutralization_MainScale,
                    {
                        Scale = 0.92
                    },
                    0.12,
                    Enum.EasingStyle.Quad
                )

                task.wait(0.12)

                Neutralization_Tween(
                    Neutralization_MainScale,
                    {
                        Scale = 0.05
                    },
                    0.30,
                    Enum.EasingStyle.Back,
                    Enum.EasingDirection.In
                )

            end

            task.wait(0.25)

            Main.Visible = false

            Neutralization_Floating.Visible = true

            Neutralization_Floating.Size =
                UDim2.fromOffset(20, 20)

            Neutralization_Floating.TextTransparency = 1

            Neutralization_Tween(
                Neutralization_Floating,
                {
                    Size = UDim2.fromOffset(54, 54),
                    TextTransparency = 0
                },
                0.35,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.Out
            )

        end)


        Neutralization_Floating.MouseEnter:Connect(function()

            Neutralization_Tween(
                Neutralization_Floating,
                {
                    Size = UDim2.fromOffset(60, 60)
                },
                0.15,
                Enum.EasingStyle.Quad
            )

        end)


        Neutralization_Floating.MouseLeave:Connect(function()

            Neutralization_Tween(
                Neutralization_Floating,
                {
                    Size = UDim2.fromOffset(54, 54)
                },
                0.15,
                Enum.EasingStyle.Quad
            )

        end)


        Neutralization_Floating.MouseButton1Click:Connect(function()

            IsMinimized = false

            Neutralization_Tween(
                Neutralization_Floating,
                {
                    Size = UDim2.fromOffset(20, 20),
                    TextTransparency = 1
                },
                0.20,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.In
            )

            task.wait(0.18)

            Neutralization_Floating.Visible = false

            Main.Visible = true

            if Neutralization_MainScale then

                Neutralization_MainScale.Scale = 0.05

                Neutralization_Tween(
                    Neutralization_MainScale,
                    {
                        Scale = 1
                    },
                    0.40,
                    Enum.EasingStyle.Back,
                    Enum.EasingDirection.Out
                )

            end

        end)

    end

end)


-- =========================================================
-- 17. LOGO ANIMATION
-- =========================================================

pcall(function()

    if Logo then

        Logo.MouseEnter:Connect(function()

            Neutralization_Tween(
                Logo,
                {
                    Rotation = -8
                },
                0.15,
                Enum.EasingStyle.Quad
            )

        end)


        Logo.MouseLeave:Connect(function()

            Neutralization_Tween(
                Logo,
                {
                    Rotation = 0
                },
                0.18,
                Enum.EasingStyle.Back
            )

        end)

    end

end)


-- =========================================================
-- 18. OPEN ANIMATION
-- =========================================================

pcall(function()

    if Neutralization_MainScale then

        Neutralization_MainScale.Scale = 0.92

        task.delay(0.05, function()

            Neutralization_Tween(
                Neutralization_MainScale,
                {
                    Scale = 1
                },
                0.45,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.Out
            )

        end)

    end

end)


-- =========================================================
-- 19. CATEGORY BUTTON ANIMATIONS
-- =========================================================

pcall(function()

    if CategoryButtons then

        for _, Button in pairs(CategoryButtons) do

            if typeof(Button) == "Instance"
                and Button:IsA("TextButton") then

                Button.AutoButtonColor = false

                Button.MouseEnter:Connect(function()

                    Neutralization_Tween(
                        Button,
                        {
                            BackgroundTransparency =
                                math.max(
                                    0,
                                    Button.BackgroundTransparency - 0.12
                                )
                        },
                        0.12
                    )

                end)


                Button.MouseLeave:Connect(function()

                    Neutralization_Tween(
                        Button,
                        {
                            BackgroundTransparency =
                                math.min(
                                    1,
                                    Button.BackgroundTransparency + 0.12
                                )
                        },
                        0.12
                    )

                end)

            end

        end

    end

end)


-- =========================================================
-- UPDATE FOV CIRCLE IMMEDIATELY
-- =========================================================

pcall(function()

    if FOVCircle then

        -- Always keep the FOV circle centered
        FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)

        local Camera = workspace.CurrentCamera

        if Camera then

            local Viewport = Camera.ViewportSize

            FOVCircle.Position = UDim2.fromOffset(
                Viewport.X / 2,
                Viewport.Y / 2
            )

        end

    end

end)


-- =========================================================
-- KEEP FOV CIRCLE CENTERED AFTER RESOLUTION CHANGES
-- =========================================================

pcall(function()

    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()

        task.wait()

        if UpdateFOVCircle then
            UpdateFOVCircle()
        end

    end)

end)


pcall(function()

    local Camera = workspace.CurrentCamera

    if Camera then

        Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()

            if UpdateFOVCircle then
                UpdateFOVCircle()
            end

        end)

    end

end)


-- =========================================================
-- FINAL
-- =========================================================

print("Neutralization Hub final update loaded.")

-- =========================================================
-- NEUTRALIZATION HUB
-- FINAL FIX / AIM + ESP
-- PART 1/2
-- =========================================================

pcall(function()

    -- =====================================================
    -- 1. BASIC SETTINGS
    -- =====================================================

    Config.AimFOV = true

    Config.AimFOVSize =
        math.clamp(
            tonumber(Config.AimFOVSize) or 150,
            25,
            1000
        )

    local FRIENDLY_COLOR =
        Color3.fromRGB(55, 150, 255)

    local ENEMY_COLOR =
        Color3.fromRGB(255, 55, 55)


    -- =====================================================
    -- 2. TEAM DETECTION
    -- =====================================================

    local function Neutralization_IsFriendly(player)

        if not player then
            return false
        end

        if player == LocalPlayer then
            return true
        end

        if LocalPlayer.Team
            and player.Team
        then
            return player.Team == LocalPlayer.Team
        end

        return false
    end


    local function Neutralization_GetESPColor(player)

        if Neutralization_IsFriendly(player) then
            return FRIENDLY_COLOR
        end

        return ENEMY_COLOR
    end


    -- =====================================================
    -- 3. FIX AIM CENTER
    -- =====================================================

    GetMousePosition = function()

        local camera =
            workspace.CurrentCamera

        if not camera then
            return Vector2.new(0, 0)
        end

        local viewport =
            camera.ViewportSize

        return Vector2.new(
            viewport.X / 2,
            viewport.Y / 2
        )

    end


    -- =====================================================
    -- 4. FIX AIM FOV CIRCLE
    -- =====================================================

    UpdateFOVCircle = function()

        if not FOVCircle then
            return
        end

        local camera =
            workspace.CurrentCamera

        if not camera then
            return
        end

        local viewport =
            camera.ViewportSize

        local radius =
            math.clamp(
                tonumber(Config.AimFOVSize) or 150,
                25,
                1000
            )

        FOVCircle.AnchorPoint =
            Vector2.new(0.5, 0.5)

        FOVCircle.Size =
            UDim2.fromOffset(
                radius * 2,
                radius * 2
            )

        FOVCircle.Position =
            UDim2.fromOffset(
                viewport.X / 2,
                viewport.Y / 2
            )

        FOVCircle.Visible =
            Config.AimFOV == true

    end


    -- =====================================================
    -- 5. FULL AIM TARGET SYSTEM
    -- =====================================================

    GetBestTarget = function()

        local camera =
            workspace.CurrentCamera

        if not camera then
            return nil, nil
        end

        local center =
            GetMousePosition()

        local radius =
            math.max(
                1,
                tonumber(Config.AimFOVSize) or 150
            )

        local bestPlayer = nil
        local bestPart = nil
        local bestDistance = math.huge


        for _, player in ipairs(
            Players:GetPlayers()
        ) do

            if player ~= LocalPlayer then

                -- NEVER AIM AT ALLIES
                if not Neutralization_IsFriendly(player) then

                    local character =
                        player.Character

                    if character then

                        local humanoid =
                            character:FindFirstChildOfClass(
                                "Humanoid"
                            )

                        if humanoid
                            and humanoid.Health > 0
                        then

                            local part =
                                character:FindFirstChild(
                                    Config.TargetPart
                                )

                            if not part
                                or not part:IsA("BasePart")
                            then
                                part =
                                    character:FindFirstChild("Head")
                            end

                            if not part
                                or not part:IsA("BasePart")
                            then
                                part =
                                    character:FindFirstChild(
                                        "HumanoidRootPart"
                                    )
                            end


                            if part
                                and part:IsA("BasePart")
                            then

                                local screenPosition,
                                    onScreen =
                                    camera:WorldToViewportPoint(
                                        part.Position
                                    )

                                if onScreen then

                                    local point =
                                        Vector2.new(
                                            screenPosition.X,
                                            screenPosition.Y
                                        )

                                    local distance =
                                        (
                                            point - center
                                        ).Magnitude

                                    if distance <= radius then

                                        local visible = true

                                        if Config.VisibleOnly then

                                            local origin =
                                                camera.CFrame.Position

                                            local direction =
                                                part.Position -
                                                origin

                                            local rayParams =
                                                RaycastParams.new()

                                            rayParams.FilterType =
                                                Enum.RaycastFilterType.Exclude

                                            rayParams.FilterDescendantsInstances = {
                                                LocalPlayer.Character,
                                                camera
                                            }

                                            rayParams.IgnoreWater =
                                                true

                                            local result =
                                                workspace:Raycast(
                                                    origin,
                                                    direction,
                                                    rayParams
                                                )

                                            if result
                                                and not result.Instance:IsDescendantOf(
                                                    character
                                                )
                                            then
                                                visible = false
                                            end

                                        end


                                        if visible
                                            and distance < bestDistance
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


        -- IMPORTANT:
        -- RETURN BOTH PLAYER AND BODY PART
        return bestPlayer, bestPart

    end


    -- =====================================================
    -- 6. FIX AIM CONNECTION
    -- =====================================================

    pcall(function()

        if AimConnection then
            AimConnection:Disconnect()
        end

    end)


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

                    pcall(function()
                        AimAt(targetPart)
                    end)

                end

            end
        )


    -- =====================================================
    -- 7. ESP SETTINGS
    -- =====================================================

    Config.ModelESP =
        Config.ModelESP == true

    Config.SquareESP =
        Config.SquareESP ~= false

    Config.ESPTeamColors =
        true


    -- =====================================================
    -- 8. VISUAL CONTROLS
    -- =====================================================

    pcall(function()

        CreateSection(
            VisualPage,
            "Advanced ESP",
            "Additional player visual modes"
        )


        CreateToggle(
            VisualPage,
            "Model ESP",
            Config.ModelESP,
            function(value)

                Config.ModelESP =
                    value == true

            end
        )


        CreateToggle(
            VisualPage,
            "Square Box",
            true,
            function(value)

                Config.SquareESP =
                    value == true

            end
        )


        CreateToggle(
            VisualPage,
            "Team Colors",
            true,
            function(value)

                Config.ESPTeamColors =
                    value == true

            end
        )

    end)


    -- =====================================================
    -- 9. MODEL ESP
    -- =====================================================

    local function EnsureModelESP(player, data)

        if not data then
            return
        end


        if not data.ModelHighlight then

            local highlight =
                Instance.new("Highlight")

            highlight.Name =
                "NeutralizationModelESP"

            highlight.DepthMode =
                Enum.HighlightDepthMode.AlwaysOnTop

            highlight.FillTransparency =
                0.82

            highlight.OutlineTransparency =
                0

            highlight.Enabled =
                false

            highlight.Parent =
                Gui

            data.ModelHighlight =
                highlight

        end


        local highlight =
            data.ModelHighlight

        local character =
            player.Character


        if not character then

            highlight.Enabled =
                false

            return

        end


        highlight.Adornee =
            character

        highlight.Enabled =
            Config.ESP
            and Config.ModelESP


        local color =
            Neutralization_GetESPColor(
                player
            )


        highlight.FillColor =
            color

        highlight.OutlineColor =
            color

    end


    -- =====================================================
    -- 10. ESP UPDATE
    -- =====================================================

    UpdateESP = function()

        for player, data in pairs(
            ESPObjects
        ) do

            local character =
                player.Character

            local shouldShow =
                Config.ESP

            local humanoid = nil


            if character then

                humanoid =
                    character:FindFirstChildOfClass(
                        "Humanoid"
                    )

            end


            if not humanoid
                or humanoid.Health <= 0
            then

                shouldShow =
                    false

            end


            EnsureModelESP(
                player,
                data
            )


            if shouldShow
                and character
                and humanoid
            then

                local bounds =
                    GetCharacterBounds(
                        character
                    )


                if bounds then

                    local color =
                        Neutralization_GetESPColor(
                            player
                        )


                    -- =================================================
                    -- SQUARE BOX
                    -- =================================================

                    data.Box.Visible =
                        Config.BoxESP


                    if Config.BoxESP then

                        local size =
                            math.max(
                                bounds.Width,
                                bounds.Height,
                                2
                            )


                        local centerX =
                            bounds.X +
                            bounds.Width / 2


                        local centerY =
                            bounds.Y +
                            bounds.Height / 2


                        data.Box.Position =
                            UDim2.fromOffset(
                                centerX - size / 2,
                                centerY - size / 2
                            )


                        data.Box.Size =
                            UDim2.fromOffset(
                                size,
                                size
                            )


                        local stroke =
                            data.Box:FindFirstChildOfClass(
                                "UIStroke"
                            )


                        if stroke then

                            stroke.Color =
                                color

                            stroke.Thickness =
                                2

                            stroke.Transparency =
                                0

                        end

                    end


                    -- =================================================
                    -- NAME
                    -- =================================================

                    data.Name.Visible =
                        Config.Names


                    if Config.Names then

                        data.Name.Position =
                            UDim2.fromOffset(
                                bounds.X +
                                bounds.Width / 2,
                                bounds.Y - 20
                            )

                        data.Name.Text =
                            player.Name

                        data.Name.TextColor3 =
                            color

                    end


                    -- =================================================
                    -- HEALTH
                    -- =================================================

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
                                math.floor(health),
                                math.floor(maxHealth)
                            )

                        data.Health.TextColor3 =
                            color

                    end


                    -- =================================================
                    -- DISTANCE
                    -- =================================================

                    data.Distance.Visible =
                        Config.Distance


                    if Config.Distance then

                        local root =
                            character:FindFirstChild(
                                "HumanoidRootPart"
                            )

                        local localCharacter =
                            LocalPlayer.Character


                        if root
                            and localCharacter
                        then

                            local localRoot =
                                localCharacter:FindFirstChild(
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

                                data.Distance.TextColor3 =
                                    color

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
-- =================================================
-- DISTANCE
-- =================================================

data.Distance.Visible =
    Config.Distance


if Config.Distance then

    local root =
        character:FindFirstChild(
            "HumanoidRootPart"
        )

    local localCharacter =
        LocalPlayer.Character


    if root
        and localCharacter
    then

        local localRoot =
            localCharacter:FindFirstChild(
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


            data.Distance.TextColor3 =
                color

        end

    end

end


-- =================================================
-- HIDE ESP WHEN INVALID
-- =================================================

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


-- =========================================================
-- ESP LOOP
-- =========================================================

if not ESPConnection then

    ESPConnection =
        RunService.RenderStepped:Connect(
            function()

                pcall(function()
                    UpdateESP()
                end)

            end
        )

end


print(
    "[Neutralization Hub] PART 1/2 LOADED"
)


end)


-- =========================================================
-- NEUTRALIZATION HUB
-- FINAL FIX / UI + ANIMATIONS
-- PART 2/2
-- =========================================================

pcall(function()

    -- =====================================================
    -- REMOVE OLD FLOATING BUTTON
    -- =====================================================

    local OldFloating =
        Gui:FindFirstChild(
            "NeutralizationFloatingButton"
        )

    if OldFloating then
        OldFloating:Destroy()
    end


    -- =====================================================
    -- CREATE FLOATING BUTTON
    -- =====================================================

    local FloatingButton =
        Instance.new("TextButton")

    FloatingButton.Name =
        "NeutralizationFloatingButton"

    FloatingButton.Parent =
        Gui

    FloatingButton.Size =
        UDim2.fromOffset(54, 54)

    FloatingButton.AnchorPoint =
        Vector2.new(0.5, 0.5)

    FloatingButton.Position =
        UDim2.new(0, 65, 1, -65)

    FloatingButton.BackgroundColor3 =
        Colors.Menu

    FloatingButton.Text =
        "N"

    FloatingButton.TextColor3 =
        Colors.Text

    FloatingButton.TextSize =
        24

    FloatingButton.Font =
        Enum.Font.GothamBold

    FloatingButton.AutoButtonColor =
        false

    FloatingButton.Visible =
        false

    FloatingButton.ZIndex =
        999


    local FloatingCorner =
        Instance.new("UICorner")

    FloatingCorner.CornerRadius =
        UDim.new(1, 0)

    FloatingCorner.Parent =
        FloatingButton


    local FloatingStroke =
        Instance.new("UIStroke")

    FloatingStroke.Color =
        Colors.Menu

    FloatingStroke.Thickness =
        2

    FloatingStroke.Transparency =
        0.15

    FloatingStroke.Parent =
        FloatingButton


    -- =====================================================
    -- DRAG FLOATING BUTTON
    -- =====================================================

    local FloatingDragging =
        false

    local FloatingMoved =
        false

    local FloatingDragStart =
        nil

    local FloatingStartPosition =
        nil


    FloatingButton.InputBegan:Connect(
        function(input)

            if input.UserInputType ==
                Enum.UserInputType.MouseButton1
                or
                input.UserInputType ==
                Enum.UserInputType.Touch
            then

                FloatingDragging =
                    true

                FloatingMoved =
                    false

                FloatingDragStart =
                    input.Position

                FloatingStartPosition =
                    FloatingButton.Position

            end

        end
    )


    FloatingButton.InputEnded:Connect(
        function(input)

            if input.UserInputType ==
                Enum.UserInputType.MouseButton1
                or
                input.UserInputType ==
                Enum.UserInputType.Touch
            then

                FloatingDragging =
                    false

            end

        end
    )


    UserInputService.InputChanged:Connect(
        function(input)

            if not FloatingDragging then
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


            local delta =
                input.Position -
                FloatingDragStart


            if math.abs(delta.X) > 4
                or
                math.abs(delta.Y) > 4
            then

                FloatingMoved =
                    true

            end


            FloatingButton.Position =
                UDim2.new(
                    FloatingStartPosition.X.Scale,
                    FloatingStartPosition.X.Offset +
                        delta.X,

                    FloatingStartPosition.Y.Scale,
                    FloatingStartPosition.Y.Offset +
                        delta.Y
                )

        end
    )


    -- =====================================================
    -- MINIMIZE BUTTON
    -- =====================================================

    local OldMinimize =
        TopBar:FindFirstChild(
            "NeutralizationMinimize"
        )

    if OldMinimize then
        OldMinimize:Destroy()
    end


    local MinimizeButton =
        Instance.new("TextButton")

    MinimizeButton.Name =
        "NeutralizationMinimize"

    MinimizeButton.Parent =
        TopBar

    MinimizeButton.Size =
        UDim2.fromOffset(30, 30)

    MinimizeButton.Position =
        UDim2.new(1, -68, 0, 9)

    MinimizeButton.BackgroundTransparency =
        1

    MinimizeButton.Text =
        "−"

    MinimizeButton.TextColor3 =
        Colors.Text

    MinimizeButton.TextSize =
        22

    MinimizeButton.Font =
        Enum.Font.GothamBold

    MinimizeButton.AutoButtonColor =
        false


    -- =====================================================
    -- MAIN SCALE
    -- =====================================================

    local MainScale =
        Main:FindFirstChild(
            "NeutralizationFinalScale"
        )


    if not MainScale then

        MainScale =
            Instance.new("UIScale")

        MainScale.Name =
            "NeutralizationFinalScale"

        MainScale.Scale =
            1

        MainScale.Parent =
            Main

    end


    local function Animate(
        object,
        properties,
        duration,
        style,
        direction
    )

        if not object then
            return
        end


        local info =
            TweenInfo.new(
                duration or 0.25,
                style or Enum.EasingStyle.Quint,
                direction or Enum.EasingDirection.Out
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


    -- =====================================================
    -- MINIMIZE / RESTORE
    -- =====================================================

    local MenuMinimized =
        false


    MinimizeButton.MouseEnter:Connect(
        function()

            Animate(
                MinimizeButton,
                {
                    TextSize = 27
                },
                0.15,
                Enum.EasingStyle.Back
            )

        end
    )


    MinimizeButton.MouseLeave:Connect(
        function()

            Animate(
                MinimizeButton,
                {
                    TextSize = 22
                },
                0.15
            )

        end
    )


    MinimizeButton.MouseButton1Click:Connect(
        function()

            if MenuMinimized then
                return
            end


            MenuMinimized =
                true


            Animate(
                MinimizeButton,
                {
                    Rotation = -90
                },
                0.20,
                Enum.EasingStyle.Back
            )


            Animate(
                MainScale,
                {
                    Scale = 0.88
                },
                0.12
            )


            task.wait(0.12)


            Animate(
                MainScale,
                {
                    Scale = 0.02
                },
                0.28,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.In
            )


            task.wait(0.22)


            Main.Visible =
                false


            FloatingButton.Visible =
                true


            FloatingButton.Size =
                UDim2.fromOffset(20, 20)

            FloatingButton.TextTransparency =
                1


            Animate(
                FloatingButton,
                {
                    Size =
                        UDim2.fromOffset(54, 54),

                    TextTransparency =
                        0
                },
                0.38,
                Enum.EasingStyle.Back
            )

        end
    )


    -- =====================================================
    -- RESTORE
    -- =====================================================

    FloatingButton.MouseButton1Click:Connect(
        function()

            if FloatingMoved then

                FloatingMoved =
                    false

                return

            end


            if not MenuMinimized then
                return
            end


            MenuMinimized =
                false


            Animate(
                FloatingButton,
                {
                    Size =
                        UDim2.fromOffset(20, 20),

                    TextTransparency =
                        1
                },
                0.22,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.In
            )


            task.wait(0.20)


            FloatingButton.Visible =
                false


            Main.Visible =
                true


            MainScale.Scale =
                0.02


            Animate(
                MainScale,
                {
                    Scale = 1
                },
                0.48,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.Out
            )


            Animate(
                MinimizeButton,
                {
                    Rotation = 0
                },
                0.25,
                Enum.EasingStyle.Back
            )

        end
    )


    -- =====================================================
    -- FLOATING BUTTON HOVER
    -- =====================================================

    FloatingButton.MouseEnter:Connect(
        function()

            if FloatingDragging then
                return
            end


            Animate(
                FloatingButton,
                {
                    Size =
                        UDim2.fromOffset(60, 60)
                },
                0.16,
                Enum.EasingStyle.Back
            )

        end
    )


    FloatingButton.MouseLeave:Connect(
        function()

            if FloatingDragging then
                return
            end


            Animate(
                FloatingButton,
                {
                    Size =
                        UDim2.fromOffset(54, 54)
                },
                0.16
            )

        end
    )


    -- =====================================================
    -- BUTTON ANIMATIONS
    -- =====================================================

    for _, object in ipairs(
        Gui:GetDescendants()
    ) do

        if object:IsA("TextButton") then

            object.AutoButtonColor =
                false


            local scale =
                object:FindFirstChild(
                    "NeutralizationButtonScale"
                )


            if not scale then

                scale =
                    Instance.new("UIScale")

                scale.Name =
                    "NeutralizationButtonScale"

                scale.Scale =
                    1

                scale.Parent =
                    object

            end


            object.MouseEnter:Connect(
                function()

                    if object ==
                        FloatingButton
                    then
                        return
                    end


                    Animate(
                        scale,
                        {
                            Scale = 1.035
                        },
                        0.12,
                        Enum.EasingStyle.Quad
                    )

                end
            )


            object.MouseLeave:Connect(
                function()

                    if object ==
                        FloatingButton
                    then
                        return
                    end


                    Animate(
                        scale,
                        {
                            Scale = 1
                        },
                        0.14,
                        Enum.EasingStyle.Back
                    )

                end
            )


            object.MouseButton1Down:Connect(
                function()

                    if object ==
                        FloatingButton
                    then
                        return
                    end


                    Animate(
                        scale,
                        {
                            Scale = 0.96
                        },
                        0.08,
                        Enum.EasingStyle.Quad
                    )

                end
            )


            object.MouseButton1Up:Connect(
                function()

                    if object ==
                        FloatingButton
                    then
                        return
                    end


                    Animate(
                        scale,
                        {
                            Scale = 1.035
                        },
                        0.12,
                        Enum.EasingStyle.Back
                    )

                end
            )

        end

    end


    -- =====================================================
    -- LOGO ANIMATION
    -- =====================================================

    pcall(function()

        Logo.Active =
            true


        Logo.MouseEnter:Connect(
            function()

                Animate(
                    Logo,
                    {
                        Rotation = -10
                    },
                    0.14,
                    Enum.EasingStyle.Back
                )

            end
        )


        Logo.MouseLeave:Connect(
            function()

                Animate(
                    Logo,
                    {
                        Rotation = 0
                    },
                    0.20,
                    Enum.EasingStyle.Back
                )

            end
        )

    end)


    -- =====================================================
    -- KEEP FOV CENTERED
    -- =====================================================

    RunService.RenderStepped:Connect(
        function()

            pcall(function()
                UpdateFOVCircle()
            end)

        end
    )


    workspace:GetPropertyChangedSignal(
        "CurrentCamera"
    ):Connect(
        function()

            task.wait()

            pcall(function()
                UpdateFOVCircle()
            end)

        end
    )


    -- =====================================================
    -- FINAL REFRESH
    -- =====================================================

    pcall(function()
        UpdateESP()
    end)


    pcall(function()
        UpdateFOVCircle()
    end)


    print(
        "[Neutralization Hub] FINAL UPDATE LOADED"
    )

end)
                -- ==========================================
-- NEUTRALIZATION HUB FINAL PATCH
-- PART 2/2 — FLOATING BUTTON + ANIMATIONS
-- ==========================================

-- Удаляем старую кнопку сворачивания, если она осталась
pcall(function()
    if NeutralizationFloatingButton then
        NeutralizationFloatingButton:Destroy()
    end
end)

pcall(function()
    local old = Gui:FindFirstChild("NeutralizationFloatingButton")
    if old then
        old:Destroy()
    end
end)

-- ==========================================
-- FLOATING N BUTTON
-- ==========================================

local FloatingButton = Instance.new("TextButton")
FloatingButton.Name = "NeutralizationFloatingButton"
FloatingButton.Parent = Gui
FloatingButton.Size = UDim2.fromOffset(54, 54)
FloatingButton.Position = UDim2.new(0, 65, 1, -65)
FloatingButton.BackgroundColor3 = Colors.Menu
FloatingButton.BackgroundTransparency = 0
FloatingButton.Text = "N"
FloatingButton.TextColor3 = Color3.fromRGB(255,255,255)
FloatingButton.TextSize = 25
FloatingButton.Font = Enum.Font.GothamBold
FloatingButton.AutoButtonColor = false
FloatingButton.Visible = false
FloatingButton.ZIndex = 100

local FloatingCorner = Instance.new("UICorner")
FloatingCorner.CornerRadius = UDim.new(1, 0)
FloatingCorner.Parent = FloatingButton

local FloatingStroke = Instance.new("UIStroke")
FloatingStroke.Color = Colors.MenuDark
FloatingStroke.Thickness = 2
FloatingStroke.Transparency = 0.15
FloatingStroke.Parent = FloatingButton

NeutralizationFloatingButton = FloatingButton

-- ==========================================
-- FLOATING BUTTON DRAG
-- ==========================================

local FloatingDragging = false
local FloatingMoved = false
local FloatingDragStart
local FloatingStartPosition

FloatingButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        FloatingDragging = true
        FloatingMoved = false
        FloatingDragStart = input.Position
        FloatingStartPosition = FloatingButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                FloatingDragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not FloatingDragging then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local delta = input.Position - FloatingDragStart

    if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
        FloatingMoved = true
    end

    FloatingButton.Position = UDim2.new(
        FloatingStartPosition.X.Scale,
        FloatingStartPosition.X.Offset + delta.X,
        FloatingStartPosition.Y.Scale,
        FloatingStartPosition.Y.Offset + delta.Y
    )
end)

-- ==========================================
-- REMOVE OLD MINIMIZE BUTTON
-- ==========================================

pcall(function()
    if NeutralizationMinimize then
        NeutralizationMinimize:Destroy()
    end
end)

pcall(function()
    local old = Gui:FindFirstChild("NeutralizationMinimize")
    if old then
        old:Destroy()
    end
end)

-- ==========================================
-- NEW MINIMIZE BUTTON
-- ==========================================

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "NeutralizationMinimize"
MinimizeButton.Parent = Main
MinimizeButton.Size = UDim2.fromOffset(30, 26)
MinimizeButton.Position = UDim2.new(1, -65, 0, 8)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "−"
MinimizeButton.TextColor3 = Color3.fromRGB(220,220,220)
MinimizeButton.TextSize = 22
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.AutoButtonColor = false
MinimizeButton.ZIndex = 50

NeutralizationMinimize = MinimizeButton

-- ==========================================
-- SCALE ANIMATION
-- ==========================================

local MainScale = Main:FindFirstChild("NeutralizationMainScale")

if not MainScale then
    MainScale = Instance.new("UIScale")
    MainScale.Name = "NeutralizationMainScale"
    MainScale.Scale = 1
    MainScale.Parent = Main
end

local MenuMinimized = false
local AnimationBusy = false

local function Animate(instance, properties, duration, style, direction)
    local tween = TweenService:Create(
        instance,
        TweenInfo.new(
            duration or 0.25,
            style or Enum.EasingStyle.Quint,
            direction or Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

-- ==========================================
-- MINIMIZE
-- ==========================================

local function MinimizeMenu()
    if MenuMinimized or AnimationBusy then
        return
    end

    AnimationBusy = true
    MenuMinimized = true

    -- Главное меню красиво уменьшается
    Animate(
        MainScale,
        {Scale = 0.05},
        0.35,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.In
    )

    task.wait(0.22)

    Main.Visible = false

    -- ВАЖНО:
    -- Position floating button НЕ меняется.
    -- Поэтому если пользователь передвинул N,
    -- оно останется именно там.
    FloatingButton.Visible = true
    FloatingButton.Size = UDim2.fromOffset(20,20)
    FloatingButton.BackgroundTransparency = 1
    FloatingButton.TextTransparency = 1

    Animate(
        FloatingButton,
        {
            Size = UDim2.fromOffset(54,54),
            BackgroundTransparency = 0
        },
        0.4,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    )

    Animate(
        FloatingButton,
        {TextTransparency = 0},
        0.25,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    )

    task.wait(0.4)

    AnimationBusy = false
end

-- ==========================================
-- RESTORE
-- ==========================================

local function RestoreMenu()
    if not MenuMinimized or AnimationBusy then
        return
    end

    AnimationBusy = true
    MenuMinimized = false

    -- N исчезает на месте.
    -- НИКАКОГО перемещения Position здесь нет.
    Animate(
        FloatingButton,
        {
            Size = UDim2.fromOffset(20,20),
            BackgroundTransparency = 1,
            TextTransparency = 1
        },
        0.25,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.In
    )

    task.wait(0.18)

    FloatingButton.Visible = false

    Main.Visible = true
    MainScale.Scale = 0.05

    Animate(
        MainScale,
        {Scale = 1},
        0.5,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    )

    task.wait(0.5)

    AnimationBusy = false
end

-- ==========================================
-- BUTTON CLICK
-- ==========================================

MinimizeButton.MouseButton1Click:Connect(function()
    MinimizeMenu()
end)

FloatingButton.MouseButton1Click:Connect(function()
    -- Если пользователь только что перетащил кнопку,
    -- не открываем меню случайным кликом.
    if FloatingMoved then
        FloatingMoved = false
        return
    end

    RestoreMenu()
end)

-- ==========================================
-- FLOATING BUTTON HOVER
-- ==========================================

FloatingButton.MouseEnter:Connect(function()
    if not MenuMinimized then
        return
    end

    Animate(
        FloatingButton,
        {Size = UDim2.fromOffset(59,59)},
        0.18,
        Enum.EasingStyle.Quint
    )

    Animate(
        FloatingStroke,
        {Thickness = 3},
        0.18
    )
end)

FloatingButton.MouseLeave:Connect(function()
    if not MenuMinimized then
        return
    end

    Animate(
        FloatingButton,
        {Size = UDim2.fromOffset(54,54)},
        0.18,
        Enum.EasingStyle.Quint
    )

    Animate(
        FloatingStroke,
        {Thickness = 2},
        0.18
    )
end)

-- ==========================================
-- MINIMIZE BUTTON HOVER
-- ==========================================

MinimizeButton.MouseEnter:Connect(function()
    Animate(
        MinimizeButton,
        {
            TextColor3 = Color3.fromRGB(255,255,255),
            Size = UDim2.fromOffset(34,30)
        },
        0.16,
        Enum.EasingStyle.Quint
    )
end)

MinimizeButton.MouseLeave:Connect(function()
    Animate(
        MinimizeButton,
        {
            TextColor3 = Color3.fromRGB(220,220,220),
            Size = UDim2.fromOffset(30,26)
        },
        0.16,
        Enum.EasingStyle.Quint
    )
end)

-- ==========================================
-- GENERIC BUTTON ANIMATIONS
-- ==========================================

local function AddButtonAnimation(button)
    if not button:IsA("TextButton") and not button:IsA("ImageButton") then
        return
    end

    if button:GetAttribute("NeutralizationAnimated") then
        return
    end

    button:SetAttribute("NeutralizationAnimated", true)

    local originalSize = button.Size

    button.MouseEnter:Connect(function()
        Animate(
            button,
            {
                Size = UDim2.new(
                    originalSize.X.Scale,
                    originalSize.X.Offset + 2,
                    originalSize.Y.Scale,
                    originalSize.Y.Offset + 2
                )
            },
            0.14,
            Enum.EasingStyle.Quint
        )
    end)

    button.MouseLeave:Connect(function()
        Animate(
            button,
            {Size = originalSize},
            0.14,
            Enum.EasingStyle.Quint
        )
    end)

    button.MouseButton1Down:Connect(function()
        Animate(
            button,
            {
                Size = UDim2.new(
                    originalSize.X.Scale,
                    math.max(0, originalSize.X.Offset - 2),
                    originalSize.Y.Scale,
                    math.max(0, originalSize.Y.Offset - 2)
                )
            },
            0.08,
            Enum.EasingStyle.Quint
        )
    end)

    button.MouseButton1Up:Connect(function()
        Animate(
            button,
            {Size = originalSize},
            0.12,
            Enum.EasingStyle.Back
        )
    end)
end

for _, object in ipairs(Main:GetDescendants()) do
    AddButtonAnimation(object)
end

Main.DescendantAdded:Connect(function(object)
    task.defer(function()
        AddButtonAnimation(object)
    end)
end)

-- ==========================================
-- LOGO ANIMATION
-- ==========================================

local LogoObject =
    Main:FindFirstChild("Logo", true)
    or Main:FindFirstChild("NeutralizationLogo", true)

if LogoObject and LogoObject:IsA("GuiObject") then
    LogoObject.MouseEnter:Connect(function()
        Animate(
            LogoObject,
            {Rotation = 8},
            0.2,
            Enum.EasingStyle.Back
        )
    end)

    LogoObject.MouseLeave:Connect(function()
        Animate(
            LogoObject,
            {Rotation = 0},
            0.2,
            Enum.EasingStyle.Back
        )
    end)
end

-- ==========================================
-- FOV ALWAYS CENTERED
-- ==========================================

RunService.RenderStepped:Connect(function()
    if FOVCircle then
        local viewport = Camera.ViewportSize

        FOVCircle.Position = Vector2.new(
            viewport.X / 2,
            viewport.Y / 2
        )

        FOVCircle.Visible = Config.AimFOV == true
    end
end)

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    Camera = workspace.CurrentCamera

    task.defer(function()
        if FOVCircle and Camera then
            local viewport = Camera.ViewportSize

            FOVCircle.Position = Vector2.new(
                viewport.X / 2,
                viewport.Y / 2
            )
        end
    end)
end)

-- ==========================================
-- FINAL REFRESH
-- ==========================================

pcall(function()
    UpdateFOVCircle()
end)

pcall(function()
    UpdateESP()
end)

print("NEUTRALIZATION HUB FINAL PATCH PART 2/2 LOADED")
