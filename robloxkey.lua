local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local keys = {
    "DKsimga_8m2od92j0s",
    "DKsimga_j82n0h3is",
    "DKsimga_f4so3jd92d",
    "DKsimga_72ns94kd0s",
    "DKsimga_hdi38djfio"
}

local function isValidKey(inputKey)
    for _, key in ipairs(keys) do
        if inputKey == key then
            return true
        end
    end
    return false
end

local function createNotification(text, textColor)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = LocalPlayer.PlayerGui
    screenGui.Name = "NotificationGui"

    local notification = Instance.new("TextLabel")
    notification.Parent = screenGui
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(1, -310, 1, -60)
    notification.Text = text
    notification.TextColor3 = textColor
    notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notification.BorderSizePixel = 2
    notification.BorderColor3 = Color3.fromRGB(255, 255, 255)
    notification.TextScaled = true
    notification.Font = Enum.Font.SourceSansBold

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = notification

    task.delay(3, function()
        screenGui:Destroy()
    end)
end

local function createKeyInputGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = LocalPlayer.PlayerGui
    screenGui.Name = "DKsigma"

    local frame = Instance.new("Frame")
    frame.Parent = screenGui
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    frame.BackgroundTransparency = 0.1

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Parent = frame
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "DKsigma"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 28

    local textBox = Instance.new("TextBox")
    textBox.Parent = frame
    textBox.Size = UDim2.new(1, -20, 0, 50)
    textBox.Position = UDim2.new(0, 10, 0, 50)
    textBox.PlaceholderText = "Nhập key của bạn"
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local cornerTextBox = Instance.new("UICorner")
    cornerTextBox.CornerRadius = UDim.new(0, 10)
    cornerTextBox.Parent = textBox

    local submitButton = Instance.new("TextButton")
    submitButton.Parent = frame
    submitButton.Size = UDim2.new(1, -20, 0, 40)
    submitButton.Position = UDim2.new(0, 10, 0, 110)
    submitButton.Text = "Xác nhận"
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

    local cornerSubmit = Instance.new("UICorner")
    cornerSubmit.CornerRadius = UDim.new(0, 10)
    cornerSubmit.Parent = submitButton

    local discordButton = Instance.new("TextButton")
    discordButton.Parent = frame
    discordButton.Size = UDim2.new(1, -20, 0, 30)
    discordButton.Position = UDim2.new(0, 10, 0, 160)
    discordButton.Text = "Join Discord to get key"
    discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    discordButton.BackgroundColor3 = Color3.fromRGB(70, 70, 200)

    local cornerDiscord = Instance.new("UICorner")
    cornerDiscord.CornerRadius = UDim.new(0, 10)
    cornerDiscord.Parent = discordButton

    local githubButton = Instance.new("TextButton")
    githubButton.Parent = frame
    githubButton.Size = UDim2.new(1, -20, 0, 30)
    githubButton.Position = UDim2.new(0, 10, 0, 200)
    githubButton.Text = "Copy Github link"
    githubButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    githubButton.BackgroundColor3 = Color3.fromRGB(100, 100, 250)

    local cornerGithub = Instance.new("UICorner")
    cornerGithub.CornerRadius = UDim.new(0, 10)
    cornerGithub.Parent = githubButton

    submitButton.MouseButton1Click:Connect(function()
        local inputKey = textBox.Text
        if isValidKey(inputKey) then
            createNotification("Key hợp lệ!", Color3.fromRGB(0, 255, 0))
            screenGui:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DucDuy-2013/blue-lock/refs/heads/main/roblox.lua"))()
        else
            createNotification("Key không hợp lệ!", Color3.fromRGB(255, 0, 0))
        end
    end)

    discordButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/your-invite-link")
        createNotification("Copied Discord link!", Color3.fromRGB(0, 150, 255))
    end)

    githubButton.MouseButton1Click:Connect(function()
        setclipboard("https://github.com/DucDuy-2013/roblox/blob/main/key")
        createNotification("Copied Github link!", Color3.fromRGB(0, 150, 255))
    end)
end

createKeyInputGui()

