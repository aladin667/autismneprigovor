local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "niggasploit.gg"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local theme = {
    Window1 = Color3.fromRGB(35, 35, 45),
    Window2 = Color3.fromRGB(25, 25, 35),
    Stroke = Color3.fromRGB(60, 60, 80),
    Primary = Color3.fromRGB(50, 60, 70),
    Secondary = Color3.fromRGB(80, 90, 100),
    ControlGradient1 = Color3.fromRGB(255, 255, 255),
    ControlGradient2 = Color3.fromRGB(200, 200, 200),
    TextPrimary = Color3.fromRGB(220, 220, 255),
    TextStroke = Color3.fromRGB(0, 0, 0),
    Inset1 = Color3.fromRGB(40, 40, 40),
    Inset2 = Color3.fromRGB(35, 35, 35),
    Button1 = Color3.fromRGB(50, 60, 70),
}

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://2514375878" 
clickSound.Volume = 0.5
clickSound.Parent = SoundService
wait(0.1) 

local minimizeSound = Instance.new("Sound")
minimizeSound.SoundId = "rbxassetid://15675037413" 
minimizeSound.Volume = 0.5
minimizeSound.Parent = SoundService
wait(0.1) 

local genericClickSound = Instance.new("Sound")
genericClickSound.SoundId = "rbxassetid://452267918" 
genericClickSound.Volume = 0.4
genericClickSound.Parent = SoundService
wait(0.1)

local openSound = Instance.new("Sound")
openSound.SoundId = "rbxassetid://6410047369" 
openSound.Volume = 0.5
openSound.Parent = SoundService
wait(0.1) 

local mainFrame = Instance.new("Frame")
mainFrame.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 0 
mainFrame.Name = "#main_frame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, -175)
mainFrame.Size = UDim2.fromOffset(500, 350)
mainFrame.Visible = true
mainFrame.ZIndex = 5 
mainFrame.Parent = screenGui

local shadow = Instance.new('ImageLabel') do 
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundTransparency = 1
    shadow.BorderSizePixel = 0 
    shadow.Image = 'rbxassetid://7331400934'
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 5)
    shadow.Name = '#shadow'
    shadow.Position = UDim2.fromScale(0.5, 0.5)
    shadow.ScaleType = 'Slice'
    shadow.Size = UDim2.new(1, 50, 1, 55)
    shadow.SliceCenter = Rect.new(40, 40, 260, 260)
    shadow.SliceScale = 1
    shadow.ZIndex = 4
    shadow.Parent = mainFrame
end

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 60, 80)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 40, 60))   
}
gradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.5),
    NumberSequenceKeypoint.new(1, 0.5)
}
gradient.Rotation = 90
gradient.Parent = mainFrame

local scale = Instance.new("UIScale")
scale.Scale = 1
scale.Name = "#scale"
scale.Parent = mainFrame

local stroke = Instance.new("UIStroke") 
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Color = theme.Stroke
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = 1
stroke.Name = "#stroke"
stroke.Parent = mainFrame

local trimLine = Instance.new("Frame")
trimLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trimLine.BackgroundTransparency = 0
trimLine.BorderSizePixel = 0
trimLine.Name = "#trim"
trimLine.Position = UDim2.fromOffset(0, -1)
trimLine.Size = UDim2.new(1, 0, 0, 1)
trimLine.ZIndex = 6
trimLine.Parent = mainFrame

local gradientTrim = Instance.new("UIGradient")
gradientTrim.Color = ColorSequence.new(theme.Primary, theme.Secondary)
gradientTrim.Enabled = true
gradientTrim.Name = "#gradient"
gradientTrim.Rotation = 0
gradientTrim.Parent = trimLine

local titleBar = Instance.new("Frame")
titleBar.Active = true
titleBar.BackgroundColor3 = theme.Window1
titleBar.BackgroundTransparency = 0
titleBar.BorderSizePixel = 0 
titleBar.Name = "#title-bar"
titleBar.Size = UDim2.new(1, 0, 0, 26)
titleBar.ZIndex = 7
titleBar.Parent = mainFrame

local titleBarStroke = Instance.new("UIStroke")
titleBarStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
titleBarStroke.Color = theme.Stroke
titleBarStroke.LineJoinMode = Enum.LineJoinMode.Round
titleBarStroke.Thickness = 1
titleBarStroke.Name = "#stroke"
titleBarStroke.Parent = titleBar

local fade = Instance.new("Frame")
fade.BackgroundColor3 = theme.Window1
fade.BackgroundTransparency = 1
fade.BorderSizePixel = 0 
fade.Name = "#fade"
fade.Size = UDim2.new(1, 4, 1, 4)
fade.Position = UDim2.fromOffset(-2, -2)
fade.Visible = false
fade.ZIndex = 8
fade.Parent = titleBar

local buttonClose = Instance.new("TextButton")
buttonClose.AnchorPoint = Vector2.new(1, 0)
buttonClose.AutoButtonColor = false
buttonClose.BackgroundColor3 = theme.Button1
buttonClose.BorderSizePixel = 0 
buttonClose.Name = "#button-close"
buttonClose.Position = UDim2.new(1, -3, 0, 3)
buttonClose.Size = UDim2.fromOffset(20, 20)
buttonClose.Visible = true
buttonClose.ZIndex = 9
buttonClose.Text = ""
buttonClose.Parent = titleBar

local roundClose = Instance.new("UICorner")
roundClose.CornerRadius = UDim.new(0, 4)
roundClose.Name = "#round"
roundClose.Parent = buttonClose

local strokeClose = Instance.new("UIStroke")
strokeClose.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
strokeClose.Color = theme.Stroke
strokeClose.LineJoinMode = Enum.LineJoinMode.Round
strokeClose.Name = "#stroke"
strokeClose.Thickness = 1
strokeClose.Parent = buttonClose

local buttonCloseGradient = Instance.new("UIGradient")
buttonCloseGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, theme.Secondary),
    ColorSequenceKeypoint.new(1, theme.Primary)
}
buttonCloseGradient.Rotation = 45
buttonCloseGradient.Parent = buttonClose

local iconClose = Instance.new("ImageLabel")
iconClose.Active = false
iconClose.BackgroundTransparency = 1
iconClose.BorderSizePixel = 0 
iconClose.Image = "rbxassetid://9801460300"
iconClose.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconClose.Name = "#icon"
iconClose.Position = UDim2.fromOffset(0, 0)
iconClose.Size = UDim2.fromScale(1, 1)
iconClose.Visible = true
iconClose.ZIndex = 10
iconClose.Parent = buttonClose

local gradientClose = Instance.new("UIGradient")
gradientClose.Color = ColorSequence.new(theme.ControlGradient1, theme.ControlGradient2)
gradientClose.Rotation = 90
gradientClose.Enabled = true
gradientClose.Name = "#gradient"
gradientClose.Parent = iconClose

local buttonMin = Instance.new("TextButton")
buttonMin.AnchorPoint = Vector2.new(1, 0)
buttonMin.AutoButtonColor = false
buttonMin.BackgroundColor3 = theme.Button1
buttonMin.BorderSizePixel = 0 
buttonMin.Name = "#button-min"
buttonMin.Position = UDim2.new(1, -25, 0, 3)
buttonMin.Size = UDim2.fromOffset(20, 20)
buttonMin.Visible = true
buttonMin.ZIndex = 9
buttonMin.Text = ""
buttonMin.Parent = titleBar

local roundMin = Instance.new("UICorner")
roundMin.CornerRadius = UDim.new(0, 4)
roundMin.Name = "#round"
roundMin.Parent = buttonMin

local strokeMin = Instance.new("UIStroke")
strokeMin.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
strokeMin.Color = theme.Stroke
strokeMin.LineJoinMode = Enum.LineJoinMode.Round
strokeMin.Name = "#stroke"
strokeMin.Thickness = 1
strokeMin.Parent = buttonMin

local buttonMinGradient = Instance.new("UIGradient")
buttonMinGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, theme.Secondary),
    ColorSequenceKeypoint.new(1, theme.Primary)
}
buttonMinGradient.Rotation = 45
buttonMinGradient.Parent = buttonMin

local iconMin = Instance.new("ImageLabel")
iconMin.Active = false
iconMin.BackgroundTransparency = 1
iconMin.BorderSizePixel = 0 
iconMin.Image = "rbxassetid://9801458532"
iconMin.ImageColor3 = Color3.fromRGB(255, 255, 255)
iconMin.Name = "#icon"
iconMin.Position = UDim2.fromOffset(0, 0)
iconMin.Size = UDim2.fromScale(1, 1)
iconMin.Visible = true
iconMin.ZIndex = 10
iconMin.Parent = buttonMin

local gradientMin = Instance.new("UIGradient")
gradientMin.Color = ColorSequence.new(theme.ControlGradient1, theme.ControlGradient2)
gradientMin.Rotation = 90
gradientMin.Enabled = true
gradientMin.Name = "#gradient"
gradientMin.Parent = iconMin

local windowIcon = Instance.new("ImageLabel")
windowIcon.BackgroundTransparency = 1
windowIcon.BorderSizePixel = 0 
windowIcon.Image = "rbxassetid://17304853482"
windowIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
windowIcon.ImageTransparency = 0
windowIcon.Name = "#icon"
windowIcon.Position = UDim2.fromOffset(2, 1)
windowIcon.Size = UDim2.fromOffset(22, 22)
windowIcon.Visible = true
windowIcon.ZIndex = 9
windowIcon.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.BackgroundTransparency = 1
titleText.BorderSizePixel = 0 
titleText.Font = Enum.Font.Arcade
titleText.Name = "#title"
titleText.Position = UDim2.fromOffset(24, 0)
titleText.Size = UDim2.new(1, -74, 1, 0)
titleText.Text = "niggasploit.gg"
titleText.TextColor3 = theme.TextPrimary
titleText.TextScaled = false
titleText.TextSize = 20
titleText.TextStrokeColor3 = theme.TextStroke
titleText.TextStrokeTransparency = 0.5
titleText.TextTransparency = 0
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.TextYAlignment = Enum.TextYAlignment.Center
titleText.Visible = true
titleText.ZIndex = 9
titleText.Parent = titleBar

local padding = Instance.new("UIPadding")
padding.PaddingLeft = UDim.new(0, 4)
padding.Name = "#padding"
padding.Parent = titleText

local sectionsContainer = Instance.new("Frame")
sectionsContainer.BackgroundTransparency = 0
sectionsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
sectionsContainer.BorderSizePixel = 0 
sectionsContainer.Name = "#sections-container"
sectionsContainer.Position = UDim2.new(0, 0, 0, 20)
sectionsContainer.Size = UDim2.new(1, 0, 1, -20)
sectionsContainer.ZIndex = 6
sectionsContainer.Parent = mainFrame

local sectionCorner = Instance.new("UICorner")
sectionCorner.CornerRadius = UDim.new(0, 6)
sectionCorner.Parent = sectionsContainer

local sectionsLayout = Instance.new("UIListLayout")
sectionsLayout.FillDirection = Enum.FillDirection.Horizontal
sectionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sectionsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
sectionsLayout.Padding = UDim.new(0, 10)
sectionsLayout.Parent = sectionsContainer

local function createSection(title)
    local sectionFrame = Instance.new("Frame")
    sectionFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    sectionFrame.BackgroundTransparency = 0.2
    sectionFrame.BorderSizePixel = 0 
    sectionFrame.Size = UDim2.new(0, 150, 0, 306)
    sectionFrame.ZIndex = 7
    sectionFrame.Parent = sectionsContainer

    local gradientSection = Instance.new("UIGradient")
    gradientSection.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 90, 100)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 94, 94)) 
    }
    gradientSection.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 0)
    }
    gradientSection.Rotation = 90
    gradientSection.Parent = sectionFrame

    local sectionStroke = Instance.new("UIStroke")
    sectionStroke.Color = theme.Stroke
    sectionStroke.Thickness = 1
    sectionStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    sectionStroke.LineJoinMode = Enum.LineJoinMode.Round
    sectionStroke.Parent = sectionFrame

    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.BackgroundColor3 = theme.Window1
    sectionTitle.BorderSizePixel = 0 
    sectionTitle.Size = UDim2.new(1, 0, 0, 25)
    sectionTitle.Text = title
    sectionTitle.TextColor3 = theme.Secondary
    sectionTitle.TextSize = 18
    sectionTitle.Font = Enum.Font.Arcade
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Center
    sectionTitle.ZIndex = 8
    sectionTitle.Parent = sectionFrame

    local sectionUnderline = Instance.new("Frame")
    sectionUnderline.BackgroundColor3 = theme.Stroke
    sectionUnderline.Size = UDim2.new(1, 0, 0, 1)
    sectionUnderline.Position = UDim2.new(0, 0, 1, 0)
    sectionUnderline.ZIndex = 9
    sectionUnderline.Parent = sectionTitle

    local contentArea = Instance.new("Frame")
    contentArea.BackgroundTransparency = 1
    contentArea.BorderSizePixel = 0 
    contentArea.Position = UDim2.new(0, 0, 0, 25)
    contentArea.Size = UDim2.new(1, 0, 1, -25)
    contentArea.ZIndex = 7
    contentArea.Parent = sectionFrame

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    layout.VerticalAlignment = Enum.VerticalAlignment.Top
    layout.Padding = UDim.new(0, 5) 
    layout.Parent = contentArea

    return contentArea
end

local function createCheckbox(parent, text, defaultValue, callback)
    local checkboxFrame = Instance.new("Frame")
    checkboxFrame.BackgroundTransparency = 1
    checkboxFrame.Size = UDim2.new(1, 0, 0, 30) 
    checkboxFrame.ZIndex = 7
    checkboxFrame.Parent = parent

    local checkbox = Instance.new("TextButton")
    checkbox.BackgroundColor3 = theme.Button1
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = UDim2.new(0, 5, 0, 5)
    checkbox.Text = defaultValue and "✓" or ""
    checkbox.TextColor3 = theme.TextPrimary
    checkbox.Font = Enum.Font.SourceSansBold
    checkbox.TextSize = 16
    checkbox.ZIndex = 8
    checkbox.Parent = checkboxFrame

    local checkboxCorner = Instance.new("UICorner")
    checkboxCorner.CornerRadius = UDim.new(0, 4)
    checkboxCorner.Parent = checkbox

    local checkboxStroke = Instance.new("UIStroke")
    checkboxStroke.Color = theme.Stroke
    checkboxStroke.Thickness = 1
    checkboxStroke.Parent = checkbox

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0, 100, 1, 0)
    label.Position = UDim2.new(0, 30, 0, 0)
    label.Text = text
    label.TextColor3 = theme.TextPrimary
    label.Font = Enum.Font.Arcade
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.ZIndex = 8
    label.Parent = checkboxFrame

    local isChecked = defaultValue

    checkbox.MouseButton1Click:Connect(function()
        genericClickSound:Play() 
        isChecked = not isChecked
        checkbox.Text = isChecked and "✓" or ""
        if callback then
            callback(isChecked)
        end
    end)

    return checkboxFrame
end

local function createDropdown(parent, labelText, options, defaultValue, callback)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.BackgroundTransparency = 1
    dropdownFrame.Size = UDim2.new(1, 0, 0, 50)
    dropdownFrame.ZIndex = 7
    dropdownFrame.Parent = parent

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.Text = labelText
    label.TextColor3 = theme.TextPrimary
    label.Font = Enum.Font.Arcade
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 8
    label.Parent = dropdownFrame

    local dropdownButton = Instance.new("TextButton")
    dropdownButton.BackgroundColor3 = theme.Button1
    dropdownButton.Size = UDim2.new(1, -10, 0, 25)
    dropdownButton.Position = UDim2.new(0, 5, 0, 20)
    dropdownButton.Text = defaultValue
    dropdownButton.TextColor3 = theme.TextPrimary
    dropdownButton.Font = Enum.Font.Arcade
    dropdownButton.TextSize = 16
    dropdownButton.ZIndex = 8
    dropdownButton.Parent = dropdownFrame

    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 4)
    dropdownCorner.Parent = dropdownButton

    local dropdownStroke = Instance.new("UIStroke")
    dropdownStroke.Color = theme.Stroke
    dropdownStroke.Thickness = 1
    dropdownStroke.Parent = dropdownButton

    local dropdownList = Instance.new("Frame")
    dropdownList.BackgroundColor3 = theme.Window1
    dropdownList.Size = UDim2.new(1, -10, 0, 0)
    dropdownList.Position = UDim2.new(0, 5, 0, 45)  
    dropdownList.Visible = false
    dropdownList.ZIndex = 50  
    dropdownList.Parent = dropdownFrame

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 4)
    listCorner.Parent = dropdownList

    local listStroke = Instance.new("UIStroke")
    listStroke.Color = theme.Stroke
    listStroke.Thickness = 1
    listStroke.Parent = dropdownList

    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 2)
    listLayout.Parent = dropdownList

    local optionButtons = {}
    local isOpen = false

    for optionName in pairs(options) do
        local optionFrame = Instance.new("Frame")
        optionFrame.BackgroundColor3 = theme.Button1
        optionFrame.Size = UDim2.new(1, 0, 0, 25)
        optionFrame.ZIndex = 51  
        optionFrame.Parent = dropdownList

        local optionCorner = Instance.new("UICorner")
        optionCorner.CornerRadius = UDim.new(0, 4)
        optionCorner.Parent = optionFrame

        local optionStroke = Instance.new("UIStroke")
        optionStroke.Color = theme.Stroke
        optionStroke.Thickness = 1
        optionStroke.Parent = optionFrame

        local optionButton = Instance.new("TextButton")
        optionButton.BackgroundTransparency = 1
        optionButton.Size = UDim2.new(1, 0, 1, 0)
        optionButton.Text = optionName
        optionButton.TextColor3 = theme.TextPrimary
        optionButton.Font = Enum.Font.Arcade
        optionButton.TextSize = 14
        optionButton.ZIndex = 52  
        optionButton.Parent = optionFrame
        
        optionButtons[optionName] = optionButton
        
        optionButton.MouseButton1Click:Connect(function()
            genericClickSound:Play()
            dropdownButton.Text = optionName
            dropdownList.Visible = false
            isOpen = false
            dropdownList.Size = UDim2.new(1, -10, 0, 0)
            if callback then
                callback(optionName)
            end
        end)
    end

    local function updateListSize()
        local itemCount = 0
        for _ in pairs(options) do
            itemCount = itemCount + 1
        end
        local maxHeight = math.min(itemCount * 27, 150)  
        dropdownList.Size = UDim2.new(1, -10, 0, maxHeight)
        
        local totalHeight = dropdownFrame.AbsolutePosition.Y + 45 + maxHeight
        if totalHeight > playerGui.AbsoluteSize.Y then
            dropdownList.Position = UDim2.new(0, 5, 0, -maxHeight)  
        else
            dropdownList.Position = UDim2.new(0, 5, 0, 45)  
        end
    end

    dropdownButton.MouseButton1Click:Connect(function()
        genericClickSound:Play()
        isOpen = not isOpen
        dropdownList.Visible = isOpen
        if isOpen then
            updateListSize()
        else
            dropdownList.Size = UDim2.new(1, -10, 0, 0)
        end
    end)

    return dropdownFrame
end

local function createSlider(parent, labelText, minValue, maxValue, defaultValue, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.BackgroundTransparency = 1
    sliderFrame.Size = UDim2.new(1, 0, 0, 50)
    sliderFrame.ZIndex = 7  
    sliderFrame.Parent = parent

    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 0, 20)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.Text = labelText
    label.TextColor3 = theme.TextPrimary
    label.Font = Enum.Font.Arcade
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 8
    label.Parent = sliderFrame

    local valueLabel = Instance.new("TextLabel")
    valueLabel.BackgroundTransparency = 1
    valueLabel.Size = UDim2.new(0, 40, 0, 20)
    valueLabel.Position = UDim2.new(1, -45, 0, 0)
    valueLabel.Text = tostring(defaultValue)
    valueLabel.TextColor3 = theme.TextPrimary
    valueLabel.Font = Enum.Font.Arcade
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.ZIndex = 8
    valueLabel.Parent = sliderFrame

    local sliderBar = Instance.new("Frame")
    sliderBar.BackgroundColor3 = theme.Inset1
    sliderBar.Size = UDim2.new(1, -10, 0, 8)
    sliderBar.Position = UDim2.new(0, 5, 0, 30)
    sliderBar.ZIndex = 8
    sliderBar.Parent = sliderFrame

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 4)
    sliderCorner.Parent = sliderBar

    local sliderStroke = Instance.new("UIStroke")
    sliderStroke.Color = theme.Stroke
    sliderStroke.Thickness = 1
    sliderStroke.Parent = sliderBar

    local fillBar = Instance.new("Frame")
    fillBar.BackgroundColor3 = theme.Primary
    fillBar.Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
    fillBar.ZIndex = 9
    fillBar.Parent = sliderBar

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = fillBar

    local sliderButton = Instance.new("TextButton")
    sliderButton.BackgroundColor3 = theme.Secondary
    sliderButton.Size = UDim2.new(0, 16, 0, 16)
    sliderButton.Position = UDim2.new((defaultValue - minValue) / (maxValue - minValue), -8, 0, -4)
    sliderButton.Text = ""
    sliderButton.ZIndex = 10
    sliderButton.Parent = sliderBar

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(1, 0)
    buttonCorner.Parent = sliderButton

    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, theme.ControlGradient1),
        ColorSequenceKeypoint.new(1, theme.ControlGradient2)
    }
    buttonGradient.Rotation = 90
    buttonGradient.Parent = sliderButton

    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = theme.Stroke
    buttonStroke.Thickness = 1
    buttonStroke.Parent = sliderButton

    local dragging = false

    sliderButton.MouseButton1Down:Connect(function()
        genericClickSound:Play()
        dragging = true
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local mouseX = input.Position.X
            local barX = sliderBar.AbsolutePosition.X
            local barWidth = sliderBar.AbsoluteSize.X
            local relativeX = math.clamp((mouseX - barX) / barWidth, 0, 1)
            sliderButton.Position = UDim2.new(relativeX, -8, 0, -4)
            fillBar.Size = UDim2.new(relativeX, 0, 1, 0)
            local value = minValue + (maxValue - minValue) * relativeX
            valueLabel.Text = tostring(math.floor(value))
            if callback then
                callback(math.floor(value))
            end
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return sliderFrame
end

local CrosshairSettings = {
    Enabled = false,  
    Size = 6, 
    Thickness = 3,
    Color = Color3.fromRGB(184, 47, 180)
}

local CrosshairLines = {}
for i = 1, 4 do
    local line = Drawing.new("Line")
    line.Color = CrosshairSettings.Color
    line.Thickness = CrosshairSettings.Thickness
    line.Transparency = 1
    line.Visible = CrosshairSettings.Enabled
    table.insert(CrosshairLines, line)
end

local function UpdateCrosshair()
    local camera = workspace.CurrentCamera
    local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    local size = CrosshairSettings.Size
    local gap = 2 

    if CrosshairSettings.Enabled then
        CrosshairLines[1].From = Vector2.new(center.X - (size + gap), center.Y)
        CrosshairLines[1].To = Vector2.new(center.X - gap, center.Y)

        CrosshairLines[2].From = Vector2.new(center.X + (size + gap), center.Y)
        CrosshairLines[2].To = Vector2.new(center.X + gap, center.Y)

        CrosshairLines[3].From = Vector2.new(center.X, center.Y - (size + gap))
        CrosshairLines[3].To = Vector2.new(center.X, center.Y - gap)

        CrosshairLines[4].From = Vector2.new(center.X, center.Y + (size + gap))
        CrosshairLines[4].To = Vector2.new(center.X, center.Y + gap)

        for _, line in pairs(CrosshairLines) do
            line.Visible = true
        end
    else
        for _, line in pairs(CrosshairLines) do
            line.Visible = false
        end
    end
end

RunService.RenderStepped:Connect(UpdateCrosshair)

local skyboxes = {
    ["Default"] = {
        SkyboxBk = "rbxassetid://91458024",
        SkyboxDn = "rbxassetid://91457980",
        SkyboxFt = "rbxassetid://91458024",
        SkyboxLf = "rbxassetid://91458024",
        SkyboxRt = "rbxassetid://91458024",
        SkyboxUp = "rbxassetid://91458002",
    },
    ["Neptune"] = {
        SkyboxBk = "rbxassetid://218955819",
        SkyboxDn = "rbxassetid://218953419",
        SkyboxFt = "rbxassetid://218954524",
        SkyboxLf = "rbxassetid://218958493",
        SkyboxRt = "rbxassetid://218957134",
        SkyboxUp = "rbxassetid://218950090",
    },
    ["Among Us"] = {
        SkyboxBk = "rbxassetid://5752463190",
        SkyboxDn = "rbxassetid://5752463190",
        SkyboxFt = "rbxassetid://5752463190",
        SkyboxLf = "rbxassetid://5752463190",
        SkyboxRt = "rbxassetid://5752463190",
        SkyboxUp = "rbxassetid://5752463190",
    },
    ["Nebula"] = {
        SkyboxBk = "rbxassetid://159454299",  
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454286",
        SkyboxRt = "rbxassetid://159454300",
        SkyboxUp = "rbxassetid://159454288",
    },
    ["Vaporwave"] = {
        SkyboxBk = "rbxassetid://1417494030",
        SkyboxDn = "rbxassetid://1417494146",
        SkyboxFt = "rbxassetid://1417494253",
        SkyboxLf = "rbxassetid://1417494402",
        SkyboxRt = "rbxassetid://1417494499",
        SkyboxUp = "rbxassetid://1417494643",
    },
    ["Twilight"] = {
        SkyboxBk = "rbxassetid://264908339",
        SkyboxDn = "rbxassetid://264907909",
        SkyboxFt = "rbxassetid://264909420",
        SkyboxLf = "rbxassetid://264909758",
        SkyboxRt = "rbxassetid://264908886",
        SkyboxUp = "rbxassetid://264907379",
    },
    ["DaBaby"] = {
        SkyboxBk = "rbxassetid://7245418472",
        SkyboxDn = "rbxassetid://7245418472",
        SkyboxFt = "rbxassetid://7245418472",
        SkyboxLf = "rbxassetid://7245418472",
        SkyboxRt = "rbxassetid://7245418472",
        SkyboxUp = "rbxassetid://7245418472",
    },
    ["Minecraft"] = {
        SkyboxBk = "rbxassetid://1876545003",
        SkyboxDn = "rbxassetid://1876544331",
        SkyboxFt = "rbxassetid://1876542941",
        SkyboxLf = "rbxassetid://1876543392",
        SkyboxRt = "rbxassetid://1876543764",
        SkyboxUp = "rbxassetid://1876544642",
    },
    ["Chill"] = {
        SkyboxBk = "rbxassetid://5084575798",
        SkyboxDn = "rbxassetid://5084575916",
        SkyboxFt = "rbxassetid://5103949679",
        SkyboxLf = "rbxassetid://5103948542",
        SkyboxRt = "rbxassetid://5103948784",
        SkyboxUp = "rbxassetid://5084576400",
    },
    ["Redshift"] = {
        SkyboxBk = "rbxassetid://401664839",
        SkyboxDn = "rbxassetid://401664862",
        SkyboxFt = "rbxassetid://401664960",
        SkyboxLf = "rbxassetid://401664881",
        SkyboxRt = "rbxassetid://401664901",
        SkyboxUp = "rbxassetid://401664936",
    },
    ["Pdiddy"] = {
        SkyboxBk = "rbxassetid://18325478168",
        SkyboxDn = "rbxassetid://18325478168",
        SkyboxFt = "rbxassetid://18325478168",
        SkyboxLf = "rbxassetid://18325478168",
        SkyboxRt = "rbxassetid://18325478168",
        SkyboxUp = "rbxassetid://18325478168",
    }
}

local section1Content = createSection("Main")
local section2Content = createSection("Visual")
local section3Content = createSection("Settings")

local fpsBoostEnabled = false
createCheckbox(section1Content, "FPS Boost", false, function(value)
    fpsBoostEnabled = value
    if value then
        local g = game
        local w = g.Workspace
        local RunService = game:GetService("RunService")

        local optimizationEnabled = true

        local function optimizePerformance()
            for _, v in pairs(w:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Explosion") then
                    v.BlastPressure = 1
                    v.BlastRadius = 1
                end
            end
        end

        if optimizationEnabled then
            optimizePerformance()
        end

        w.DescendantAdded:Connect(function(v)
            if not optimizationEnabled then return end
            task.wait() 
            if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            end
        end)

        settings().Rendering.QualityLevel = "Level01" 

        sethiddenproperty(workspace.Terrain, "Decoration", false) 

        if workspace.Terrain:FindFirstChild("Clouds") then
            workspace.Terrain.Clouds.Enabled = false
        end

        local workspace = game:GetService("Workspace")
        local leaves = {"Fir3_Leaves", "Birch1_Leaves", "Elm1_Leaves", "Palm1_Leaves"}

        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if self == workspace and method == "DescendantAdded" then
                return oldNamecall(self, ...) 
            end
            return oldNamecall(self, ...)
        end)

        local function spoof(obj)
            if table.find(leaves, obj.Name) then
                obj.Transparency = 1
                obj.CanCollide = false
                if obj:IsA("BasePart") then
                    obj.CastShadow = false
                end
            end
        end

        for _, obj in pairs(workspace:GetDescendants()) do
            spoof(obj)
        end

        workspace.DescendantAdded:Connect(function(obj)
            spoof(obj)
        end)
    else
        if workspace.Terrain:FindFirstChild("Clouds") then
            workspace.Terrain.Clouds.Enabled = true
        end
    end
end)

local potatoEnabled = false
createCheckbox(section1Content, "Graphic", false, function(value)
    potatoEnabled = value
    local cloneref = (table.find({'Xeno', 'Fluxus'}, identifyexecutor(), 1) or not cloneref) and function(ref)
        return ref
    end or cloneref
    local players = cloneref(game:FindService('Players')) :: Players
    local httpservice = cloneref(game:FindService('HttpService')) :: HttpService
    local lplr = players.LocalPlayer :: Player
    local request = fluxus and fluxus.request or identifyexecutor() == 'Delta' and http.request or syn and syn.request or request

    local loadfile = function(file, errpath)
        if getgenv().developer then
            errpath = errpath or file:gsub('bloxstrap/', '')
            return getgenv().loadfile(file, errpath)
        else
            local result = request({
                Url = `https://raw.githubusercontent.com/new-qwertyui/Bloxstrap/main/{file:gsub('bloxstrap/', '')}`,
                Method = 'GET'
            })
            if result.StatusCode ~= 404 then
                writefile(file, result.Body)
                return loadstring(result.Body)
            else
                error('Invalid file')
            end
        end
    end

    local getfflag = loadfile('bloxstrap/core/getfflag.lua')()
    local setfflag = loadfile('bloxstrap/core/setfflag.lua')()

    local run = function(func: (() -> ()))
        return pcall(func)
    end

    run(function()
        local oldplayertexture = getfflag('DFIntTextureCompositorActiveJobs')
        local oldterrain = getfflag('FIntTerrainArraySliceSize')
        local oldTextureQualityOverrideEnabled = getfflag('DFFlagTextureQualityOverrideEnabled')
        local oldTextureQualityOverride = getfflag('DFIntTextureQualityOverride')
        local oldTextureManagerSkipMips = getfflag('FIntDebugTextureManagerSkipMips')
        local oldDisablePostFx = getfflag('FFlagDisablePostFx')
        local oldRenderShadowIntensity = getfflag('FIntRenderShadowIntensity')
        local oldTaskSchedulerTargetFps = getfflag('DFIntTaskSchedulerTargetFps')

        local disablePlayerTextures = true     
        local disableTerrainTextures = true     
        local textureQuality = "Lowest"       
        local disablePostEffects = true        
        local disablePlayerShadows = true       
        local framerateLimit = 300               

        local call = value 
        if call then
            setfpscap(framerateLimit)
            setfflag('DFIntTaskSchedulerTargetFps', tostring(framerateLimit))

            local lvl = textureQuality == 'Medium' and 1 or textureQuality == 'High' and 2 or 0
            setfflag('DFFlagTextureQualityOverrideEnabled', (textureQuality == 'Automatic' or not call) and false or true)
            setfflag('DFIntTextureQualityOverride', lvl)
            setfflag('FIntTerrainArraySliceSize', disableTerrainTextures and call and 0 or oldterrain)
            setfflag('FIntDebugTextureManagerSkipMips', call and textureQuality == 'Lowest' and 2 or 0)

            setfflag('DFIntTextureCompositorActiveJobs', call and disablePlayerTextures and 0 or oldplayertexture)

            setfflag('FFlagDisablePostFx', call and disablePostEffects and true or false)

            setfflag('FIntRenderShadowIntensity', call and disablePlayerShadows and 0 or 1)
        else
            setfpscap(0) 
            setfflag('DFIntTaskSchedulerTargetFps', oldTaskSchedulerTargetFps)
            setfflag('DFFlagTextureQualityOverrideEnabled', oldTextureQualityOverrideEnabled)
            setfflag('DFIntTextureQualityOverride', oldTextureQualityOverride)
            setfflag('FIntTerrainArraySliceSize', oldterrain)
            setfflag('FIntDebugTextureManagerSkipMips', oldTextureManagerSkipMips)
            setfflag('DFIntTextureCompositorActiveJobs', oldplayertexture)
            setfflag('FFlagDisablePostFx', oldDisablePostFx)
            setfflag('FIntRenderShadowIntensity', oldRenderShadowIntensity)
        end

        local function resetGraphics()
            setfpscap(0) 
            setfflag('DFIntTaskSchedulerTargetFps', oldTaskSchedulerTargetFps)
            setfflag('DFFlagTextureQualityOverrideEnabled', oldTextureQualityOverrideEnabled)
            setfflag('DFIntTextureQualityOverride', oldTextureQualityOverride)
            setfflag('FIntTerrainArraySliceSize', oldterrain)
            setfflag('FIntDebugTextureManagerSkipMips', oldTextureManagerSkipMips)
            setfflag('DFIntTextureCompositorActiveJobs', oldplayertexture)
            setfflag('FFlagDisablePostFx', oldDisablePostFx)
            setfflag('FIntRenderShadowIntensity', oldRenderShadowIntensity)
        end

        game:GetService("Players").PlayerRemoving:Connect(function(player)
            if player == lplr then
                resetGraphics()
            end
        end)

        game.Close:Connect(resetGraphics)
    end)
end)

local fogEnabled = false
local originalSettings = {
    Ambient = nil,
    OutdoorAmbient = nil,
    Technology = nil,
    FogEnd = nil
}
local fogConnection, playerConnection

local function saveOriginalSettings()
    local lighting = game:GetService("Lighting")
    originalSettings.Ambient = lighting.Ambient
    originalSettings.OutdoorAmbient = lighting.OutdoorAmbient
    originalSettings.Technology = lighting.Technology
    originalSettings.FogEnd = lighting.FogEnd
end

createCheckbox(section1Content, "Fullbright", false, function(value)
    local lighting = game:GetService("Lighting")
    local players = game:GetService("Players")
    
    local originalState = {
        Ambient = lighting.Ambient,
        OutdoorAmbient = lighting.OutdoorAmbient,
        Technology = lighting.Technology,
        FogEnd = lighting.FogEnd,
        FogStart = lighting.FogStart,
        GlobalShadows = lighting.GlobalShadows
    }
    
    local DesiredColor = Color3.fromRGB(255, 255, 255)
    local ambientenabled = false
    local color = ambientenabled and DesiredColor or originalState.Ambient

    local ambientFunc = {
        TimeOfDay = lighting.TimeOfDay,
        Ambient = originalState.Ambient,
        GlobalShadows = originalState.GlobalShadows,
        ColorShift_Top = lighting.ColorShift_Top,
        ColorShift_Bottom = lighting.ColorShift_Bottom,
        FogEnd = originalState.FogEnd,
        FogStart = originalState.FogStart,
        FogColor = lighting.FogColor
    }

    local SpoofedMeta
    SpoofedMeta = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if checkcaller() then
            return SpoofedMeta(self, key)
        end
        if self == lighting and ambientFunc[key] then
            return ambientFunc[key]
        end
        return SpoofedMeta(self, key)
    end))

    local SpoofedMetaNew
    SpoofedMetaNew = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
        if checkcaller() then
            return SpoofedMetaNew(self, key, value)
        end
        if self == lighting then
            ambientFunc[key] = value
            if key == "Ambient" then
                color = ambientenabled and DesiredColor or originalState.Ambient
                return SpoofedMetaNew(self, key, color)
            end
        end
        return SpoofedMetaNew(self, key, value)
    end))

    local function setAmbient(enabled, newColor)
        ambientenabled = enabled
        if newColor then
            DesiredColor = newColor
        end
        color = ambientenabled and DesiredColor or originalState.Ambient
        pcall(function()
            lighting.Ambient = color
        end)
    end
    
    fogEnabled = value
    
    if value then
        setAmbient(true, Color3.fromRGB(255, 255, 255))

        local function updateShadows()
            if fogEnabled then  
                pcall(function()
                    sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility)
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") then
                            sethiddenproperty(v, "CastShadow", false)
                        end
                    end
                end)
            end
        end

        updateShadows()
        
        playerConnection = players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function()
                task.wait(0.5)
                updateShadows()
            end)
        end)

        pcall(function()
            lighting.FogEnd = 1e10
            fogConnection = lighting.Changed:Connect(function()
                if fogEnabled then  
                    lighting.FogEnd = 1e10
                end
            end)
        end)
    else
        if fogConnection then 
            fogConnection:Disconnect()
            fogConnection = nil
        end
        if playerConnection then 
            playerConnection:Disconnect()
            playerConnection = nil
        end

        pcall(function()
            setAmbient(false)
            lighting.Ambient = originalState.Ambient
            
            sethiddenproperty(lighting, "OutdoorAmbient", originalState.OutdoorAmbient)
            sethiddenproperty(lighting, "Technology", originalState.Technology)
            
            lighting.FogEnd = originalState.FogEnd
            lighting.FogStart = originalState.FogStart
            
            lighting.GlobalShadows = originalState.GlobalShadows
            
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    sethiddenproperty(v, "CastShadow", true)
                end
            end
        end)

        task.wait(0.1)
        pcall(function()
            if lighting.Ambient ~= originalState.Ambient then
                lighting.Ambient = originalState.Ambient
            end
            if lighting.FogEnd ~= originalState.FogEnd then
                lighting.FogEnd = originalState.FogEnd
            end
            if lighting.Technology ~= originalState.Technology then
                sethiddenproperty(lighting, "Technology", originalState.Technology)
            end
        end)
    end
end)

local originalFonts = {}
local arcadeFontEnabled = false

createCheckbox(section2Content, "Font", false, function(value)
    arcadeFontEnabled = value
    if value then
        for _, obj in pairs(game:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextBox") or obj:IsA("TextButton") then
                if not originalFonts[obj] then
                    originalFonts[obj] = obj.FontFace 
                end
                obj.FontFace = CustomFont 
            end
        end
    else
        for obj, fontFace in pairs(originalFonts) do
            if obj and obj.Parent then 
                obj.FontFace = fontFace 
            end
        end
    end
end)
local crosshairEnabled = false
createCheckbox(section2Content, "Crosshair", CrosshairSettings.Enabled, function(value)
    crosshairEnabled = value
    CrosshairSettings.Enabled = value
    UpdateCrosshair()
end)

createSlider(section2Content, "Size", 1, 20, CrosshairSettings.Size, function(value)
    CrosshairSettings.Size = value
    UpdateCrosshair()
end)

createSlider(section2Content, "Thickness", 1, 10, CrosshairSettings.Thickness, function(value)
    CrosshairSettings.Thickness = value
    for _, line in pairs(CrosshairLines) do
        line.Thickness = value
    end
    UpdateCrosshair()
end)

local currentSkybox = "Default"  

local function changeSkybox(skyboxName)
    currentSkybox = skyboxName
    local skyboxData = skyboxes[skyboxName]
    if skyboxData then
        local sky = game.Lighting:FindFirstChildOfClass("Sky")
        if not sky then
            sky = Instance.new("Sky")
            sky.Parent = game.Lighting
        end
        sky.SkyboxBk = skyboxData.SkyboxBk
        sky.SkyboxDn = skyboxData.SkyboxDn
        sky.SkyboxFt = skyboxData.SkyboxFt
        sky.SkyboxLf = skyboxData.SkyboxLf
        sky.SkyboxRt = skyboxData.SkyboxRt
        sky.SkyboxUp = skyboxData.SkyboxUp
    end
end

RunService.RenderStepped:Connect(function()
    if game.Lighting:FindFirstChildOfClass("Sky") then
        local currentSky = game.Lighting:FindFirstChildOfClass("Sky")
        if currentSky.SkyboxBk ~= skyboxes[currentSkybox].SkyboxBk then
            changeSkybox(currentSkybox)
        end
    end
    UpdateCrosshair()  
end)

createDropdown(section2Content, "Sky", skyboxes, "Default", function(selectedSkybox)
    changeSkybox(selectedSkybox)
end)

local minimized = false

buttonMin.MouseButton1Click:Connect(function()
    minimizeSound:Play() 
    minimized = not minimized
    if minimized then
        mainFrame.Size = UDim2.fromOffset(500, 26)
        sectionsContainer.Visible = false
    else
        mainFrame.Size = UDim2.fromOffset(500, 350)
        sectionsContainer.Visible = true
    end
end)

local fovEnabled = false 
local defaultFOV = workspace.CurrentCamera.FieldOfView 
local currentFOV = defaultFOV 

local fovCheckbox = createCheckbox(section1Content, "FOV", false, function(value)
    fovEnabled = value
    local camera = workspace.CurrentCamera
    if value then
        pcall(function()
            sethiddenproperty(camera, "FieldOfView", currentFOV)
        end)
    else
        pcall(function()
            sethiddenproperty(camera, "FieldOfView", defaultFOV)
        end)
    end
end)

local fovSlider = createSlider(section1Content, "Value", 50, 120, defaultFOV, function(value)
    currentFOV = value
    if fovEnabled then
        local camera = workspace.CurrentCamera
        pcall(function()
            sethiddenproperty(camera, "FieldOfView", currentFOV)
        end)
    end
end)

local fovConnection
fovConnection = RunService.RenderStepped:Connect(function()
    local camera = workspace.CurrentCamera
    if fovEnabled then
        pcall(function()
            sethiddenproperty(camera, "FieldOfView", currentFOV)
        end)
    end
end)

screenGui.Destroying:Connect(function()
    if fovConnection then
        fovConnection:Disconnect()
    end
    local camera = workspace.CurrentCamera
    pcall(function()
        sethiddenproperty(camera, "FieldOfView", defaultFOV)
    end)
end)

local cam = workspace.CurrentCamera
local resolution = false  

RunService.RenderStepped:Connect(function()
    if resolution then
        cam.CFrame = cam.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.5, 0, 0, 0, 1)
    end
end)

local stretchCheckbox = createCheckbox(section1Content, "4:3", false, function(value)
    resolution = value
end)

buttonClose.MouseButton1Click:Connect(function()
    clickSound:Play() 
    if screenGui.Enabled then 
        wait(0.1)
        screenGui.Enabled = false
    end
end)

spawn(function()
    wait(0.1) 
    openSound:Play() 
end)

local dragging = false
local dragStart = nil
local startPos = nil
local UserInputService = game:GetService("UserInputService")

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position   
    end
end)

titleBar.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
