-- test ui
local gui = Instance.new("ScreenGui")
gui.Name = "femrkit"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 210)
frame.Position = UDim2.new(0.5, -190, 0.5, -105)
frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
frame.BorderSizePixel = 0
frame.Draggable = true
frame.Parent = gui

pcall(function()
    gui.Parent = game:GetService("CoreGui")
end)

if not gui.Parent then
    local player = game:GetService("Players").LocalPlayer
    if player then
        gui.Parent = player:WaitForChild("PlayerGui")
    end
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 25)
title.BackgroundColor3 = Color3.fromRGB(45, 110, 55)
title.BorderSizePixel = 0
title.Text = "femrkit"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -10, 0, 135)
textBox.Position = UDim2.new(0, 5, 0, 30)
textBox.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
textBox.BorderSizePixel = 0
textBox.TextColor3 = Color3.fromRGB(220, 220, 220)
textBox.TextWrapped = true
textBox.MultiLine = true
textBox.ClearTextOnFocus = false
textBox.Font = Enum.Font.Code
textBox.TextSize = 14
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.Text = 'print("hello from femrkit")'
textBox.Parent = frame

local executeBtn = Instance.new("TextButton")
executeBtn.Size = UDim2.new(1, -10, 0, 30)
executeBtn.Position = UDim2.new(0, 5, 1, -35)
executeBtn.BackgroundColor3 = Color3.fromRGB(45, 130, 55)
executeBtn.BorderSizePixel = 0
executeBtn.Text = "Execute"
executeBtn.TextColor3 = Color3.new(1, 1, 1)
executeBtn.Font = Enum.Font.SourceSansBold
executeBtn.TextSize = 17
executeBtn.Parent = frame

executeBtn.MouseButton1Click:Connect(function()
    local source = textBox.Text

    if not source or #source == 0 then
        return
    end

    if typeof(femr_loadstring) ~= "function" then
        return
    end

    local ok, chunk = pcall(femr_loadstring, source)

    if ok and typeof(chunk) == "function" then
        pcall(chunk)
    end
end)
