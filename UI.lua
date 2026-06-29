loadstring(game:HttpGet(('https://raw.githubusercontent.com/IAmMrNoob/RFE/main/NoobsUI/menuTopBarPlugin.lua'), true))()
local screenGui = Instance.new("ScreenGui", gethui())
local assetpaths = {}
function addIcons(Name, imgSrclink)
	if not isfolder("SlightCustomChat") then
		makefolder("SlightCustomChat")
		makefolder("SlightCustomChat/Icons")
	end
	if not isfile("SlightCustomChat/Icons/"..Name .. ".png") then
		writefile("SlightCustomChat/Icons/"..Name .. ".png", game:HttpGet(imgSrclink))
	end
	assetpaths[Name] = "SlightCustomChat/Icons/".. Name .. ".png"
end
addIcons("chat", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/White/chat.png")
addIcons("close", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/White/close.png")
addIcons("settings", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/White/settings.png")
addIcons("plrlist", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/White/patient%20list.png")
addIcons("themesettings", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/White/format%20paint.png")
addIcons("sendig", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/White/keyboard%20arrow%20right.png")
addIcons("close_", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/Black/close.png")
addIcons("settings_", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/Black/settings.png")
addIcons("plrlist_", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/Black/patient%20list.png")
addIcons("themesettings_", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/Black/format%20paint.png")
addIcons("sendig_", "https://raw.githubusercontent.com/IAmMrNoob/RFE/refs/heads/main/NoobsUI/assets/Black/keyboard%20arrow%20right.png")
local theming = {
    bgs = {},
    tops = {},
    strokesW = {},
    strokesB = {},
    label = {},
    textbox = {}
}
function addThingTheming(ui, cat)
	cat = cat or 1
	if ui == nil then
		return error("ui cannot be nil")
	end
	local prop = "bgs"
	if cat == 2 or cat == "t" then
		prop = "tops"
	elseif cat == 3 or cat == "sw" then
		prop = "strokesW"
	elseif cat == 4 or cat == "sb" then
		prop = "strokesB"
	elseif cat == 5 or cat == "l" then
		prop = "label"
	elseif cat == 6 or cat == "tb" then
		prop = "textbox"
	end
	table.insert(theming[prop], ui)
	return ui
end
local settings = {
    cRate = 0.15,
    Theming = {
        Font = "Cartoon",
        Main = {30, 30, 30},
        Text = {255, 255, 255},
        PlaceHolder = {110, 110, 110}
    }
}
local Bone = Instance.new("Frame", screenGui)
local SizeConstraint = Instance.new("UISizeConstraint")
menuTopBarPlugin.createButton(assetpaths.chat, function ()
    Bone.Visible = not Bone.Visible
end)

Bone.Name = "Bone"
Bone.AnchorPoint = Vector2.new(0.5, 0)
Bone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bone.BackgroundTransparency = 1.000
Bone.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bone.BorderSizePixel = 0
Bone.Position = UDim2.new(0.5, 0, 0.5, 0)
Bone.Size = UDim2.new(0.38499999, 0, 0.5, 0)

SizeConstraint.Name = "SizeConstraint"
SizeConstraint.Parent = Bone
SizeConstraint.MaxSize = Vector2.new(480, 320)
SizeConstraint.MinSize = Vector2.new(300, 200)

local font = Enum.Font.Cartoon
local setTheme, AddMessage
local bigSidebar = {}

--------------

local SlightCustomChat = Instance.new("Frame", Bone)
local Padding = Instance.new("UIPadding")
local Corner = Instance.new("UICorner")
local ListLayout = Instance.new("UIListLayout")
local SlightCustomChat_Stroke = Instance.new("UIStroke", SlightCustomChat)

local TopbarFrame = Instance.new("Frame")
local TopbarInner = Instance.new("Frame")
local Corner_2 = Instance.new("UICorner")
local Title = addThingTheming(Instance.new("TextLabel"), 5)
local SettingsButton = Instance.new("ImageButton")
local UsersButton = Instance.new("ImageButton")
local CloseButton = Instance.new("ImageButton")
local ThemesButton = Instance.new("ImageButton")

local Chat = Instance.new("Frame")
local Chat_Flex = Instance.new("UIFlexItem", Chat)

local Bar = Instance.new("Frame")
local Bar_Constraint = Instance.new("UISizeConstraint", Bar)
local Bar_Stroke = Instance.new("UIStroke", Bar)
local Corner_3 = Instance.new("UICorner")
local SendButton = Instance.new("ImageButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextBox = addThingTheming(Instance.new("TextBox"), 6)
local UIPadding = Instance.new("UIPadding")

local Display = Instance.new("Frame")
local Display_Flex = Instance.new("UIFlexItem", Display)

local DisplatScroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ListLayout_2 = Instance.new("UIListLayout")
local Chatstub = Instance.new("Frame")
local Chatstub1 = Instance.new("Frame")
local Chatstub2 = Instance.new("Frame")

SlightCustomChat.Name = "SlightCustomChat"
addThingTheming(SlightCustomChat).BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SlightCustomChat.BorderColor3 = Color3.fromRGB(0, 0, 0)
SlightCustomChat.BorderSizePixel = 0
SlightCustomChat.Size = UDim2.new(1, 0, 1, 0)
SlightCustomChat.ZIndex = 0

Padding.Name = "Padding"
Padding.Parent = SlightCustomChat
Padding.PaddingTop = UDim.new(0, 15)

Corner.CornerRadius = UDim.new(0, 10)
Corner.Name = "Corner"
Corner.Parent = SlightCustomChat

ListLayout.Name = "ListLayout"
ListLayout.Parent = SlightCustomChat
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

SlightCustomChat_Stroke.ApplyStrokeMode = "Border"
SlightCustomChat_Stroke.BorderStrokePosition = "Outer"
SlightCustomChat_Stroke.Color = Color3.new(1, 1, 1)
addThingTheming(SlightCustomChat_Stroke, 3).Transparency = .5

------------------

TopbarFrame.Name = "TopbarFrame"
TopbarFrame.ZIndex = 0
TopbarFrame.Parent = SlightCustomChat
addThingTheming(TopbarFrame, 2).BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopbarFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopbarFrame.BorderSizePixel = 0
TopbarFrame.Size = UDim2.new(1, 0, 0, 10)local UserInputService = game:GetService("UserInputService")

local dragging, dragInput, dragStart, startPos
local UIToDrag, ThingToGrab = Bone, TopbarInner
local function update(input)
	local delta = input.Position - dragStart
	task.wait(1/120)
	UIToDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
ThingToGrab.InputBegan:Connect(function (input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = UIToDrag.Position
        input.Changed:Connect(function ()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
ThingToGrab.InputChanged:Connect(function (input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function (input)
    if input == dragInput and dragging then
        update(input)
    end
end)

TopbarInner.Name = "TopbarInner"
TopbarInner.Parent = TopbarFrame
TopbarInner.AnchorPoint = Vector2.new(0, 1)
addThingTheming(TopbarInner, 2).BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopbarInner.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopbarInner.BorderSizePixel = 0
TopbarInner.Position = UDim2.new(0, 0, 1, 0)
TopbarInner.Size = UDim2.new(1, 0, 0, 25)
TopbarInner.ZIndex = 0

Corner_2.CornerRadius = UDim.new(0, 10)
Corner_2.Name = "Corner"
Corner_2.Parent = TopbarInner

Title.Name = "Title"
Title.Parent = TopbarInner
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = font
Title.Text = "Slight Custom Chat"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.ZIndex = 0

SettingsButton.Name = "SettingsButton"
SettingsButton.Parent = TopbarInner
SettingsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingsButton.BackgroundTransparency = 1.000
SettingsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SettingsButton.BorderSizePixel = 0
SettingsButton.Size = UDim2.new(0, 25, 0, 25)
SettingsButton.Image = getcustomasset(assetpaths.settings)
SettingsButton.ZIndex = 0

UsersButton.Name = "UsersButton"
UsersButton.Parent = TopbarInner
UsersButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UsersButton.BackgroundTransparency = 1.000
UsersButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
UsersButton.BorderSizePixel = 0
UsersButton.Position = UDim2.new(0, 56, 0, 0)
UsersButton.Size = UDim2.new(0, 25, 0, 25)
UsersButton.Image = getcustomasset(assetpaths.plrlist)
UsersButton.ZIndex = 0

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopbarInner
CloseButton.AnchorPoint = Vector2.new(1, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Image = getcustomasset(assetpaths.close)
CloseButton.ZIndex = 0
CloseButton.MouseButton1Click:Connect(function ()
    Bone.Visible = false
end)

ThemesButton.Name = "ThemesButton"
ThemesButton.Parent = TopbarInner
ThemesButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ThemesButton.BackgroundTransparency = 1.000
ThemesButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ThemesButton.BorderSizePixel = 0
ThemesButton.Position = UDim2.new(0, 28, 0, 0)
ThemesButton.Size = UDim2.new(0, 25, 0, 25)
ThemesButton.Image = getcustomasset(assetpaths.themesettings)
ThemesButton.ZIndex = 0

------------------

Chat.Name = "Chat"
Chat.Parent = SlightCustomChat
Chat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chat.BackgroundTransparency = 1.000
Chat.BorderColor3 = Color3.fromRGB(0, 0, 0)
Chat.BorderSizePixel = 0
Chat.Size = UDim2.new(1, 0, 0, 0)
Chat.ZIndex = 0

Chat_Flex.FlexMode = "Grow"

ListLayout_2.Name = "ListLayout"
ListLayout_2.Parent = Chat
ListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout_2.Padding = UDim.new(0, 3)

Chatstub.Name = "Chatstub"
Chatstub.Parent = Chat
Chatstub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chatstub.BackgroundTransparency = 1.000
Chatstub.BorderColor3 = Color3.fromRGB(0, 0, 0)
Chatstub.BorderSizePixel = 0
Chatstub.ZIndex = 0

Chatstub1.Name = "Chatstub1"
Chatstub1.Parent = Chat
Chatstub1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chatstub1.BackgroundTransparency = 1.000
Chatstub1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Chatstub1.BorderSizePixel = 0
Chatstub1.LayoutOrder = 2
Chatstub1.ZIndex = 0

Chatstub2.Name = "Chatstub2"
Chatstub2.Parent = Chat
Chatstub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chatstub2.BackgroundTransparency = 1.000
Chatstub2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Chatstub2.BorderSizePixel = 0
Chatstub2.LayoutOrder = 4
Chatstub2.Size = UDim2.new(0, 0, 0, 3)
Chatstub2.ZIndex = 0

------------------

Display.Name = "Display"
Display.Parent = Chat
Display.AnchorPoint = Vector2.new(0.5, 0)
Display.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Display.BackgroundTransparency = 0.900
Display.BorderColor3 = Color3.fromRGB(0, 0, 0)
Display.BorderSizePixel = 0
Display.LayoutOrder = 1
Display.Size = UDim2.new(1, 0, 0, 30)
Display.ZIndex = 0

Display_Flex.FlexMode = "Grow"

------------------

DisplatScroll.Name = "DisplatScroll"
DisplatScroll.Parent = Display
DisplatScroll.Active = true
DisplatScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DisplatScroll.BackgroundTransparency = 1.000
DisplatScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
DisplatScroll.BorderSizePixel = 0
DisplatScroll.Size = UDim2.new(1, 0, 1, 0)
DisplatScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
DisplatScroll.ScrollBarThickness = 6
DisplatScroll.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
DisplatScroll.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
DisplatScroll.AutomaticCanvasSize = "Y"
DisplatScroll.ZIndex = 0

UIListLayout.Parent = DisplatScroll
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0,3)

------------------

Bar.Name = "Bar"
Bar.Parent = Chat
Bar.AnchorPoint = Vector2.new(0.5, 0)
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bar.BackgroundTransparency = 0.920
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.LayoutOrder = 3
Bar.Position = UDim2.new(0.5, 0, 0.448888898, 0)
Bar.Size = UDim2.new(0.980000019, 0, 0, 30)
Bar.AutomaticSize = "Y"
Bar.ZIndex = 0

Bar_Constraint.MaxSize = Vector2.new(math.huge, 90)

Corner_3.CornerRadius = UDim.new(0, 10)
Corner_3.Name = "Corner"
Corner_3.Parent = Bar
Bar_Stroke.ApplyStrokeMode = "Border"
Bar_Stroke.BorderStrokePosition = "Inner"
addThingTheming(Bar_Stroke, 3).Color = Color3.new(1, 1, 1)
Bar_Stroke.Transparency = .95

SendButton.Name = "SendButton"
SendButton.Parent = Bar
SendButton.AnchorPoint = Vector2.new(1, 0.5)
SendButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SendButton.BackgroundTransparency = 1.000
SendButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SendButton.BorderSizePixel = 0
SendButton.Position = UDim2.new(1, 0, 0.5, 0)
SendButton.Size = UDim2.new(0, 30, 0, 30)
SendButton.Image = getcustomasset(assetpaths.sendig)
SendButton.ZIndex = 0

ScrollingFrame.Parent = Bar
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, -30, 0, 30)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.AutomaticSize = "Y"
ScrollingFrame.ZIndex = 0

TextBox.Parent = ScrollingFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.ClipsDescendants = true
TextBox.Size = UDim2.new(1, 0, 0, 0)
TextBox.ClearTextOnFocus = false
TextBox.Font = font
TextBox.PlaceholderText = "Click here to start typing"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.AutomaticSize = "Y"
TextBox.ZIndex = 0

UIPadding.Parent = TextBox
UIPadding.PaddingBottom = UDim.new(0, 6)
UIPadding.PaddingLeft = UDim.new(0, 6)
UIPadding.PaddingRight = UDim.new(0, 6)
UIPadding.PaddingTop = UDim.new(0, 6)

function AddMessage(textmessage)
	local Message = Instance.new("Frame", DisplatScroll)
	local Message_Content = addThingTheming(Instance.new("TextLabel", Message), 5)
	local Message_Content_Padding = Instance.new("UIPadding", Message_Content)
	local Message_Corner = Instance.new("UICorner", Message)
	local Message_Border = addThingTheming(Instance.new("UIStroke", Message), 3)

	Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Message.BackgroundTransparency = 0.960
	Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Message.BorderSizePixel = 0
	Message.Size = UDim2.new(1, -13, 0, 25)
	Message.AutomaticSize = "Y"

	Message_Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Message_Content.BackgroundTransparency = 1.000
	Message_Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Message_Content.BorderSizePixel = 0
	Message_Content.Size = UDim2.new(1, 0, 0, 25)
	Message_Content.Font = font
	Message_Content.Text = textmessage
	Message_Content.TextColor3 = Color3.fromRGB(255, 255, 255)
	Message_Content.TextSize = 14.000
	Message_Content.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Message_Content.TextWrapped = true
	Message_Content.TextXAlignment = Enum.TextXAlignment.Left
	Message_Content.AutomaticSize = "Y"

	Message_Content_Padding.PaddingBottom = UDim.new(0, 5)
	Message_Content_Padding.PaddingLeft = UDim.new(0, 5)
	Message_Content_Padding.PaddingRight = UDim.new(0, 5)
	Message_Content_Padding.PaddingTop = UDim.new(0, 5)

	Message_Corner.CornerRadius = UDim.new(0, 4)

	Message_Border.BorderStrokePosition = "Inner"
	Message_Border.Transparency = .95
	Message_Border.Color = Color3.new(1, 1, 1)
	Message_Border.ApplyStrokeMode = "Border"
    return Message_Corner
end
function setTheme(color, labelColor, textColor, placeholderColor, themefont)
    color = color or Color3.fromRGB(unpack(settings.Theming.Main))
    labelColor = labelColor or Color3.fromRGB(unpack(settings.Theming.Text))
    textColor = textColor or Color3.fromRGB(unpack(settings.Theming.Text))
    placeholderColor = placeholderColor or Color3.fromRGB(unpack(settings.Theming.PlaceHolder))
    themefont  = themefont or Enum.Font[settings.Theming.Font]
	local h, s, v = color:ToHSV()
	if v*255 > 80 then
		CloseButton.Image = getcustomasset(assetpaths["close_"])
		ThemesButton.Image = getcustomasset(assetpaths["themesettings_"])
		SettingsButton.Image = getcustomasset(assetpaths["settings_"])
		UsersButton.Image = getcustomasset(assetpaths["plrlist_"])
		SendButton.Image = getcustomasset(assetpaths["sendig_"])
		for i, stroke in pairs(theming.strokesW) do
			stroke.Color = Color3.new()
		end
		for i, stroke in pairs(theming.strokesB) do
			stroke.Color = Color3.new(1, 1, 1)
		end
	else--- when the them is like darker color
		CloseButton.Image = getcustomasset(assetpaths["close"])
		ThemesButton.Image = getcustomasset(assetpaths["themesettings"])
		SettingsButton.Image = getcustomasset(assetpaths["settings"])
		UsersButton.Image = getcustomasset(assetpaths["plrlist"])
		SendButton.Image = getcustomasset(assetpaths["sendig"])
		for i, stroke in pairs(theming.strokesW) do
			stroke.Color = Color3.new(1, 1, 1)
		end
		for i, stroke in pairs(theming.strokesB) do
			stroke.Color = Color3.new()
		end
	end
	for _, label_ in pairs(theming.label) do
		label_.TextColor3 = labelColor
		label_.Font = themefont or font
	end
	for _, textbox in pairs(theming.textbox) do
		textbox.TextColor3 = textColor
		textbox.PlaceholderColor3 = placeholderColor
		textbox.Font = themefont or font
	end
	for _, bgs in pairs(theming.bgs) do
		bgs.BackgroundColor3 = color
	end
	for _, tops in pairs(theming.tops) do
		tops.BackgroundColor3 = Color3.fromHSV(h, s, v+(10/255))
	end
end
do
	local Sidebar = addThingTheming(Instance.new("Frame", Bone))
	local SizeConstraint = Instance.new("UISizeConstraint")
	local Padding = Instance.new("UIPadding")
	local ListLayout = Instance.new("UIListLayout")
	local Corner = Instance.new("UICorner")
	local Sidebar_Stroke = Instance.new("UIStroke", Sidebar)

	local TopbarFrame = addThingTheming(Instance.new("Frame"), "t")
	local TopbarInner = addThingTheming(Instance.new("Frame"), "t")
	local Corner_2 = Instance.new("UICorner")
	local Title = addThingTheming(Instance.new("TextLabel"), "l")
	local CloseButton = Instance.new("ImageButton") --- lowkey kinda lazy so i copyppasted this in but i realized that since i used the same names from the main thing it looks like its normal

	local Page = Instance.new("ScrollingFrame")
	local ListLayout_2 = Instance.new("UIListLayout")
	local Flex = Instance.new("UIFlexItem", Page)

	local Pagestub = Instance.new("Frame")
	local Pagestub1 = Instance.new("Frame")

	local screenSize = screenGui.AbsoluteSize
	local lowkeyTween = game:GetService("TweenService")
	local lowkeyInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
	local lowkeyCombo = function (x, p)
		return lowkeyTween:Create(x, lowkeyInfo, p)
	end
	local rightLean = lowkeyCombo(Sidebar, {
        Position = UDim2.new(1, 10, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5)
	})
	local nolean = lowkeyCombo(Sidebar, {
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5)
	})
	local leftLean = lowkeyCombo(Sidebar, {
        Position = UDim2.new(0, -10, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5)
	})

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = TopbarInner
	CloseButton.AnchorPoint = Vector2.new(1, 0)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(1, 0, 0, 0)
	CloseButton.Size = UDim2.new(0, 25, 0, 25)
	CloseButton.Image = getcustomasset(assetpaths.close)

	Sidebar.Name = "Sidebar"
	Sidebar.AnchorPoint = Vector2.new(0, 0.5)
	Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Sidebar.BorderSizePixel = 0
	Sidebar.Visible = false
	Sidebar.Size = UDim2.new(0, 150, 0.879999995, 0)

	SizeConstraint.Name = "SizeConstraint"
	SizeConstraint.Parent = Sidebar

	Padding.Name = "Padding"
	Padding.Parent = Sidebar
	Padding.PaddingTop = UDim.new(0, 15)

	ListLayout.Name = "ListLayout"
	ListLayout.Parent = Sidebar
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	Corner.CornerRadius = UDim.new(0, 10)
	Corner.Name = "Corner"
	Corner.Parent = Sidebar

	Sidebar_Stroke.ApplyStrokeMode = "Border"
	Sidebar_Stroke.BorderStrokePosition = "Outer"
	addThingTheming(Sidebar_Stroke, "sw").Color = Color3.new(1, 1, 1)
	Sidebar_Stroke.Transparency = .5
	----
	TopbarFrame.Name = "TopbarFrame"
	TopbarFrame.Parent = Sidebar
	TopbarFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TopbarFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarFrame.BorderSizePixel = 0
	TopbarFrame.Size = UDim2.new(1, 0, 0, 10)
	TopbarInner.Name = "TopbarInner"
	TopbarInner.Parent = TopbarFrame
	TopbarInner.AnchorPoint = Vector2.new(0, 1)
	TopbarInner.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TopbarInner.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarInner.BorderSizePixel = 0
	TopbarInner.Position = UDim2.new(0, 0, 1, 0)
	TopbarInner.Size = UDim2.new(1, 0, 0, 25)

	Corner_2.CornerRadius = UDim.new(0, 10)
	Corner_2.Name = "Corner"
	Corner_2.Parent = TopbarInner

	Title.Name = "Title"
	Title.Parent = TopbarInner
	Title.AnchorPoint = Vector2.new(0.5, 0)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.5, 0, 0, 0)
	Title.Size = UDim2.new(1, 0, 1, 0)
	Title.Font = font
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000

	Page.Name = "Page"
	Page.Parent = Sidebar
	Page.Active = true
	Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Page.BackgroundTransparency = 1.000
	Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Page.BorderSizePixel = 0
	Page.Size = UDim2.new(1, 0, 0, 100)
	Page.CanvasSize = UDim2.new(0, 0, 0, 0)
	Page.ScrollBarThickness = 6
	Page.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	Page.AutomaticCanvasSize = "Y"

	ListLayout_2.Name = "ListLayout"
	ListLayout_2.Parent = Page
	ListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout_2.Padding = UDim.new(0, 3)

	Flex.FlexMode = "Grow"

	Pagestub.Name = "Pagestub"
	Pagestub.Parent = Page
	Pagestub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Pagestub.BackgroundTransparency = 1.000
	Pagestub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Pagestub.BorderSizePixel = 0
	Pagestub.LayoutOrder = -999999
	Pagestub.Size = UDim2.new(0, 100, 0, 0)

	Pagestub1.Name = "Pagestub1"
	Pagestub1.Parent = Page
	Pagestub1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Pagestub1.BackgroundTransparency = 1.000
	Pagestub1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Pagestub1.BorderSizePixel = 0
	Pagestub1.LayoutOrder = 999999
	Pagestub1.Size = UDim2.new(0, 100, 0, 3)
    local current 
	local function lean()
	    local changeSides = screenSize.X*(1.5/3)
		local returnValue = {
		    [0] = nolean,
		    [1] = current or rightLean
		}
		if Bone.AbsolutePosition.X < changeSides then
			returnValue[1] = rightLean
            current = rightLean
		elseif Bone.AbsolutePosition.X > (screenSize.X - changeSides) then
			returnValue[1] = leftLean
            current = leftLean
		end
		return returnValue
	end
	CloseButton.MouseButton1Click:Connect(function () --- lowkey lazy to put the close function animation for this
        lean()[0]:Play()
        Sidebar.Visible = false
    end)
    function bigSidebar.page(title)
        local pager = {}
        pager.state = {}
        function pager.open()
            lean()[1]:Play()
            Sidebar.Visible = true
            if Title.Text == title then
                -- so it doesnt remove the current page
                return
            end
            Title.Text = title
            for i, v in Page:GetChildren() do
                if v:IsA("Frame") and v.Name:match("Pagestub") == nil then
                    v.Parent = nil
                end
            end
            for i, v in pager.state do
                v.Parent = Page
            end
        end
        function pager.button(tText, btnText, btnCallback)
            local LabelButton = Instance.new("Frame", Page)
            table.insert(pager.state, LabelButton)
            local Corner = Instance.new("UICorner")
            local Padding = Instance.new("UIPadding")
            local ListLayout = Instance.new("UIListLayout")
            local Stroke = Instance.new("UIStroke", LabelButton)
            local Label = Instance.new("TextLabel")
            local TextButton = Instance.new("TextButton")
            local Button_Stroke = Instance.new("UIStroke", TextButton)
            local Padding_2 = Instance.new("UIPadding")
            local Corner_2 = Instance.new("UICorner")

            LabelButton.Name = "LabelButton"
            LabelButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelButton.BackgroundTransparency = 0.950
            LabelButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LabelButton.BorderSizePixel = 0
            LabelButton.Size = UDim2.new(0.970000029, 0, 0, 0)
            LabelButton.AutomaticSize = "Y"

            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Name = "Corner"
            Corner.Parent = LabelButton

            Padding.Name = "Padding"
            Padding.Parent = LabelButton
            Padding.PaddingBottom = UDim.new(0, 5)
            Padding.PaddingLeft = UDim.new(0, 5)
            Padding.PaddingRight = UDim.new(0, 5)
            Padding.PaddingTop = UDim.new(0, 5)

            ListLayout.Name = "ListLayout"
            ListLayout.Parent = LabelButton
            ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ListLayout.Padding = UDim.new(0, 5)

            Stroke.BorderStrokePosition = "Inner"
            Stroke.Transparency = .95
            Stroke.Color = Color3.new(1, 1, 1)
            Stroke.ApplyStrokeMode = "Border"

            Label.Name = "Label"
            Label.Parent = LabelButton
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Size = UDim2.new(1, 0, 0, 0)
            Label.Font = font
            Label.Text = tText or "A label with a button"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000
            Label.TextWrapped = true
            Label.AutomaticSize = "Y"

            TextButton.Parent = LabelButton
            TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.BackgroundTransparency = 0.850
            TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextButton.BorderSizePixel = 0
            TextButton.Size = UDim2.new(1, 0, 0, 0)
            TextButton.Font = font
            TextButton.Text = btnText or "Normal Button"
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextSize = 14.000
            TextButton.AutomaticSize = "XY"
            TextButton.MouseButton1Click:Connect(function ()
                btnCallback()
            end)

            Padding_2.Name = "Padding"
            Padding_2.Parent = TextButton
            Padding_2.PaddingBottom = UDim.new(0, 5)
            Padding_2.PaddingLeft = UDim.new(0, 5)
            Padding_2.PaddingRight = UDim.new(0, 5)
            Padding_2.PaddingTop = UDim.new(0, 5)

            Button_Stroke.BorderStrokePosition = "Inner"
            Button_Stroke.Transparency = .8
            Button_Stroke.Color = Color3.new(0, 0, 0)
            Button_Stroke.ApplyStrokeMode = "Border"

            Corner_2.CornerRadius = UDim.new(0, 5)
            Corner_2.Name = "Corner"
            Corner_2.Parent = TextButton
        end
        function pager.splitter(lText)
            local Splitter = Instance.new("Frame", Page)
            table.insert(pager.state, Splitter)
            local Corner = Instance.new("UICorner")
            local Padding = Instance.new("UIPadding")
            local ListLayout = Instance.new("UIListLayout")
            local Stroke = Instance.new("UIStroke", Splitter)
            local Label = Instance.new("TextLabel")
            local Line = Instance.new("Frame")
            local Flex = Instance.new("UIFlexItem", Line)
            local Line_Corner = Instance.new("UICorner", Line)

            Splitter.Name = "Splitter"
            Splitter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Splitter.BackgroundTransparency = 0.950
            Splitter.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Splitter.BorderSizePixel = 0
            Splitter.AutomaticSize = "Y"
            Splitter.Size = UDim2.new(0.970000029, 0, 0, 0)

            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Name = "Corner"
            Corner.Parent = Splitter

            Padding.Name = "Padding"
            Padding.Parent = Splitter
            Padding.PaddingBottom = UDim.new(0, 5)
            Padding.PaddingLeft = UDim.new(0, 5)
            Padding.PaddingRight = UDim.new(0, 5)
            Padding.PaddingTop = UDim.new(0, 5)

            ListLayout.Name = "ListLayout"
            ListLayout.Parent = Splitter
            ListLayout.FillDirection = Enum.FillDirection.Horizontal
            ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            ListLayout.Padding = UDim.new(0, 5)

            Stroke.BorderStrokePosition = "Inner"
            Stroke.Transparency = .95
            Stroke.Color = Color3.new(1, 1, 1)
            Stroke.ApplyStrokeMode = "Border"

            Label.Name = "Label"
            Label.Parent = Splitter
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.LayoutOrder = 1
            Label.Font = font
            Label.Text = lText or "Splitter"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000
            Label.TextWrapped = true
            Label.AutomaticSize = "XY"

            Line.Name = "Line"
            Line.Parent = Splitter
            Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Line.BackgroundTransparency = 0.750
            Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Line.BorderSizePixel = 0
            Line.Size = UDim2.new(0, 20, 0, 4)

            Flex.FlexMode = Enum.UIFlexMode.Fill

            Line_Corner.CornerRadius = UDim.new(0, 5)
            Line_Corner.Name = "Corner"
        end
        function pager.toggle(lText, cState, toggleCallback)
            local LabelToggle = Instance.new("Frame", Page)
            table.insert(pager.state, LabelToggle)
            local Corner = Instance.new("UICorner")
            local Padding = Instance.new("UIPadding")
            local ListLayout = Instance.new("UIListLayout")
            local LabelToggle_Stroke = Instance.new("UIStroke", LabelToggle)
            local Label = Instance.new("TextLabel")
            local ToggleInteraction = Instance.new("ImageButton")
            local Corner_2 = Instance.new("UICorner")
            local ToggleInteraction_Stroke = Instance.new("UIStroke", ToggleInteraction)
            local Padding_2 = Instance.new("UIPadding")
            local SwitchColor = Instance.new("Frame")
            local Corner_3 = Instance.new("UICorner")
            local SwitchColor_Stroke = Instance.new("UIStroke", SwitchColor)
            local disabledState = lowkeyCombo(SwitchColor, {
                Position = UDim2.new(),
                AnchorPoint = Vector2.new(),
                BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            })
            local enabledState = lowkeyCombo(SwitchColor, {
                Position = UDim2.new(1, 0, 0, 0),
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            })
            
            local togglingshit = function()
                cState = not cState
                if cState then
                    disabledState:Pause()
                    enabledState:Play()
                else
                    enabledState:Pause()
                    disabledState:Play()
                end
                toggleCallback(cState)
            end

            LabelToggle.Name = "LabelToggle"
            LabelToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelToggle.BackgroundTransparency = 0.950
            LabelToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LabelToggle.BorderSizePixel = 0
            LabelToggle.Size = UDim2.new(0.970000029, 0, 0, 0)
            LabelToggle.AutomaticSize = "Y"

            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Name = "Corner"
            Corner.Parent = LabelToggle

            Padding.Name = "Padding"
            Padding.Parent = LabelToggle
            Padding.PaddingBottom = UDim.new(0, 5)
            Padding.PaddingLeft = UDim.new(0, 5)
            Padding.PaddingRight = UDim.new(0, 5)
            Padding.PaddingTop = UDim.new(0, 5)

            ListLayout.Name = "ListLayout"
            ListLayout.Parent = LabelToggle
            ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ListLayout.Padding = UDim.new(0, 5)

            Label.Name = "Label"
            Label.Parent = LabelToggle
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Size = UDim2.new(1, 0, 0, 0)
            Label.Font = font
            Label.Text = lText or "A label with a toggle"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000
            Label.TextWrapped = true
            Label.AutomaticSize = "Y"

            LabelToggle_Stroke.BorderStrokePosition = "Inner"
            LabelToggle_Stroke.Transparency = .95
            LabelToggle_Stroke.Color = Color3.new(1, 1, 1)
            LabelToggle_Stroke.ApplyStrokeMode = "Border"

            ToggleInteraction.Name = "ToggleInteraction"
            ToggleInteraction.Parent = LabelToggle
            ToggleInteraction.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleInteraction.BackgroundTransparency = 0.900
            ToggleInteraction.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleInteraction.BorderSizePixel = 0
            ToggleInteraction.Size = UDim2.new(0.600000024, 0, 0, 0)
            ToggleInteraction.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            ToggleInteraction.ImageTransparency = 1.000
            ToggleInteraction.AutomaticSize = "Y"
            ToggleInteraction.MouseButton1Click:Connect(togglingshit)
            
            Corner_2.CornerRadius = UDim.new(0, 5)
            Corner_2.Name = "Corner"
            Corner_2.Parent = ToggleInteraction

            ToggleInteraction_Stroke.ApplyStrokeMode = "Border"
            ToggleInteraction_Stroke.BorderStrokePosition = "Inner"
            ToggleInteraction_Stroke.Color = Color3.new(0, 0, 0)
            ToggleInteraction_Stroke.Transparency = .8

            SwitchColor.Name = "SwitchColor"
            SwitchColor.Parent = ToggleInteraction
            SwitchColor.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            SwitchColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SwitchColor.BorderSizePixel = 0
            SwitchColor.Size = UDim2.new(0.5, 0, 0, 15)


            Corner_3.CornerRadius = UDim.new(0, 5)
            Corner_3.Name = "Corner"
            Corner_3.Parent = SwitchColor

            SwitchColor_Stroke.BorderStrokePosition = "Inner"
            SwitchColor_Stroke.Transparency = .9
            SwitchColor_Stroke.Color = Color3.new(1, 1, 1)
            SwitchColor_Stroke.ApplyStrokeMode = "Border"

            Padding_2.Name = "Padding"
            Padding_2.Parent = ToggleInteraction
            Padding_2.PaddingBottom = UDim.new(0, 3)
            Padding_2.PaddingLeft = UDim.new(0, 3)
            Padding_2.PaddingRight = UDim.new(0, 3)
            Padding_2.PaddingTop = UDim.new(0, 3)
            if cState then
                disabledState:Pause()
                enabledState:Play()
                toggleCallback(cState)
            end
        end
        function pager.textbox(text, hints, values, boxcallback)
            local LabelTextbox = Instance.new("Frame", Page)
            table.insert(pager.state, LabelTextbox)
            local Corner = Instance.new("UICorner")
            local Padding = Instance.new("UIPadding")
            local ListLayout = Instance.new("UIListLayout")
            local LabelTextbox_Stroke = Instance.new("UIStroke", LabelTextbox)
            local Label = Instance.new("TextLabel")
            local Boxes = Instance.new("Frame")
            local ListLayout_2 = Instance.new("UIListLayout")
            local Box1 = Instance.new("TextBox")
            local Box2,Box3 
            local Corner_2 = Instance.new("UICorner")
            local Box1_Stroke = Instance.new("UIStroke", Box1)
            local Box1_Flex = Instance.new("UIFlexItem", Box1)

            LabelTextbox.Name = "LabelTextbox"..#pager.state
            LabelTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelTextbox.BackgroundTransparency = 0.950
            LabelTextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LabelTextbox.BorderSizePixel = 0
            LabelTextbox.Size = UDim2.new(0.970000029, 0, 0, 0)
            LabelTextbox.AutomaticSize = "Y"

            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Name = "Corner"
            Corner.Parent = LabelTextbox

            Padding.Name = "Padding"
            Padding.Parent = LabelTextbox
            Padding.PaddingBottom = UDim.new(0, 5)
            Padding.PaddingLeft = UDim.new(0, 5)
            Padding.PaddingRight = UDim.new(0, 5)
            Padding.PaddingTop = UDim.new(0, 5)

            ListLayout.Name = "ListLayout"
            ListLayout.Parent = LabelTextbox
            ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ListLayout.Padding = UDim.new(0, 5)
            ListLayout.Wraps = true

            LabelTextbox_Stroke.ApplyStrokeMode = "Border"
            LabelTextbox_Stroke.BorderStrokePosition = "Inner"
            LabelTextbox_Stroke.Color = Color3.new(1, 1, 1)
            LabelTextbox_Stroke.Transparency = .95

            Label.Name = "Label"
            Label.Parent = LabelTextbox
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Size = UDim2.new(1, 0, 0, 0)
            Label.Font = font
            Label.Text = text or "A label with a textbox"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000
            Label.TextWrapped = true
            Label.AutomaticSize = "Y"
            ------
            Boxes.Name = "Boxes"
            Boxes.Parent = LabelTextbox
            Boxes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Boxes.BackgroundTransparency = 1.000
            Boxes.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Boxes.BorderSizePixel = 0
            Boxes.Size = UDim2.new(1, 0, 0, 20)

            ListLayout_2.Name = "ListLayout"
            ListLayout_2.Parent = Boxes
            ListLayout_2.FillDirection = Enum.FillDirection.Horizontal
            ListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            ListLayout_2.Padding = UDim.new(0, 3)
            -----
            local function changed(theonethatchanged,x)
                if type(hints) == "table" and type(values) == "table" then
                    if #hints == 2 then
                        boxcallback(Box1.Text,Box2.Text)
                    elseif #hints > 2 then
                        boxcallback(Box1.Text,Box2.Text,Box3.Text)
                    end
                else
                    boxcallback(Box1.Text)
                end
            end
            Box1.Name = "Box1"
            Box1.Parent = Boxes
            Box1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Box1.BackgroundTransparency = 0.900
            Box1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Box1.BorderSizePixel = 0
            Box1.Size = UDim2.new(0, 0, 1, 0)
            Box1.Font = font
            if type(hints) == "table" then
                Box1.PlaceholderText = hints[1] or "X"
                Box1.Text = values[1] or ""
            else
                Box1.PlaceholderText = hints or "X"
                Box1.Text = values or ""
            end
            Box1.TextColor3 = Color3.fromRGB(255, 255, 255)
            Box1.TextSize = 14.000
            Box1.Changed:Connect(function(property)
                if property == "Text" then
                    if type(boxcallback) == "table" then
                        boxcallback[1](Box1.Text)
                    else
                        changed(Box1.PlaceholderText,Box1.Text)
                    end
                end
            end)

            Corner_2.CornerRadius = UDim.new(0, 3)
            Corner_2.Name = "Corner"
            Corner_2.Parent = Box1

            Box1_Stroke.ApplyStrokeMode = "Border"
            Box1_Stroke.BorderStrokePosition = "Inner"
            Box1_Stroke.Color = Color3.new(0, 0, 0)
            Box1_Stroke.Transparency = .95

            Box1_Flex.FlexMode = "Grow"

            if type(hints) == "table" then
                if #hints >= 2 then
                    Box2 = Instance.new("TextBox")
                    local Corner_3 = Instance.new("UICorner")
                    local Box2_Stroke = Instance.new("UIStroke", Box2)
                    local Box2_Flex = Instance.new("UIFlexItem", Box2)

                    Box2.Name = "Box2"
                    Box2.Parent = Boxes
                    Box2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Box2.BackgroundTransparency = 0.900
                    Box2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Box2.BorderSizePixel = 0
                    Box2.Size = UDim2.new(0, 0, 1, 0)
                    Box2.Font = font
                    Box2.PlaceholderText = hints[2] or "Y"
                    Box2.Text = values[2] or ""
                    Box2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Box2.TextSize = 14.000
                    Box2.Changed:Connect(function(property)
                        if property == "Text" then
                            if type(boxcallback) == "table" then
                                boxcallback[1](Box1.Text)
                            else
                                changed(Box2.PlaceholderText,Box2.Text)
                            end
                        end
                    end)

                    Corner_3.CornerRadius = UDim.new(0, 3)
                    Corner_3.Name = "Corner"
                    Corner_3.Parent = Box2

                    Box2_Stroke.ApplyStrokeMode = "Border"
                    Box2_Stroke.BorderStrokePosition = "Inner"
                    Box2_Stroke.Color = Color3.new(0, 0, 0)
                    Box2_Stroke.Transparency = .95

                    Box2_Flex.FlexMode = "Grow"
                end
                if #hints > 2 then
                    Box3 = Instance.new("TextBox")
                    local Corner_4 = Instance.new("UICorner")
                    local Box3_Stroke = Instance.new("UIStroke", Box3)
                    local Box3_Flex = Instance.new("UIFlexItem", Box3)

                    Box3.Name = "Box3"
                    Box3.Parent = Boxes
                    Box3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Box3.BackgroundTransparency = 0.900
                    Box3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Box3.BorderSizePixel = 0
                    Box3.Size = UDim2.new(0, 0, 1, 0)
                    Box3.Font = font
                    Box3.PlaceholderText = hints[3] or "Z"
                    Box3.Text = values[3] or ""
                    Box3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Box3.TextSize = 14.000
                    Box3.Changed:Connect(function(property)
                        if property == "Text" then
                            if type(boxcallback) == "table" then
                                boxcallback[1](Box1.Text)
                            else
                                changed(Box3.PlaceholderText,Box3.Text)
                            end
                        end
                    end)

                    Corner_4.CornerRadius = UDim.new(0, 3)
                    Corner_4.Name = "Corner"
                    Corner_4.Parent = Box3

                    Box3_Stroke.ApplyStrokeMode = "Border"
                    Box3_Stroke.BorderStrokePosition = "Inner"
                    Box3_Stroke.Color = Color3.new(0, 0, 0)
                    Box3_Stroke.Transparency = .95

                    Box3_Flex.FlexMode = "Grow"
                end
            end
        end
        return pager
    end
end

return bigSidebar,{SettingsButton,ThemesButton,UsersButton,SendButton,TextBox},setTheme,AddMessage,settings
