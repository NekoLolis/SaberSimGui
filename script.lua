local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()
local Window = Library:CreateWindow('Saber Simulator Scripts Idk', 'Saber Simulator', 'Visual UI Library', 'rbxassetid://10618928818', false, 'VisualUIConfigs', 'Default')

local Tab1 = Window:CreateTab('Boss', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))
local Section1 = Tab1:CreateSection('')

local p1 = game.Players.LocalPlayer.Character.HumanoidRootPart

_G.AutoSell = false
_G.AutoClick = false
_G.FullAuto = false

local Button = Section1:CreateButton('Bring Boss', function()
    game.Workspace["Boss"].HumanoidRootPart.CFrame = p1.CFrame
    game.Workspace["Boss"].HumanoidRootPart.Anchored = true
end)

local Tab2 = Window:CreateTab('AutoFarm', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))
local Section2 = Tab2:CreateSection('')

local Toggle = Section2:CreateToggle('Auto Click', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    Library:CreateNotification('Attention!', 'Make Sure Your Sword Is Equipped!', 5)
    if Value == true then
        _G.AutoClick = true
        while wait(0.5) do
            if _G.AutoClick == false then
                break
            end
            game:GetService("ReplicatedStorage").Events.Clicked:FireServer()
        end
    else
        if Value == false then
            _G.AutoClick = false
        end
    end
end)

local Toggle2 = Section2:CreateToggle('Auto Sell', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    Library:CreateNotification('Attention!', 'Make Sure Your Standing In The Sell Area!', 5)
    if Value == true then
        _G.AutoSell = true
        while wait(0.5) do
            if _G.AutoSell == false then
                break
            end
            game:GetService("ReplicatedStorage").Events.Sell:FireServer()
        end
    else
        if Value == false then
            _G.AutoSell = false
        end
    end
end)

local Credits = Window:CreateTab('Credits', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
local CreditsSection = Credits:CreateSection('Credits')

local Label = CreditsSection:CreateLabel("https://github.com/NekoLolis")
local Label = CreditsSection:CreateLabel("Duckie#7238 On Discord")
local Label = CreditsSection:CreateLabel("Made by one and only, NekoLolis/Duckie")

local Settings = Window:CreateTab('Settings', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
local UIFunctions = Settings:CreateSection('UI Functions')

local DestroyButton = UIFunctions:CreateButton('Destroy UI', function()
            Library:DestroyUI()
            end)

local ToggleKeybind = UIFunctions:CreateKeybind('Toggle UI', 'RightShift', function()
            Library:ToggleUI()
            end)


local TransparencySlider = UIFunctions:CreateSlider('Transparency', 0, 100, 0, Color3.fromRGB(0, 125, 255), function(Value)
            Library:SetTransparency(Value / 100, true)
            end)

local ConfigSection = Settings:CreateSection('Config')

local ConfigNameString = ''

local ConfigName = ConfigSection:CreateTextbox('Config Name', 'Input', function(Value)

            ConfigNameString = Value
            end)
            
            local SaveConfigButton = ConfigSection:CreateButton('Save Config', function()
            Library:SaveConfig(ConfigNameString)
            end)
            
            local SelectedConfig = ''
            local ConfigsDropdown = ConfigSection:CreateDropdown('Configs', Library:GetConfigs(), nil, 0.25, function(Value)
            SelectedConfig = Value
            end)
            
            local DeleteConfigButton = ConfigSection:CreateButton('Delete Config', function()
            Library:DeleteConfig(SelectedConfig)
            end)
            
            local LoadConfigButton = ConfigSection:CreateButton('Load Config', function()
            Library:LoadConfig(SelectedConfig)
            end)
            
            local RefreshConfigsButton = ConfigSection:CreateButton('Refresh', function()
            ConfigsDropdown:UpdateDropdown(Library:GetConfigs())
            end)
            
local ThemesSection = Settings:CreateSection('Themes')
            
local ThemesDropdown = ThemesSection:CreateDropdown('Themes', Library:GetThemes(), nil, 0.25, function(Value)
            Library:ChangeTheme(Value)
            end)
            
            local ColorSection = Settings:CreateSection('Custom Colors')
            
            for Index, CurrentColor in next, Library:ReturnTheme() do
            ColorSection:CreateColorpicker(Index, CurrentColor, 0.25, function(Color)
            Library:ChangeColor(Index, Color)
            end, {true})
            end
