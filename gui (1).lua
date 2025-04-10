local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "MainGUI"

local function addBorder(frame)
	local stroke = Instance.new("UIStroke", frame)
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(255, 255, 255)
end

-- BẢNG 1: Nhập JobId và chuyển server
local jobFrame = Instance.new("Frame", gui)
jobFrame.Size = UDim2.new(0.25, 0, 0.2, 0)
jobFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
jobFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
jobFrame.BackgroundTransparency = 0.2
jobFrame.Active = true
jobFrame.Draggable = true
addBorder(jobFrame)

local title = Instance.new("TextLabel", jobFrame)
title.Size = UDim2.new(1, 0, 0.3, 0)
title.Text = "Enter JobId"
title.BackgroundTransparency = 1
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold

local jobBox = Instance.new("TextBox", jobFrame)
jobBox.Size = UDim2.new(0.9, 0, 0.3, 0)
jobBox.Position = UDim2.new(0.05, 0, 0.35, 0)
jobBox.PlaceholderText = "JobId..."
jobBox.Font = Enum.Font.Gotham
jobBox.TextScaled = true
jobBox.TextColor3 = Color3.new(0, 0, 0)
jobBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", jobBox).CornerRadius = UDim.new(1, 0)

local button = Instance.new("TextButton", jobFrame)
button.Size = UDim2.new(0.9, 0, 0.25, 0)
button.Position = UDim2.new(0.05, 0, 0.7, 0)
button.Text = "Switch Server"
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Instance.new("UICorner", button).CornerRadius = UDim.new(1, 0)

button.MouseButton1Click:Connect(function()
	if jobBox.Text ~= "" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobBox.Text, player)
	end
end)

-- BẢNG 2: Player Name và Alias
local infoFrame = Instance.new("Frame", gui)
infoFrame.Size = UDim2.new(0.25, 0, 0.15, 0)
infoFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
infoFrame.BackgroundTransparency = 0.2
infoFrame.Active = true
infoFrame.Draggable = true
addBorder(infoFrame)

local nameLabel = Instance.new("TextLabel", infoFrame)
nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
nameLabel.Text = "Player: " .. player.Name:sub(1, 3) .. string.rep("*", #player.Name - 3)
nameLabel.BackgroundTransparency = 1
nameLabel.TextScaled = true
nameLabel.TextColor3 = Color3.fromRGB(255, 193, 37)
nameLabel.Font = Enum.Font.GothamBold

local aliasLabel = Instance.new("TextLabel", infoFrame)
aliasLabel.Size = UDim2.new(1, 0, 0.5, 0)
aliasLabel.Position = UDim2.new(0, 0, 0.5, 0)
aliasLabel.Text = "Alias: Enter Alias"
aliasLabel.BackgroundTransparency = 1
aliasLabel.TextScaled = true
aliasLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
aliasLabel.Font = Enum.Font.Gotham

local aliasInput = Instance.new("TextBox", infoFrame)
aliasInput.Size = aliasLabel.Size
aliasInput.Position = aliasLabel.Position
aliasInput.BackgroundTransparency = 1
aliasInput.TextColor3 = Color3.new(1, 1, 1)
aliasInput.PlaceholderText = "Enter Alias..."
aliasInput.Font = Enum.Font.Gotham
aliasInput.TextScaled = true
aliasInput.ClearTextOnFocus = false
aliasInput.Text = ""

aliasInput.FocusLost:Connect(function(enterPressed)
	if enterPressed and aliasInput.Text ~= "" then
		aliasLabel.Text = "Alias: " .. aliasInput.Text
		aliasInput.Visible = false
	end
end)
