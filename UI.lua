local screenGui = Instance.new("ScreenGui",gethui())

local Bone = Instance.new("Frame")
local SizeConstraint = Instance.new("UISizeConstraint")

Bone.Name = "Bone"
Bone.AnchorPoint = Vector2.new(0.5, 0)
Bone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bone.BackgroundTransparency = 1.000
Bone.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bone.BorderSizePixel = 0
Bone.Position = UDim2.new(0.419999987, 0, 0.263653487, 0)
Bone.Size = UDim2.new(0.38499999, 0, 0.5, 0)

SizeConstraint.Name = "SizeConstraint"
SizeConstraint.Parent = Bone
SizeConstraint.MaxSize = Vector2.new(480, 320)
SizeConstraint.MinSize = Vector2.new(300, 200)