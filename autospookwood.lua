
if game.PlaceId == 13822889 then
    
if not game:IsLoaded() then game.Loaded:Wait() end
local function createGUI(description, button1Text, button2Text)
    
SpookWoodFinder = Instance.new("ScreenGui")
MainFrame = Instance.new("Frame")
Title = Instance.new("TextLabel")
UICorner = Instance.new("UICorner")
SpookWoodDisplay = Instance.new("Frame")
UICorner_2 = Instance.new("UICorner")
Description = Instance.new("TextLabel")
Button1 = Instance.new("TextButton")
UICorner_3 = Instance.new("UICorner")
Button2 = Instance.new("TextButton")
UICorner_4 = Instance.new("UICorner")


SpookWoodFinder.Name = "SpookWoodFinder"
SpookWoodFinder.Parent = game.CoreGui
SpookWoodFinder.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = SpookWoodFinder
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.338099509, 0, 0.370370358, 0)
MainFrame.Size = UDim2.new(0, 445, 0, 238)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.294150651, 0, 0.0688075721, 0)
Title.Size = UDim2.new(0, 183, 0, 38)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Spook Wood Finder"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 2)
UICorner.Parent = MainFrame

SpookWoodDisplay.Name = "SpookWoodDisplay"
SpookWoodDisplay.Parent = MainFrame
SpookWoodDisplay.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
SpookWoodDisplay.Position = UDim2.new(0.233707845, 0, 0.286377728, 0)
SpookWoodDisplay.Size = UDim2.new(0, 238, 0, 100)

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = SpookWoodDisplay

Description.Name = "Description"
Description.Parent = SpookWoodDisplay
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.BorderSizePixel = 0
Description.Position = UDim2.new(0.109276697, 0, 0.308807552, 0)
Description.Size = UDim2.new(0, 183, 0, 38)
Description.Font = Enum.Font.SourceSansBold
Description.Text = description
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextScaled = true
Description.TextSize = 14.000
Description.TextWrapped = true

Button1.Name = "Button1"
Button1.Parent = MainFrame
Button1.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
Button1.Position = UDim2.new(0.113090873, 0, 0.764725626, 0)
Button1.Size = UDim2.new(0, 137, 0, 39)
Button1.Font = Enum.Font.SourceSansBold
Button1.Text = button1Text
Button1.TextColor3 = Color3.fromRGB(0, 0, 0)
Button1.TextSize = 25.000
Button1.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 2)
UICorner_3.Parent = Button1

Button2.Name = "Button2"
Button2.Parent = MainFrame
Button2.BackgroundColor3 = Color3.fromRGB(162, 162, 162)
Button2.Position = UDim2.new(0.578259408, 0, 0.764725626, 0)
Button2.Size = UDim2.new(0, 137, 0, 39)
Button2.Font = Enum.Font.SourceSansBold
Button2.Text = button2Text
Button2.TextColor3 = Color3.fromRGB(0, 0, 0)
Button2.TextSize = 25.000
Button2.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 2)
UICorner_4.Parent = Button2

local Drag = MainFrame
gsCoreGui = game:GetService("CoreGui")
gsTween = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	local function update(input)
		local delta = input.Position - dragStart
		local dragTime = 0.04
		local SmoothDrag = {}
		SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
		dragSmoothFunction:Play()
	end
	Drag.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Drag.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	Drag.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging and Drag.Size then
			update(input)
		end
	end)


end


local Tree         

for i,v in pairs(workspace:GetChildren()) do              
    if v.Name == "TreeRegion" then              
        for l, wood in pairs(v:GetChildren()) do            
        if wood:FindFirstChild("TreeClass") then                  
			if wood.TreeClass.Value == "Spooky" then              
                Tree = wood             
				break
			end
		end
	end
	end
end

if Tree then
    createGUI(tostring(Tree.TreeClass.Value).. " Wood Found", "New Server", "Teleport")
Button1.MouseButton1Down:Connect(function()
game:GetService("TeleportService"):Teleport(4019937000)
end)

Button2.MouseButton1Down:Connect(function()
local hum = game.Players.LocalPlayer.Character.HumanoidRootPart
hum.CFrame = CFrame.new(Tree.WoodSection.Position)
end)
else
    createGUI("No Wood Found", "Close", "New Server")
    Button1.MouseButton1Down:Connect(function()
SpookWoodFinder:Destroy()
end)

Button2.MouseButton1Down:Connect(function()
game:GetService("TeleportService"):Teleport(4019937000)
end)
task.wait(delay)
game:GetService("TeleportService"):Teleport(4019937000)
	
end
end
