--//==================================================
--// NEUTRALIZATION HUB
--// UPDATED VERSION
--// PART 1A / 10
--//==================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==================================================
-- CONFIG
--==================================================

local Config = {

    -- COMBAT
    AimAssist = false,
    VisibleOnly = true,
    AimFOV = true,

    AimFOVSize = 150,
    AimSmoothness = 0.18,

    TargetPart = "Head",

    -- VISUALS
    ESP = false,
    TeamCheck = true,

    BoxESP = true,
    Names = true,
    Health = true,
    Distance = true,
    Snapline = false,
    ChestESP = false,

    ESPFOV = false,

    -- MOVEMENT
    Speed = false,
    SpeedValue = 16,

    Jump = false,
    JumpPower = 50,

    Noclip = false,

    FOVChanger = false,
    GameFOV = 70,

    -- UI
    MenuOpen = true
}

--==================================================
-- COLORS
--==================================================

local Colors = {

    Menu = Color3.fromRGB(170, 25, 25),

    Background = Color3.fromRGB(18, 18, 18),
    Panel = Color3.fromRGB(25, 25, 25),

    Element = Color3.fromRGB(30, 30, 30),
    ElementHover = Color3.fromRGB(40, 40, 40),

    Text = Color3.fromRGB(235, 235, 235),
    SubText = Color3.fromRGB(145, 145, 145),

    ToggleOff = Color3.fromRGB(50, 50, 50),
    ToggleDot = Color3.fromRGB(180, 180, 180),

    ESP = Color3.fromRGB(255, 60, 60),
    FOV = Color3.fromRGB(170, 25, 25)
}

--==================================================
-- CLEAN OLD GUI
--==================================================

pcall(function()

    local CoreGui = game:GetService("CoreGui")

    local old = CoreGui:FindFirstChild(
        "NeutralizationHub"
    )

    if old then
        old:Destroy()
    end

end)

--==================================================
-- HELPERS
--==================================================

local function New(class, properties, parent)

    local object = Instance.new(class)

    for property, value in pairs(
        properties or {}
    ) do

        object[property] = value

    end

    object.Parent = parent

    return object

end

local function Tween(
    object,
    properties,
    time
)

    return TweenService:Create(

        object,

        TweenInfo.new(

            time or 0.2,

            Enum.EasingStyle.Quad,

            Enum.EasingDirection.Out

        ),

        properties

    )

end

--==================================================
-- MAIN GUI
--==================================================

local Gui = New(
    "ScreenGui",
    {

        Name = "NeutralizationHub",

        ResetOnSpawn = false,

        IgnoreGuiInset = true,

        ZIndexBehavior =
            Enum.ZIndexBehavior.Sibling

    },
    game:GetService("CoreGui")
)

--==================================================
-- MAIN WINDOW
--==================================================

local Main = New(
    "Frame",
    {

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

    },
    Gui
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(0, 8)

    },
    Main
)

New(
    "UIStroke",
    {

        Color =
            Color3.fromRGB(
                55,
                55,
                55
            ),

        Thickness = 1

    },
    Main
)

--==================================================
-- TOP BAR
--==================================================

local Top = New(
    "Frame",
    {

        Size =
            UDim2.new(
                1,
                0,
                0,
                48
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                22,
                22,
                22
            ),

        BorderSizePixel = 0

    },
    Main
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(0, 8)

    },
    Top
)

--==================================================
-- TITLE
--==================================================

local Title = New(
    "TextLabel",
    {

        Size =
            UDim2.new(
                1,
                -150,
                1,
                0
            ),

        Position =
            UDim2.fromOffset(
                18,
                0
            ),

        BackgroundTransparency = 1,

        Text =
            "NEUTRALIZATION HUB",

        TextColor3 =
            Colors.Text,

        TextSize = 17,

        Font =
            Enum.Font.GothamBold,

        TextXAlignment =
            Enum.TextXAlignment.Left

    },
    Top
)

--==================================================
-- VERSION
--==================================================

local Version = New(
    "TextLabel",
    {

        Size =
            UDim2.fromOffset(
                70,
                48
            ),

        Position =
            UDim2.new(
                1,
                -115,
                0,
                0
            ),

        BackgroundTransparency = 1,

        Text = "v2.0",

        TextColor3 =
            Colors.SubText,

        TextSize = 12,

        Font =
            Enum.Font.Gotham

    },
    Top
)

--==================================================
-- MINIMIZE
--==================================================

local Minimize = New(
    "TextButton",
    {

        Size =
            UDim2.fromOffset(
                38,
                38
            ),

        Position =
            UDim2.new(
                1,
                -48,
                0,
                5
            ),

        BackgroundColor3 =
            Color3.fromRGB(
                35,
                35,
                35
            ),

        Text = "—",

        TextColor3 =
            Colors.Text,

        TextSize = 18,

        Font =
            Enum.Font.GothamBold,

        AutoButtonColor = false

    },
    Top
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(0, 6)

    },
    Minimize
)

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = New(
    "Frame",
    {

        Size =
            UDim2.fromOffset(
                145,
                260
            ),

        Position =
            UDim2.fromOffset(
                10,
                55
            ),

        BackgroundColor3 =
            Colors.Panel,

        BorderSizePixel = 0

    },
    Main
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(0, 7)

    },
    Sidebar
)

New(
    "UIPadding",
    {

        PaddingTop =
            UDim.new(0, 8),

        PaddingLeft =
            UDim.new(0, 8),

        PaddingRight =
            UDim.new(0, 8)

    },
    Sidebar
)

local SidebarLayout = New(
    "UIListLayout",
    {

        Padding =
            UDim.new(0, 5),

        SortOrder =
            Enum.SortOrder.LayoutOrder

    },
    Sidebar
)

--==================================================
-- CONTENT
--==================================================

local Content = New(
    "Frame",
    {

        Size =
            UDim2.new(
                1,
                -170,
                1,
                -65
            ),

        Position =
            UDim2.fromOffset(
                160,
                55
            ),

        BackgroundColor3 =
            Colors.Panel,

        BorderSizePixel = 0

    },
    Main
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(0, 7)

    },
    Content
)

--==================================================
-- PAGES TABLE
--==================================================

local Pages = {}

--==================================================
-- CREATE PAGE
--==================================================

local function CreatePage(name)

    local page = New(
        "ScrollingFrame",
        {

            Name = name,

            Size =
                UDim2.new(
                    1,
                    -16,
                    1,
                    -16
                ),

            Position =
                UDim2.fromOffset(
                    8,
                    8
                ),

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            ScrollBarThickness = 3,

            CanvasSize =
                UDim2.new(
                    0,
                    0,
                    0,
                    0
                ),

            AutomaticCanvasSize =
                Enum.AutomaticSize.Y,

            Visible = false

        },
        Content
    )

    New(
        "UIListLayout",
        {

            Padding =
                UDim.new(0, 7),

            SortOrder =
                Enum.SortOrder.LayoutOrder

        },
        page
    )

    New(
        "UIPadding",
        {

            PaddingTop =
                UDim.new(0, 4),

            PaddingBottom =
                UDim.new(0, 8)

        },
        page
    )

    Pages[name] = page

    return page

end

--==================================================
-- CREATE ALL PAGES
--==================================================

local CombatPage =
    CreatePage("Combat")

local VisualPage =
    CreatePage("Visuals")

local MovementPage =
    CreatePage("Movement")

local MiscPage =
    CreatePage("Misc")

local SettingsPage =
    CreatePage("Settings")

--==================================================
-- CATEGORY STATE
--==================================================

local CurrentPage = nil

local CategoryButtons = {}

--==================================================
-- END OF PART 1A
--==================================================

--//==================================================
--// NEUTRALIZATION HUB
--// PART 1B / 10
--// UI CONTINUATION + COMBAT CONTROLS
--//==================================================

--==================================================
-- CATEGORY BUTTONS
--==================================================

local function SetPage(page)

    for _, otherPage in pairs(Pages) do
        otherPage.Visible = false
    end

    page.Visible = true
    CurrentPage = page

    for _, button in pairs(CategoryButtons) do

        if button.Page == page then

            Tween(button.Object, {
                BackgroundColor3 = Colors.Menu,
                TextColor3 = Colors.Text
            }, 0.15):Play()

        else

            Tween(button.Object, {
                BackgroundColor3 = Colors.Element,
                TextColor3 = Colors.SubText
            }, 0.15):Play()

        end

    end

end

local function CreateCategory(text, page)

    local button = New(
        "TextButton",
        {

            Size =
                UDim2.new(
                    1,
                    0,
                    0,
                    37
                ),

            BackgroundColor3 =
                Colors.Element,

            BorderSizePixel = 0,

            Text = text,

            TextColor3 =
                Colors.SubText,

            TextSize = 13,

            Font =
                Enum.Font.GothamSemibold,

            AutoButtonColor = false

        },
        Sidebar
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(0, 6)

        },
        button
    )

    local data = {
        Object = button,
        Page = page
    }

    table.insert(
        CategoryButtons,
        data
    )

    button.MouseEnter:Connect(function()

        if CurrentPage ~= page then

            Tween(button, {
                BackgroundColor3 =
                    Colors.ElementHover
            }, 0.12):Play()

        end

    end)

    button.MouseLeave:Connect(function()

        if CurrentPage ~= page then

            Tween(button, {
                BackgroundColor3 =
                    Colors.Element
            }, 0.12):Play()

        end

    end)

    button.MouseButton1Click:Connect(function()

        SetPage(page)

    end)

    return button

end

--==================================================
-- CREATE CATEGORIES
--==================================================

CreateCategory(
    "Combat",
    CombatPage
)

CreateCategory(
    "Visuals",
    VisualPage
)

CreateCategory(
    "Movement",
    MovementPage
)

CreateCategory(
    "Misc",
    MiscPage
)

CreateCategory(
    "Settings",
    SettingsPage
)

--==================================================
-- TOGGLE CREATOR
--==================================================

local function CreateToggle(
    parent,
    text,
    default,
    callback
)

    local state = default == true

    local holder = New(
        "Frame",
        {

            Size =
                UDim2.new(
                    1,
                    -8,
                    0,
                    42
                ),

            BackgroundColor3 =
                Colors.Element,

            BorderSizePixel = 0

        },
        parent
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(0, 6)

        },
        holder
    )

    local label = New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -70,
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

            TextSize = 13,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left

        },
        holder
    )

    local toggle = New(
        "TextButton",
        {

            Size =
                UDim2.fromOffset(
                    42,
                    22
                ),

            Position =
                UDim2.new(
                    1,
                    -53,
                    0.5,
                    -11
                ),

            BackgroundColor3 =
                Colors.ToggleOff,

            BorderSizePixel = 0,

            Text = "",

            AutoButtonColor = false

        },
        holder
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(1, 0)

        },
        toggle
    )

    local dot = New(
        "Frame",
        {

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
                Colors.ToggleDot,

            BorderSizePixel = 0

        },
        toggle
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(1, 0)

        },
        dot
    )

    local function Update()

        if state then

            Tween(toggle, {
                BackgroundColor3 =
                    Colors.Menu
            }, 0.15):Play()

            Tween(dot, {
                Position =
                    UDim2.fromOffset(
                        23,
                        3
                    )
            }, 0.15):Play()

        else

            Tween(toggle, {
                BackgroundColor3 =
                    Colors.ToggleOff
            }, 0.15):Play()

            Tween(dot, {
                Position =
                    UDim2.fromOffset(
                        3,
                        3
                    )
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

            state = value == true

            Update()

        end,

        Get = function()

            return state

        end

    }

end

--==================================================
-- VALUE CREATOR
--==================================================

local function CreateValue(
    parent,
    text,
    default,
    callback
)

    local holder = New(
        "Frame",
        {

            Size =
                UDim2.new(
                    1,
                    -8,
                    0,
                    42
                ),

            BackgroundColor3 =
                Colors.Element,

            BorderSizePixel = 0

        },
        parent
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(0, 6)

        },
        holder
    )

    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -100,
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

            TextSize = 13,

            Font =
                Enum.Font.Gotham,

            TextXAlignment =
                Enum.TextXAlignment.Left

        },
        holder
    )

    local box = New(
        "TextBox",
        {

            Size =
                UDim2.fromOffset(
                    75,
                    26
                ),

            Position =
                UDim2.new(
                    1,
                    -87,
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

            TextSize = 12,

            Font =
                Enum.Font.Gotham,

            ClearTextOnFocus = false

        },
        holder
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(0, 5)

        },
        box
    )

    box.FocusLost:Connect(function()

        local value =
            tonumber(box.Text)

        if value then

            callback(value)

        else

            box.Text =
                tostring(default)

        end

    end)

    return box

end

--==================================================
-- TARGET PART SELECTOR
--==================================================

local function CreateTargetSelector(parent)

    local holder = New(
        "Frame",
        {

            Size =
                UDim2.new(
                    1,
                    -8,
                    0,
                    70
                ),

            BackgroundColor3 =
                Colors.Element,

            BorderSizePixel = 0

        },
        parent
    )

    New(
        "UICorner",
        {

            CornerRadius =
                UDim.new(0, 6)

        },
        holder
    )

    New(
        "TextLabel",
        {

            Size =
                UDim2.new(
                    1,
                    -20,
                    0,
                    28
                ),

            Position =
                UDim2.fromOffset(
                    12,
                    4
                ),

            BackgroundTransparency = 1,

            Text =
                "Target Part",

            TextColor3 =
                Colors.Text,

            TextSize = 13,

            Font =
                Enum.Font.GothamSemibold,

            TextXAlignment =
                Enum.TextXAlignment.Left

        },
        holder
    )

    local parts = {
        "Head",
        "Torso",
        "Random"
    }

    for index, partName in ipairs(parts) do

        local button = New(
            "TextButton",
            {

                Size =
                    UDim2.fromOffset(
                        78,
                        27
                    ),

                Position =
                    UDim2.fromOffset(
                        10 +
                        ((index - 1) * 84),
                        36
                    ),

                BackgroundColor3 =
                    partName ==
                    Config.TargetPart
                    and Colors.Menu
                    or Color3.fromRGB(
                        45,
                        45,
                        45
                    ),

                BorderSizePixel = 0,

                Text = partName,

                TextColor3 =
                    Colors.Text,

                TextSize = 11,

                Font =
                    Enum.Font.GothamSemibold,

                AutoButtonColor = false

            },
            holder
        )

        New(
            "UICorner",
            {

                CornerRadius =
                    UDim.new(0, 5)

            },
            button
        )

        button.MouseButton1Click:Connect(function()

            Config.TargetPart =
                partName

            for _, child in
                ipairs(holder:GetChildren()) do

                if child:IsA(
                    "TextButton"
                ) then

                    child.BackgroundColor3 =
                        Color3.fromRGB(
                            45,
                            45,
                            45
                        )

                end

            end

            button.BackgroundColor3 =
                Colors.Menu

        end)

    end

end

--==================================================
-- COMBAT PAGE
--==================================================

CreateToggle(
    CombatPage,
    "Aim Assist",
    Config.AimAssist,
    function(value)

        Config.AimAssist = value

    end
)

CreateToggle(
    CombatPage,
    "Visible Only",
    Config.VisibleOnly,
    function(value)

        Config.VisibleOnly = value

    end
)

CreateToggle(
    CombatPage,
    "Aim FOV",
    Config.AimFOV,
    function(value)

        Config.AimFOV = value

    end
)

CreateValue(
    CombatPage,
    "Aim FOV Size",
    Config.AimFOVSize,
    function(value)

        Config.AimFOVSize =
            math.clamp(
                value,
                20,
                1000
            )

    end
)

CreateValue(
    CombatPage,
    "Aim Smoothness",
    Config.AimSmoothness,
    function(value)

        Config.AimSmoothness =
            math.clamp(
                value,
                0.01,
                1
            )

    end
)

CreateTargetSelector(
    CombatPage
)

--==================================================
-- FOV CIRCLE
--==================================================

local FOVCircle = New(
    "Frame",
    {

        Name = "AimFOVCircle",

        AnchorPoint =
            Vector2.new(
                0.5,
                0.5
            ),

        Position =
            UDim2.fromScale(
                0.5,
                0.5
            ),

        Size =
            UDim2.fromOffset(
                Config.AimFOVSize * 2,
                Config.AimFOVSize * 2
            ),

        BackgroundTransparency = 1,

        Visible =
            Config.AimFOV,

        ZIndex = 2

    },
    Gui
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(1, 0)

    },
    FOVCircle
)

local FOVStroke = New(
    "UIStroke",
    {

        Color =
            Colors.FOV,

        Thickness = 1.5,

        Transparency = 0.15

    },
    FOVCircle
)

--==================================================
-- FOV UPDATE
--==================================================

RunService.RenderStepped:Connect(
    function()

        if not Gui.Parent then
            return
        end

        FOVCircle.Visible =
            Config.AimFOV

        FOVCircle.Size =
            UDim2.fromOffset(
                Config.AimFOVSize * 2,
                Config.AimFOVSize * 2
            )

        FOVStroke.Color =
            Colors.FOV

    end
)

--==================================================
-- DRAG SYSTEM
--==================================================

local dragging = false
local dragStart = nil
local startPosition = nil

Top.InputBegan:Connect(
    function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
            or
            input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPosition =
                Main.Position

            input.Changed:Connect(
                function()

                    if input.UserInputState ==
                        Enum.UserInputState.End then

                        dragging = false

                    end

                end
            )

        end

    end
)

UserInputService.InputChanged:Connect(
    function(input)

        if not dragging then
            return
        end

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
            or
            input.UserInputType ==
            Enum.UserInputType.Touch then

            local delta =
                input.Position -
                dragStart

            Main.Position =
                UDim2.new(

                    startPosition.X.Scale,

                    startPosition.X.Offset +
                        delta.X,

                    startPosition.Y.Scale,

                    startPosition.Y.Offset +
                        delta.Y

                )

        end

    end
)

--==================================================
-- MINIMIZE BUTTON
--==================================================

local Floating = New(
    "TextButton",
    {

        Name =
            "NeutralizationLogo",

        Size =
            UDim2.fromOffset(
                50,
                50
            ),

        Position =
            UDim2.new(
                0,
                20,
                0.5,
                -25
            ),

        BackgroundColor3 =
            Colors.Menu,

        BorderSizePixel = 0,

        Text = "NH",

        TextColor3 =
            Colors.Text,

        TextSize = 14,

        Font =
            Enum.Font.GothamBold,

        Visible = false,

        AutoButtonColor = false

    },
    Gui
)

New(
    "UICorner",
    {

        CornerRadius =
            UDim.new(1, 0)

    },
    Floating
)

Minimize.MouseButton1Click:Connect(
    function()

        Tween(
            Main,
            {
                Size =
                    UDim2.fromOffset(
                        0,
                        0
                    )
            },
            0.2
        ):Play()

        task.wait(0.2)

        Main.Visible = false
        Floating.Visible = true

    end
)

Floating.MouseButton1Click:Connect(
    function()

        Floating.Visible = false

        Main.Visible = true

        Main.Size =
            UDim2.fromOffset(
                0,
                0
            )

        Tween(
            Main,
            {
                Size =
                    UDim2.fromOffset(
                        520,
                        320
                    )
            },
            0.25
        ):Play()

    end
)

--==================================================
-- INITIAL PAGE
--==================================================

SetPage(CombatPage)

--==================================================
-- INITIAL OPEN ANIMATION
--==================================================

Main.Size =
    UDim2.fromOffset(
        0,
        0
    )

Tween(
    Main,
    {
        Size =
            UDim2.fromOffset(
                520,
                320
            )
    },
    0.35
):Play()

--==================================================
-- PART 1B END
--==================================================

--//==================================================
--// NEUTRALIZATION HUB
--// PART 2A / 10
--// AIM ASSIST
--//==================================================

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==================================================
-- AIM HELPERS
--==================================================

local function GetTargetPart(character)

    if not character then
        return nil
    end

    if Config.TargetPart == "Head" then

        return character:FindFirstChild("Head")

    elseif Config.TargetPart == "Torso" then

        return character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")
            or character:FindFirstChild("HumanoidRootPart")

    elseif Config.TargetPart == "Random" then

        local parts = {}

        local head =
            character:FindFirstChild("Head")

        local torso =
            character:FindFirstChild("UpperTorso")
            or character:FindFirstChild("Torso")

        local root =
            character:FindFirstChild("HumanoidRootPart")

        if head then
            table.insert(parts, head)
        end

        if torso then
            table.insert(parts, torso)
        end

        if root then
            table.insert(parts, root)
        end

        if #parts > 0 then

            return parts[
                math.random(
                    1,
                    #parts
                )
            ]

        end

    end

    return character:FindFirstChild(
        "HumanoidRootPart"
    )

end

--==================================================
-- CHARACTER VALIDATION
--==================================================

local function IsValidTarget(player)

    if not player then
        return false
    end

    if player == LocalPlayer then
        return false
    end

    -- Team Check
    if player.Team ~= nil
        and LocalPlayer.Team ~= nil
        and player.Team == LocalPlayer.Team then

        return false

    end

    local character =
        player.Character

    if not character then
        return false
    end

    local humanoid =
        character:FindFirstChildOfClass(
            "Humanoid"
        )

    if not humanoid then
        return false
    end

    if humanoid.Health <= 0 then
        return false
    end

    local targetPart =
        GetTargetPart(character)

    if not targetPart then
        return false
    end

    return true

end

--==================================================
-- VISIBILITY CHECK
--==================================================

local function IsVisible(targetPart)

    if not Config.VisibleOnly then
        return true
    end

    if not targetPart then
        return false
    end

    local character =
        LocalPlayer.Character

    if not character then
        return false
    end

    local origin =
        Camera.CFrame.Position

    local direction =
        targetPart.Position - origin

    local params =
        RaycastParams.new()

    params.FilterType =
        Enum.RaycastFilterType.Exclude

    params.FilterDescendantsInstances = {
        character
    }

    params.IgnoreWater = true

    local result =
        workspace:Raycast(
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

--==================================================
-- SCREEN DISTANCE
--==================================================

local function GetScreenDistance(
    targetPart
)

    local screenPosition,
        onScreen =
        Camera:WorldToViewportPoint(
            targetPart.Position
        )

    if not onScreen then
        return nil
    end

    local viewport =
        Camera.ViewportSize

    local center =
        Vector2.new(
            viewport.X / 2,
            viewport.Y / 2
        )

    local targetPosition =
        Vector2.new(
            screenPosition.X,
            screenPosition.Y
        )

    return (
        targetPosition - center
    ).Magnitude

end

--==================================================
-- FIND BEST TARGET
--==================================================

local function GetBestTarget()

    local bestPart = nil
    local bestDistance = math.huge

    for _, player in
        ipairs(Players:GetPlayers()) do

        if IsValidTarget(player) then

            local character =
                player.Character

            local targetPart =
                GetTargetPart(character)

            if targetPart then

                local distance =
                    GetScreenDistance(
                        targetPart
                    )

                if distance then

                    local insideFOV =
                        true

                    if Config.AimFOV then

                        insideFOV =
                            distance <=
                            Config.AimFOVSize

                    end

                    if insideFOV
                        and IsVisible(
                            targetPart
                        ) then

                        if distance <
                            bestDistance then

                            bestDistance =
                                distance

                            bestPart =
                                targetPart

                        end

                    end

                end

            end

        end

    end

    return bestPart

end

--==================================================
-- AIM FUNCTION
--==================================================

local function AimAt(targetPart)

    if not targetPart then
        return
    end

    if not Camera then
        return
    end

    local cameraPosition =
        Camera.CFrame.Position

    local targetPosition =
        targetPart.Position

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

    local smooth =
        math.clamp(
            Config.AimSmoothness,
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
-- AIM ASSIST LOOP
--==================================================

local CurrentAimTarget = nil

local AimConnection

AimConnection =
    RunService.RenderStepped:Connect(
        function()

            if not Config.AimAssist then

                CurrentAimTarget = nil

                return

            end

            if not LocalPlayer.Character then

                CurrentAimTarget = nil

                return

            end

            Camera =
                workspace.CurrentCamera

            if not Camera then
                return
            end

            local target =
                GetBestTarget()

            CurrentAimTarget =
                target

            if target then

                AimAt(target)

            end

        end
    )

--==================================================
-- TARGET CLEANUP
--==================================================

Players.PlayerRemoving:Connect(
    function(player)

        if CurrentAimTarget
            and CurrentAimTarget:IsDescendantOf(
                player.Character or workspace
            ) then

            CurrentAimTarget = nil

        end

    end
)

--==================================================
-- RESPAWN SAFETY
--==================================================

LocalPlayer.CharacterAdded:Connect(
    function()

        CurrentAimTarget = nil

        task.wait(0.5)

        Camera =
            workspace.CurrentCamera

    end
)

--==================================================
-- AIM FOV UPDATE
--==================================================

RunService.RenderStepped:Connect(
    function()

        if not FOVCircle then
            return
        end

        FOVCircle.Visible =
            Config.AimFOV

        FOVCircle.Size =
            UDim2.fromOffset(
                Config.AimFOVSize * 2,
                Config.AimFOVSize * 2
            )

    end
)

--==================================================
-- PART 2A END
--==================================================

--//==================================================
--// NEUTRALIZATION HUB
--// PART 2B / 10
--// VISUALS + 2D ESP
--//==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

--==================================================
-- VISUAL CONFIG
--==================================================

Config.ESP = false
Config.TeamCheck = true

Config.BoxESP = true
Config.Names = true
Config.Health = true
Config.Distance = true
Config.Snapline = false
Config.ChestESP = false

--==================================================
-- VISUAL PAGE CONTROLS
--==================================================

CreateToggle(
    VisualPage,
    "ESP",
    Config.ESP,
    function(value)

        Config.ESP = value

    end
)

CreateToggle(
    VisualPage,
    "Team Check",
    Config.TeamCheck,
    function(value)

        Config.TeamCheck = value

    end
)

CreateToggle(
    VisualPage,
    "Box ESP",
    Config.BoxESP,
    function(value)

        Config.BoxESP = value

    end
)

CreateToggle(
    VisualPage,
    "Names",
    Config.Names,
    function(value)

        Config.Names = value

    end
)

CreateToggle(
    VisualPage,
    "Health",
    Config.Health,
    function(value)

        Config.Health = value

    end
)

CreateToggle(
    VisualPage,
    "Distance",
    Config.Distance,
    function(value)

        Config.Distance = value

    end
)

CreateToggle(
    VisualPage,
    "Snapline",
    Config.Snapline,
    function(value)

        Config.Snapline = value

    end
)

CreateToggle(
    VisualPage,
    "Chest ESP",
    Config.ChestESP,
    function(value)

        Config.ChestESP = value

    end
)

--==================================================
-- AIM FOV SIZE MOVED TO VISUALS
--==================================================

CreateValue(
    VisualPage,
    "Aim FOV Size",
    Config.AimFOVSize,
    function(value)

        Config.AimFOVSize =
            math.clamp(
                value,
                20,
                1000
            )

    end
)

--==================================================
-- ESP GUI CONTAINER
--==================================================

local ESPContainer = New(
    "Frame",
    {

        Name = "ESPContainer",

        Size =
            UDim2.fromScale(
                1,
                1
            ),

        Position =
            UDim2.fromScale(
                0,
                0
            ),

        BackgroundTransparency = 1,

        BorderSizePixel = 0,

        Visible = true,

        ZIndex = 20

    },
    Gui
)

--==================================================
-- ESP OBJECT STORAGE
--==================================================

local ESPObjects = {}

--==================================================
-- ESP COLORS
--==================================================

local ESPColor =
    Colors.ESP

local TeamColor =
    Color3.fromRGB(
        80,
        170,
        255
    )

--==================================================
-- CREATE ESP OBJECT
--==================================================

local function CreateESPObject(player)

    if ESPObjects[player] then
        return ESPObjects[player]
    end

    local container = New(
        "Frame",
        {

            Name =
                "ESP_" ..
                player.Name,

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            Visible = false,

            ZIndex = 20

        },
        ESPContainer
    )

    -- 2D BOX
    local box = New(
        "Frame",
        {

            Name = "Box",

            BackgroundTransparency = 1,

            BorderSizePixel = 0,

            Visible = false,

            ZIndex = 21

        },
        container
    )

    local boxStroke = New(
        "UIStroke",
        {

            Color = ESPColor,

            Thickness = 1.5,

            Transparency = 0

        },
        box
    )

    -- NAME
    local nameLabel = New(
        "TextLabel",
        {

            Name = "Name",

            BackgroundTransparency = 1,

            Size =
                UDim2.fromOffset(
                    180,
                    18
                ),

            AnchorPoint =
                Vector2.new(
                    0.5,
                    1
                ),

            Text = player.Name,

            TextColor3 = ESPColor,

            TextSize = 12,

            Font =
                Enum.Font.GothamBold,

            TextStrokeTransparency = 0.25,

            TextStrokeColor3 =
                Color3.new(
                    0,
                    0,
                    0
                ),

            Visible = false,

            ZIndex = 22

        },
        container
    )

    -- HEALTH
    local healthLabel = New(
        "TextLabel",
        {

            Name = "Health",

            BackgroundTransparency = 1,

            Size =
                UDim2.fromOffset(
                    180,
                    18
                ),

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0
                ),

            TextColor3 =
                Color3.fromRGB(
                    100,
                    255,
                    100
                ),

            TextSize = 11,

            Font =
                Enum.Font.GothamBold,

            TextStrokeTransparency = 0.25,

            TextStrokeColor3 =
                Color3.new(
                    0,
                    0,
                    0
                ),

            Visible = false,

            ZIndex = 22

        },
        container
    )

    -- DISTANCE
    local distanceLabel = New(
        "TextLabel",
        {

            Name = "Distance",

            BackgroundTransparency = 1,

            Size =
                UDim2.fromOffset(
                    180,
                    18
                ),

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0
                ),

            TextColor3 = Colors.Text,

            TextSize = 11,

            Font =
                Enum.Font.Gotham,

            TextStrokeTransparency = 0.25,

            TextStrokeColor3 =
                Color3.new(
                    0,
                    0,
                    0
                ),

            Visible = false,

            ZIndex = 22

        },
        container
    )

    -- SNAPLINE
    local snapline = New(
        "Frame",
        {

            Name = "Snapline",

            AnchorPoint =
                Vector2.new(
                    0.5,
                    0
                ),

            BackgroundColor3 =
                ESPColor,

            BorderSizePixel = 0,

            Visible = false,

            ZIndex = 19

        },
        container
    )

    local data = {

        Player = player,

        Container = container,

        Box = box,

        BoxStroke = boxStroke,

        Name = nameLabel,

        Health = healthLabel,

        Distance = distanceLabel,

        Snapline = snapline

    }

    ESPObjects[player] = data

    return data

end

--==================================================
-- REMOVE ESP OBJECT
--==================================================

local function RemoveESPObject(player)

    local data =
        ESPObjects[player]

    if not data then
        return
    end

    if data.Container then
        data.Container:Destroy()
    end

    ESPObjects[player] = nil

end

--==================================================
-- TEAM CHECK
--==================================================

local function IsESPAllowed(player)

    if player == LocalPlayer then
        return false
    end

    if not Config.TeamCheck then
        return true
    end

    if LocalPlayer.Team == nil then
        return true
    end

    if player.Team == nil then
        return true
    end

    return player.Team ~= LocalPlayer.Team

end

--==================================================
-- GET CHARACTER BOUNDS
--==================================================

local function GetCharacterBounds(
    character
)

    if not character then
        return nil
    end

    local root =
        character:FindFirstChild(
            "HumanoidRootPart"
        )

    if not root then
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

    local cf, size =
        character:GetBoundingBox()

    local half =
        size / 2

    local corners = {

        cf * Vector3.new(
            -half.X,
            -half.Y,
            -half.Z
        ),

        cf * Vector3.new(
            -half.X,
            -half.Y,
            half.Z
        ),

        cf * Vector3.new(
            -half.X,
            half.Y,
            -half.Z
        ),

        cf * Vector3.new(
            -half.X,
            half.Y,
            half.Z
        ),

        cf * Vector3.new(
            half.X,
            -half.Y,
            -half.Z
        ),

        cf * Vector3.new(
            half.X,
            -half.Y,
            half.Z
        ),

        cf * Vector3.new(
            half.X,
            half.Y,
            -half.Z
        ),

        cf * Vector3.new(
            half.X,
            half.Y,
            half.Z
        )

    }

    local minX = math.huge
    local minY = math.huge

    local maxX = -math.huge
    local maxY = -math.huge

    local visible = false

    for _, corner in ipairs(corners) do

        local screen,
            onScreen =
            Camera:WorldToViewportPoint(
                corner
            )

        if screen.Z > 0 then

            visible = true

            minX =
                math.min(
                    minX,
                    screen.X
                )

            minY =
                math.min(
                    minY,
                    screen.Y
                )

            maxX =
                math.max(
                    maxX,
                    screen.X
                )

            maxY =
                math.max(
                    maxY,
                    screen.Y
                )

        end

    end

    if not visible then
        return nil
    end

    return {

        MinX = minX,
        MinY = minY,

        MaxX = maxX,
        MaxY = maxY,

        Width =
            maxX - minX,

        Height =
            maxY - minY

    }

end

--==================================================
-- ROTATE SNAPLINE
--==================================================

local function SetLine(
    line,
    fromPosition,
    toPosition
)

    local difference =
        toPosition -
        fromPosition

    local length =
        difference.Magnitude

    if length <= 0 then
        line.Visible = false
        return
    end

    line.Position =
        UDim2.fromOffset(
            fromPosition.X,
            fromPosition.Y
        )

    line.Size =
        UDim2.fromOffset(
            1,
            length
        )

    line.Rotation =
        math.deg(
            math.atan2(
                difference.X,
                difference.Y
            )
        )

    line.Visible = true

end

--==================================================
-- UPDATE ESP
--==================================================

local function UpdateESP(
    player,
    data
)

    if not Config.ESP then

        data.Container.Visible = false

        return

    end

    if not IsESPAllowed(player) then

        data.Container.Visible = false

        return

    end

    local character =
        player.Character

    if not character then

        data.Container.Visible = false

        return

    end

    local humanoid =
        character:FindFirstChildOfClass(
            "Humanoid"
        )

    if not humanoid
        or humanoid.Health <= 0 then

        data.Container.Visible = false

        return

    end

    local bounds =
        GetCharacterBounds(
            character
        )

    if not bounds then

        data.Container.Visible = false

        return

    end

    data.Container.Visible = true

    --==================================================
    -- COLOR
    --==================================================

    local color = ESPColor

    if Config.TeamCheck
        and player.Team ~= nil
        and LocalPlayer.Team ~= nil
        and player.Team ~= LocalPlayer.Team then

        color = ESPColor

    end

    data.BoxStroke.Color = color

    data.Name.TextColor3 = color

    data.Snapline.BackgroundColor3 =
        color

    --==================================================
    -- BOX
    --==================================================

    if Config.BoxESP then

        data.Box.Visible = true

        data.Box.Position =
            UDim2.fromOffset(
                bounds.MinX,
                bounds.MinY
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

    else

        data.Box.Visible = false

    end

    --==================================================
    -- NAME
    --==================================================

    if Config.Names then

        data.Name.Visible = true

        data.Name.Position =
            UDim2.fromOffset(
                (
                    bounds.MinX +
                    bounds.MaxX
                ) / 2,
                bounds.MinY - 3
            )

        data.Name.Text =
            player.DisplayName

    else

        data.Name.Visible = false

    end

    --==================================================
    -- HEALTH
    --==================================================

    if Config.Health then

        data.Health.Visible = true

        data.Health.Position =
            UDim2.fromOffset(
                (
                    bounds.MinX +
                    bounds.MaxX
                ) / 2,
                bounds.MaxY + 2
            )

        data.Health.Text =
            "HP: " ..
            math.floor(
                humanoid.Health
            ) ..
            " / " ..
            math.floor(
                humanoid.MaxHealth
            )

    else

        data.Health.Visible = false

    end

    --==================================================
    -- DISTANCE
    --==================================================

    if Config.Distance then

        local root =
            character:FindFirstChild(
                "HumanoidRootPart"
            )

        local localRoot =
            LocalPlayer.Character
            and LocalPlayer.Character:
                FindFirstChild(
                    "HumanoidRootPart"
                )

        if root and localRoot then

            local distance =
                (
                    root.Position -
                    localRoot.Position
                ).Magnitude

            data.Distance.Visible = true

            data.Distance.Position =
                UDim2.fromOffset(
                    (
                        bounds.MinX +
                        bounds.MaxX
                    ) / 2,
                    bounds.MaxY + 19
                )

            data.Distance.Text =
                math.floor(
                    distance
                ) .. " studs"

        else

            data.Distance.Visible = false

        end

    else

        data.Distance.Visible = false

    end

    --==================================================
    -- SNAPLINE
    --==================================================

    if Config.Snapline then

        local center =
            Vector2.new(
                (
                    bounds.MinX +
                    bounds.MaxX
                ) / 2,

                (
                    bounds.MinY +
                    bounds.MaxY
                ) / 2
            )

        local viewport =
            Camera.ViewportSize

        local bottom =
            Vector2.new(
                viewport.X / 2,
                viewport.Y
            )

        SetLine(
            data.Snapline,
            bottom,
            center
        )

    else

        data.Snapline.Visible = false

    end

    --==================================================
    -- CHEST ESP
    --==================================================

    if Config.ChestESP then

        local chest =
            character:FindFirstChild(
                "UpperTorso"
            )
            or character:FindFirstChild(
                "Torso"
            )

        if chest then

            local position,
                onScreen =
                Camera:WorldToViewportPoint(
                    chest.Position
                )

            if onScreen
                and position.Z > 0 then

                -- Маленькая точка,
                -- а не огромный Highlight
                data.BoxStroke.Color =
                    color

            end

        end

    end

end

--==================================================
-- ESP LOOP
--==================================================

for _, player in
    ipairs(Players:GetPlayers()) do

    if player ~= LocalPlayer then

        CreateESPObject(player)

    end

end

Players.PlayerAdded:Connect(
    function(player)

        if player ~= LocalPlayer then

            CreateESPObject(player)

        end

    end
)

Players.PlayerRemoving:Connect(
    function(player)

        RemoveESPObject(player)

    end
)

RunService.RenderStepped:Connect(
    function()

        Camera =
            workspace.CurrentCamera

        if not Camera then
            return
        end

        for player, data in
            pairs(ESPObjects) do

            if player.Parent ==
                Players then

                UpdateESP(
                    player,
                    data
                )

            else

                RemoveESPObject(
                    player
                )

            end

        end

    end
)

--==================================================
-- CHARACTER RESPAWN UPDATE
--==================================================

for _, player in
    ipairs(Players:GetPlayers()) do

    player.CharacterAdded:Connect(
        function()

            task.wait(0.2)

            local data =
                ESPObjects[player]

            if data then

                data.Container.Visible =
                    false

            end

        end
    )

end

Players.PlayerAdded:Connect(
    function(player)

        player.CharacterAdded:Connect(
            function()

                task.wait(0.2)

                local data =
                    ESPObjects[player]

                if data then

                    data.Container.Visible =
                        false

                end

            end
        )

    end
)

--==================================================
-- PART 2B END
--==================================================

--//==================================================
--// NEUTRALIZATION HUB
--// PART 3A / 10
--// MOVEMENT
--//==================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- MOVEMENT CONFIG
--==================================================

Config.Speed = false
Config.SpeedValue = 16

Config.Jump = false
Config.JumpPower = 50

Config.Noclip = false

--==================================================
-- MOVEMENT PAGE
--==================================================

CreateToggle(
    MovementPage,
    "Speed",
    false,
    function(value)

        Config.Speed = value

    end
)

CreateValue(
    MovementPage,
    "Speed Value",
    Config.SpeedValue,
    function(value)

        Config.SpeedValue =
            math.clamp(
                value,
                1,
                100
            )

    end
)

CreateToggle(
    MovementPage,
    "Jump",
    false,
    function(value)

        Config.Jump = value

    end
)

CreateValue(
    MovementPage,
    "JumpPower",
    Config.JumpPower,
    function(value)

        Config.JumpPower =
            math.clamp(
                value,
                1,
                1000
            )

    end
)

CreateToggle(
    MovementPage,
    "Noclip",
    false,
    function(value)

        Config.Noclip = value

    end
)

--==================================================
-- CURRENT CHARACTER
--==================================================

local CurrentCharacter = nil
local CurrentHumanoid = nil
local CurrentRoot = nil

--==================================================
-- ORIGINAL CHARACTER VALUES
--==================================================

local OriginalWalkSpeed = 16
local OriginalJumpPower = 50

local OriginalUseJumpPower = true

--==================================================
-- LOAD CHARACTER
--==================================================

local function SetupCharacter(character)

    CurrentCharacter = character

    CurrentHumanoid =
        character:WaitForChild(
            "Humanoid",
            5
        )

    CurrentRoot =
        character:WaitForChild(
            "HumanoidRootPart",
            5
        )

    if not CurrentHumanoid then
        return
    end

    -- Сохраняем реальные значения
    OriginalWalkSpeed =
        CurrentHumanoid.WalkSpeed

    OriginalUseJumpPower =
        CurrentHumanoid.UseJumpPower

    if CurrentHumanoid.UseJumpPower then

        OriginalJumpPower =
            CurrentHumanoid.JumpPower

    else

        OriginalJumpPower =
            CurrentHumanoid.JumpHeight

    end

    -- ВАЖНО:
    -- Speed и Jump при старте выключены.
    -- Поэтому персонаж остаётся обычным.

    if not Config.Speed then

        CurrentHumanoid.WalkSpeed =
            OriginalWalkSpeed

    end

    if not Config.Jump then

        if CurrentHumanoid.UseJumpPower then

            CurrentHumanoid.JumpPower =
                OriginalJumpPower

        else

            CurrentHumanoid.JumpHeight =
                OriginalJumpPower

        end

    end

end

--==================================================
-- SPEED
--==================================================

local function UpdateSpeed()

    local humanoid =
        CurrentHumanoid

    if not humanoid then
        return
    end

    if humanoid.Health <= 0 then
        return
    end

    if Config.Speed then

        humanoid.WalkSpeed =
            Config.SpeedValue

    else

        humanoid.WalkSpeed =
            OriginalWalkSpeed

    end

end

--==================================================
-- JUMP
--==================================================

local function UpdateJump()

    local humanoid =
        CurrentHumanoid

    if not humanoid then
        return
    end

    if humanoid.Health <= 0 then
        return
    end

    if Config.Jump then

        if humanoid.UseJumpPower then

            humanoid.JumpPower =
                Config.JumpPower

        else

            -- Если игра использует JumpHeight,
            -- переводим JumpPower в разумное значение.
            humanoid.JumpHeight =
                math.max(
                    1,
                    Config.JumpPower / 7
                )

        end

    else

        if humanoid.UseJumpPower then

            humanoid.JumpPower =
                OriginalJumpPower

        else

            humanoid.JumpHeight =
                OriginalJumpPower

        end

    end

end

--==================================================
-- NOCLIP
--==================================================

local function UpdateNoclip()

    local character =
        CurrentCharacter

    if not character then
        return
    end

    for _, object in
        ipairs(
            character:GetDescendants()
        ) do

        if object:IsA("BasePart") then

            if object.Name ~=
                "HumanoidRootPart" then

                object.CanCollide =
                    not Config.Noclip

            end

        end

    end

end

--==================================================
-- NOCLIP OFF
--==================================================

local function RestoreCollision()

    local character =
        CurrentCharacter

    if not character then
        return
    end

    for _, object in
        ipairs(
            character:GetDescendants()
        ) do

        if object:IsA("BasePart") then

            if object.Name ~=
                "HumanoidRootPart" then

                object.CanCollide = true

            end

        end

    end

end

--==================================================
-- TOGGLE CALLBACK REFRESH
--==================================================

local function RefreshMovement()

    UpdateSpeed()
    UpdateJump()

    if Config.Noclip then

        UpdateNoclip()

    else

        RestoreCollision()

    end

end

--==================================================
-- CHARACTER ADDED
--==================================================

LocalPlayer.CharacterAdded:Connect(
    function(character)

        -- Сбрасываем ссылки
        CurrentCharacter = nil
        CurrentHumanoid = nil
        CurrentRoot = nil

        task.wait(0.15)

        SetupCharacter(
            character
        )

        -- Применяем только реально
        -- включённые функции.
        if Config.Speed then
            UpdateSpeed()
        end

        if Config.Jump then
            UpdateJump()
        end

        if Config.Noclip then
            UpdateNoclip()
        end

    end
)

--==================================================
-- INITIAL CHARACTER
--==================================================

if LocalPlayer.Character then

    SetupCharacter(
        LocalPlayer.Character
    )

end

--==================================================
-- MOVEMENT LOOP
--==================================================

local MovementConnection

MovementConnection =
    RunService.Heartbeat:Connect(
        function()

            if not CurrentCharacter
                or not CurrentCharacter.Parent then

                return

            end

            if not CurrentHumanoid then
                return
            end

            if CurrentHumanoid.Health <= 0 then
                return
            end

            -- SPEED
            if Config.Speed then

                if
                    math.abs(
                        CurrentHumanoid.WalkSpeed
                        - Config.SpeedValue
                    ) > 0.01
                then

                    CurrentHumanoid.WalkSpeed =
                        Config.SpeedValue

                end

            end

            -- JUMP
            if Config.Jump then

                if CurrentHumanoid.UseJumpPower then

                    if
                        math.abs(
                            CurrentHumanoid.JumpPower
                            - Config.JumpPower
                        ) > 0.01
                    then

                        CurrentHumanoid.JumpPower =
                            Config.JumpPower

                    end

                else

                    local targetHeight =
                        math.max(
                            1,
                            Config.JumpPower / 7
                        )

                    if
                        math.abs(
                            CurrentHumanoid.JumpHeight
                            - targetHeight
                        ) > 0.01
                    then

                        CurrentHumanoid.JumpHeight =
                            targetHeight

                    end

                end

            end

            -- NOCLIP
            if Config.Noclip then

                UpdateNoclip()

            end

        end
    )

--==================================================
-- EXTRA TOGGLE MONITOR
--==================================================

task.spawn(
    function()

        local lastSpeed =
            Config.Speed

        local lastJump =
            Config.Jump

        local lastNoclip =
            Config.Noclip

        while Gui
            and Gui.Parent do

            task.wait(0.1)

            -- SPEED CHANGED
            if lastSpeed ~=
                Config.Speed then

                lastSpeed =
                    Config.Speed

                UpdateSpeed()

            end

            -- JUMP CHANGED
            if lastJump ~=
                Config.Jump then

                lastJump =
                    Config.Jump

                UpdateJump()

            end

            -- NOCLIP CHANGED
            if lastNoclip ~=
                Config.Noclip then

                lastNoclip =
                    Config.Noclip

                if Config.Noclip then

                    UpdateNoclip()

                else

                    RestoreCollision()

                end

            end

        end

    end
)

--==================================================
-- VALUE CHANGE MONITOR
--==================================================

task.spawn(
    function()

        local lastSpeedValue =
            Config.SpeedValue

        local lastJumpPower =
            Config.JumpPower

        while Gui
            and Gui.Parent do

            task.wait(0.1)

            if lastSpeedValue ~=
                Config.SpeedValue then

                lastSpeedValue =
                    Config.SpeedValue

                if Config.Speed then
                    UpdateSpeed()
                end

            end

            if lastJumpPower ~=
                Config.JumpPower then

                lastJumpPower =
                    Config.JumpPower

                if Config.Jump then
                    UpdateJump()
                end

            end

        end

    end
)

--==================================================
-- CLEANUP
--==================================================

Gui.Destroying:Connect(
    function()

        Config.Speed = false
        Config.Jump = false
        Config.Noclip = false

        if CurrentHumanoid then

            CurrentHumanoid.WalkSpeed =
                OriginalWalkSpeed

            if CurrentHumanoid.UseJumpPower then

                CurrentHumanoid.JumpPower =
                    OriginalJumpPower

            else

                CurrentHumanoid.JumpHeight =
                    OriginalJumpPower

            end

        end

        RestoreCollision()

        if MovementConnection then

            MovementConnection:Disconnect()

        end

    end
)

--==================================================
-- PART 3A END
--==================================================

--//==================================================
--// NEUTRALIZATION HUB
--// PART 3B / 10
--// FOV CHANGER + CAMERA
--//==================================================

local RunService = game:GetService("RunService")

local Camera = workspace.CurrentCamera

--==================================================
-- FOV CONFIG
--==================================================

Config.FOVChanger = false
Config.GameFOV = 70

local OriginalGameFOV = 70

--==================================================
-- SAVE ORIGINAL FOV
--==================================================

if Camera then

    OriginalGameFOV =
        Camera.FieldOfView

    Config.GameFOV =
        OriginalGameFOV

end

--==================================================
-- FOV CONTROLS
--==================================================

CreateToggle(
    MovementPage,
    "FOV Changer",
    false,
    function(value)

        Config.FOVChanger =
            value

        if not value then

            local currentCamera =
                workspace.CurrentCamera

            if currentCamera then

                currentCamera.FieldOfView =
                    OriginalGameFOV

            end

        end

    end
)

CreateValue(
    MovementPage,
    "Game FOV",
    Config.GameFOV,
    function(value)

        Config.GameFOV =
            math.clamp(
                value,
                40,
                120
            )

        if Config.FOVChanger then

            local currentCamera =
                workspace.CurrentCamera

            if currentCamera then

                currentCamera.FieldOfView =
                    Config.GameFOV

            end

        end

    end
)

--==================================================
-- CAMERA UPDATE
--==================================================

local FOVConnection

FOVConnection =
    RunService.RenderStepped:Connect(
        function()

            local currentCamera =
                workspace.CurrentCamera

            if not currentCamera then
                return
            end

            Camera =
                currentCamera

            if Config.FOVChanger then

                if math.abs(
                    currentCamera.FieldOfView
                    - Config.GameFOV
                ) > 0.01 then

                    currentCamera.FieldOfView =
                        Config.GameFOV

                end

            end

        end
    )

--==================================================
-- CAMERA RESPAWN SAFETY
--==================================================

LocalPlayer.CharacterAdded:Connect(
    function()

        task.wait(0.25)

        Camera =
            workspace.CurrentCamera

        if not Camera then
            return
        end

        if Config.FOVChanger then

            Camera.FieldOfView =
                Config.GameFOV

        else

            Camera.FieldOfView =
                OriginalGameFOV

        end

    end
)

--==================================================
-- CAMERA RESET
--==================================================

Gui.Destroying:Connect(
    function()

        local currentCamera =
            workspace.CurrentCamera

        if currentCamera then

            currentCamera.FieldOfView =
                OriginalGameFOV

        end

        if FOVConnection then

            FOVConnection:Disconnect()

        end

    end
)

--==================================================
-- PART 3B END
--==================================================

--==================================================
-- PART 4A — SETTINGS + TELEGRAM
--==================================================

local TelegramURL = "https://t.me/lunarhub_script"

--==================================================
-- CLEAR OLD SETTINGS CONTENT
--==================================================

for _, child in ipairs(SettingsPage:GetChildren()) do
    if not child:IsA("UIListLayout")
    and not child:IsA("UIPadding") then
        child:Destroy()
    end
end

--==================================================
-- SETTINGS HEADER
--==================================================

local SettingsHeader = New("Frame", {
    Size = UDim2.new(1, -8, 0, 70),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, SettingsHeader)

New("TextLabel", {
    Size = UDim2.new(1, -24, 0, 30),
    Position = UDim2.fromOffset(12, 7),
    BackgroundTransparency = 1,
    Text = "NEUTRALIZATION HUB",
    TextColor3 = Colors.Text,
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left
}, SettingsHeader)

New("TextLabel", {
    Size = UDim2.new(1, -24, 0, 25),
    Position = UDim2.fromOffset(12, 38),
    BackgroundTransparency = 1,
    Text = "Settings & official links",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, SettingsHeader)

--==================================================
-- TELEGRAM
--==================================================

local TelegramFrame = New("Frame", {
    Size = UDim2.new(1, -8, 0, 82),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, TelegramFrame)

New("TextLabel", {
    Size = UDim2.new(1, -120, 0, 25),
    Position = UDim2.fromOffset(12, 7),
    BackgroundTransparency = 1,
    Text = "Telegram",
    TextColor3 = Colors.Text,
    TextSize = 14,
    Font = Enum.Font.GothamSemibold,
    TextXAlignment = Enum.TextXAlignment.Left
}, TelegramFrame)

local TelegramText = New("TextLabel", {
    Size = UDim2.new(1, -125, 0, 25),
    Position = UDim2.fromOffset(12, 34),
    BackgroundTransparency = 1,
    Text = "@lunarhub_script",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, TelegramFrame)

local TelegramButton = New("TextButton", {
    Size = UDim2.fromOffset(88, 34),
    Position = UDim2.new(1, -100, 0.5, -17),
    BackgroundColor3 = Colors.Menu,
    Text = "COPY",
    TextColor3 = Colors.Text,
    TextSize = 11,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false
}, TelegramFrame)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, TelegramButton)

TelegramButton.MouseEnter:Connect(function()
    Tween(TelegramButton, {
        BackgroundColor3 = Color3.fromRGB(195, 30, 30)
    }, 0.15):Play()
end)

TelegramButton.MouseLeave:Connect(function()
    Tween(TelegramButton, {
        BackgroundColor3 = Colors.Menu
    }, 0.15):Play()
end)

TelegramButton.MouseButton1Click:Connect(function()
    local copied = false

    pcall(function()
        if setclipboard then
            setclipboard(TelegramURL)
            copied = true
        end
    end)

    if copied then
        TelegramButton.Text = "COPIED!"

        task.delay(1.2, function()
            if TelegramButton and TelegramButton.Parent then
                TelegramButton.Text = "COPY"
            end
        end)
    else
        TelegramText.Text = TelegramURL
        TelegramButton.Text = "LINK"

        task.delay(2, function()
            if TelegramButton and TelegramButton.Parent then
                TelegramButton.Text = "COPY"
            end

            if TelegramText and TelegramText.Parent then
                TelegramText.Text = "@lunarhub_script"
            end
        end)
    end
end)

--==================================================
-- VERSION
--==================================================

local VersionFrame = New("Frame", {
    Size = UDim2.new(1, -8, 0, 50),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, VersionFrame)

New("TextLabel", {
    Size = UDim2.new(1, -24, 1, 0),
    Position = UDim2.fromOffset(12, 0),
    BackgroundTransparency = 1,
    Text = "Neutralization Hub  •  v1.0",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, VersionFrame)

print("[Neutralization Hub] Part 4A loaded.")

--==================================================
-- PART 4B — SETTINGS / THEME
--==================================================

--==================================================
-- THEME INFO
--==================================================

local ThemeFrame = New("Frame", {
    Size = UDim2.new(1, -8, 0, 70),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, ThemeFrame)

New("TextLabel", {
    Size = UDim2.new(1, -24, 0, 26),
    Position = UDim2.fromOffset(12, 7),
    BackgroundTransparency = 1,
    Text = "Interface",
    TextColor3 = Colors.Text,
    TextSize = 14,
    Font = Enum.Font.GothamSemibold,
    TextXAlignment = Enum.TextXAlignment.Left
}, ThemeFrame)

New("TextLabel", {
    Size = UDim2.new(1, -24, 0, 25),
    Position = UDim2.fromOffset(12, 34),
    BackgroundTransparency = 1,
    Text = "Animations remain enabled for the interface.",
    TextColor3 = Colors.SubText,
    TextSize = 11,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, ThemeFrame)

--==================================================
-- CLEAN OLD MISC CONTROLS
--==================================================

-- The new version does not expose:
-- Fullbright
-- Menu Animations
-- Music

-- UI animations themselves remain active.

--==================================================
-- SETTINGS STATUS
--==================================================

local StatusFrame = New("Frame", {
    Size = UDim2.new(1, -8, 0, 55),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, StatusFrame)

local StatusLabel = New("TextLabel", {
    Size = UDim2.new(1, -24, 1, 0),
    Position = UDim2.fromOffset(12, 0),
    BackgroundTransparency = 1,
    Text = "Status: Ready",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, StatusFrame)

--==================================================
-- SETTINGS STATUS HELPER
--==================================================

local function SetSettingsStatus(text)
    if StatusLabel and StatusLabel.Parent then
        StatusLabel.Text = "Status: " .. tostring(text)

        Tween(StatusLabel, {
            TextTransparency = 0
        }, 0.15):Play()
    end
end

--==================================================
-- TELEGRAM STATUS HOOK
--==================================================

if TelegramButton then
    TelegramButton.MouseButton1Click:Connect(function()
        SetSettingsStatus("Telegram link copied")
    end)
end

--==================================================
-- VERSION / BUILD INFO
--==================================================

local BuildFrame = New("Frame", {
    Size = UDim2.new(1, -8, 0, 55),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, SettingsPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, BuildFrame)

New("TextLabel", {
    Size = UDim2.new(1, -24, 1, 0),
    Position = UDim2.fromOffset(12, 0),
    BackgroundTransparency = 1,
    Text = "Build: Lunar Hub / Neutralization Hub",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, BuildFrame)

--==================================================
-- FINAL SETTINGS MESSAGE
--==================================================

SetSettingsStatus("Ready")

print("[Neutralization Hub] Part 4B loaded.")

--==================================================
-- PART 5 — FINALIZATION / UPDATE LOOP / CLEANUP
--==================================================

--==================================================
-- FINAL CONFIG DEFAULTS
--==================================================

Config.AimAssist = Config.AimAssist or false
Config.VisibleOnly = Config.VisibleOnly ~= false

Config.AimFOV = Config.AimFOV ~= false
Config.AimFOVSize = Config.AimFOVSize or 150
Config.AimSmoothness = Config.AimSmoothness or 0.18

Config.TargetPart = Config.TargetPart or "Head"

Config.ESP = Config.ESP or false
Config.TeamCheck = Config.TeamCheck ~= false

Config.BoxESP = Config.BoxESP or false
Config.Names = Config.Names or false
Config.Health = Config.Health or false
Config.Distance = Config.Distance or false
Config.Snapline = Config.Snapline or false
Config.ChestESP = Config.ChestESP or false

Config.Speed = Config.Speed or false
Config.SpeedValue = Config.SpeedValue or 16

Config.Jump = Config.Jump or false
Config.JumpPower = Config.JumpPower or 50

Config.Noclip = Config.Noclip or false

Config.FOVChanger = Config.FOVChanger or false

--==================================================
-- CHARACTER STATE
--==================================================

local CharacterConnection
local HumanoidConnection

local OriginalWalkSpeed = 16
local OriginalJumpPower = 50
local OriginalJumpHeight = 7.2
local OriginalUseJumpPower = true

local function CaptureCharacterValues(character)
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return
    end

    OriginalWalkSpeed = humanoid.WalkSpeed
    OriginalUseJumpPower = humanoid.UseJumpPower

    if humanoid.UseJumpPower then
        OriginalJumpPower = humanoid.JumpPower
    else
        OriginalJumpHeight = humanoid.JumpHeight
    end
end

--==================================================
-- CHARACTER SETUP
--==================================================

local function SetupCharacter(character)
    if not character then
        return
    end

    local humanoid = character:WaitForChild("Humanoid", 5)

    if not humanoid then
        return
    end

    CaptureCharacterValues(character)

    task.wait(0.1)

    if Config.Speed then
        humanoid.WalkSpeed = Config.SpeedValue
    end

    if Config.Jump then
        if humanoid.UseJumpPower then
            humanoid.JumpPower = Config.JumpPower
        else
            humanoid.JumpHeight = Config.JumpPower
        end
    end
end

--==================================================
-- RESPAWN HANDLER
--==================================================

if LocalPlayer.Character then
    task.spawn(function()
        SetupCharacter(LocalPlayer.Character)
    end)
end

CharacterConnection = LocalPlayer.CharacterAdded:Connect(function(character)

    task.spawn(function()
        SetupCharacter(character)
    end)

end)

--==================================================
-- MOVEMENT UPDATE
--==================================================

local function UpdateMovement()

    local character = LocalPlayer.Character

    if not character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return
    end

    -- SPEED
    if Config.Speed then

        humanoid.WalkSpeed = Config.SpeedValue

    else

        humanoid.WalkSpeed = OriginalWalkSpeed

    end

    -- JUMP
    if Config.Jump then

        if humanoid.UseJumpPower then
            humanoid.JumpPower = Config.JumpPower
        else
            humanoid.JumpHeight = Config.JumpPower
        end

    else

        if OriginalUseJumpPower then
            humanoid.JumpPower = OriginalJumpPower
        else
            humanoid.JumpHeight = OriginalJumpHeight
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

            if Config.Noclip then
                object.CanCollide = false
            else
                object.CanCollide = true
            end

        end

    end

end

--==================================================
-- GAME FOV
--==================================================

local OriginalGameFOV = 70

do

    local camera = workspace.CurrentCamera

    if camera then
        OriginalGameFOV = camera.FieldOfView
        Config.GameFOV = Config.GameFOV or OriginalGameFOV
    end

end

local function UpdateGameFOV()

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    if Config.FOVChanger then

        camera.FieldOfView = math.clamp(
            tonumber(Config.GameFOV) or OriginalGameFOV,
            40,
            120
        )

    else

        camera.FieldOfView = OriginalGameFOV

    end

end

--==================================================
-- AIM FOV VISUAL
--==================================================

local function UpdateAimFOV()

    if not FOVCircle then
        return
    end

    local size = tonumber(Config.AimFOVSize) or 150

    size = math.clamp(size, 20, 1000)

    FOVCircle.Size = UDim2.fromOffset(
        size * 2,
        size * 2
    )

    FOVCircle.Visible = Config.AimFOV

    if FOVStroke then
        FOVStroke.Color = Colors.Menu
    end

end

--==================================================
-- OLD FOV COMPATIBILITY
--==================================================

Config.FOV = Config.AimFOVSize

--==================================================
-- SAFETY: DISABLE OLD FEATURES
--==================================================

Config.Fullbright = false
Config.MenuAnimations = true

-- These values are intentionally not exposed
-- as toggles in the new interface.

--==================================================
-- MAIN UPDATE LOOP
--==================================================

local MainConnection

MainConnection = RunService.RenderStepped:Connect(function()

    if not Gui or not Gui.Parent then
        return
    end

    -- Movement
    UpdateMovement()

    -- Noclip
    UpdateNoclip()

    -- Game FOV
    UpdateGameFOV()

    -- Aim FOV
    UpdateAimFOV()

end)

--==================================================
-- REMOVE UNUSED MISC CONTENT
--==================================================

for _, object in ipairs(MiscPage:GetChildren()) do

    if object:IsA("Frame")
    or object:IsA("TextButton")
    or object:IsA("TextLabel") then

        object:Destroy()

    end

end

-- Keep Misc page available but empty.
-- UI animations are handled internally.

local MiscEmpty = New("Frame", {
    Size = UDim2.new(1, -8, 0, 60),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0
}, MiscPage)

New("UICorner", {
    CornerRadius = UDim.new(0, 6)
}, MiscEmpty)

New("TextLabel", {
    Size = UDim2.new(1, -24, 1, 0),
    Position = UDim2.fromOffset(12, 0),
    BackgroundTransparency = 1,
    Text = "No additional features",
    TextColor3 = Colors.SubText,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left
}, MiscEmpty)

--==================================================
-- SETTINGS PAGE INITIALIZATION
--==================================================

if SettingsPage then

    SettingsPage.Visible = false

end

--==================================================
-- COMBAT PAGE INITIALIZATION
--==================================================

if CombatPage then

    CombatPage.Visible = true
    CurrentPage = CombatPage

end

--==================================================
-- SIDEBAR ACTIVE STATE
--==================================================

for _, button in ipairs(Sidebar:GetChildren()) do

    if button:IsA("TextButton") then

        if button.Text == "Combat" then

            button.BackgroundColor3 = Colors.Menu
            button.TextColor3 = Colors.Text

        else

            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            button.TextColor3 = Colors.SubText

        end

    end

end

--==================================================
-- MENU ANIMATION
--==================================================

if Main then

    Main.Size = UDim2.fromOffset(0, 0)

    Tween(
        Main,
        {
            Size = UDim2.fromOffset(520, 320)
        },
        0.35
    ):Play()

end

--==================================================
-- GUI CLEANUP
--==================================================

local function CleanupHub()

    -- Restore movement
    local character = LocalPlayer.Character

    if character then

        local humanoid =
            character:FindFirstChildOfClass("Humanoid")

        if humanoid then

            humanoid.WalkSpeed = OriginalWalkSpeed

            if OriginalUseJumpPower then

                humanoid.JumpPower = OriginalJumpPower

            else

                humanoid.JumpHeight = OriginalJumpHeight

            end

        end

        for _, object in ipairs(character:GetDescendants()) do

            if object:IsA("BasePart") then
                object.CanCollide = true
            end
        end

    end

    -- Restore camera
    local camera = workspace.CurrentCamera

    if camera then
        camera.FieldOfView = OriginalGameFOV
    end

    -- Disconnect
    if MainConnection then
        MainConnection:Disconnect()
        MainConnection = nil
    end

    if CharacterConnection then
        CharacterConnection:Disconnect()
        CharacterConnection = nil
    end

    -- Remove ESP
    if ESPObjects then

        for player, data in pairs(ESPObjects) do

            if data then

                for _, object in pairs(data) do

                    if typeof(object) == "Instance"
                    and object.Parent then

                        object:Destroy()

                    end

                end

            end

            ESPObjects[player] = nil

        end

    end

end

--==================================================
-- GUI DESTROY HANDLER
--==================================================

if Gui then

    Gui.Destroying:Connect(function()

        pcall(function()
            CleanupHub()
        end)

    end)

end

--==================================================
-- FINAL STATUS
--==================================================

print("======================================")
print("[Neutralization Hub]")
print("Final build loaded successfully.")
print("Aim Assist      : READY")
print("ESP             : READY")
print("Movement        : READY")
print("Noclip          : READY")
print("FOV Changer     : READY")
print("Settings        : READY")
print("Telegram        : https://t.me/lunarhub_script")
print("======================================")
