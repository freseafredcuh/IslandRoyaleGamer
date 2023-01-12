--Check if game loaded

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--locals
constants = string.split("https://pastebin.com/raw/c2Vu80fC|Team_Data|Melee_Handler|https://pastebin.com/raw/4JuheYmH|Fire_Bullet|function|Airdrop_Watch|table|Tactical Rifle|Medium Ammo|Assault|weaponData|FireRate|GetState", "|")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local localPlayer = players.LocalPlayer
local tracking = {}
local teamCheck = false
local UserInputService = game:GetService("UserInputService")
local MB = UserInputService:GetMouseButtonsPressed()
local remove = table.remove
local fromRGB = Color3.fromRGB
local espColor = fromRGB(139, 26, 176)
local teamEspColor = fromRGB(61, 176, 26)
local gunName = nil
local hooktoggle = false
local gunName
local localPlayer = game:GetService("Players").LocalPlayer
local currentCamera = workspace.CurrentCamera
local mouse = localPlayer:GetMouse()
local RunService = game:GetService("RunService")
local runService = game:GetService("RunService")
local team = {}
local random = Random.new()
local acCheck1 
startTick = tick()
local acCheck1
wl = true

--AC Bypass
local function isInTable(table, value)
    for i, v in pairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

print("bypassing ac...")
local acTick = tick()
for i, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
    acCheck1 = true
    v:Disable()
end
if not acCheck1 or not constants then
    localPlayer:Kick("script failed to load properly")
    wait(9e9)
end
local functions = {}
for k, b in pairs(getgc()) do
    if type(b) == constants[6] and getfenv(b).script ~= nil then
        table.insert(functions, b)
    end
end
for i, v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
    if isInTable(functions, v.Function) then
        v:Disable()
    end
end

if KRNL_LOADED then
    print("KRNL user LOL")
end


--Main
getgenv().SecureMode = true

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
   Name = "Cheater Hub",
   LoadingTitle = "CH ~ Island Royale",
   LoadingSubtitle = "by freseafred",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Cheater Hub", -- Create a custom folder for your hub/game
      FileName = "Cheater Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "aWDh4u3JJ9", -- The Discord invite code, do not include discord.gg/
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Cheater Hub",
      Subtitle = "Key System",
      Note = "Updates Weakly",
      FileName = "wd3asefsfafeaa",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "CHOnTop1239872lP"
   }
})

--Tabs

local Tab1 = Window:CreateTab("Main", 6023426915) -- Title, Image
local Tab2 = Window:CreateTab("Visual", 6023426915) -- Title, Image
local Tab3 = Window:CreateTab("Misc", 6023426915) -- Title, Image

--Sections

local Section = Tab1:CreateSection("Hitbox")

local HBSize = 3
local HBTrans = 1
local HBPart = ("HumanoidRootPart")
local Button = Tab1:CreateButton({
   Name = "Hitbox",
   Callback = function()
    _G.size = HBSize
    _G.togglesize = Vector3.new(_G.size,_G.size,_G.size)
    Players = game:GetService("Players")
    meta = getrawmetatable(game)
    id = meta.__index
    setreadonly(meta,false)


    for i,v in pairs (Players:GetPlayers()) do
    if v ~= Players.LocalPlayer then
    meta.__index = function(rc, ...)
    args = {...}
    if rc:IsA("Part") and tostring(rc) == HBPart  and args[1] == "Size" then
    return Vector3.new(2,2.35,1)
    end
    return id(rc, ...)
            end
        end
    end

while wait(1.5) do
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer and (Players.LocalPlayer.Team == nil or Players.LocalPlayer.Team ~= v.Team) and v.Character ~= nil then
            for a, b in pairs(v.Character:GetChildren()) do
                if b:IsA("Part") and b.Name == HBPart then
                    b.Size = _G.togglesize
                    b.Transparency = HBTrans
                    b.CanCollide = false
                end
            end
        end
    end
end
   end,
})

local Slider = Tab1:CreateSlider({
   Name = "Hitbox Size",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 3,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   HBSize = Value
   print(HBSize)
   end,
})

local Slider = Tab1:CreateSlider({
   Name = "Hitbox Transparency",
   Range = {0, 1},
   Increment = 0.1,
   Suffix = "Transparency",
   CurrentValue = 1,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   HBTrans= Value
   print(HBTrans)
   end,
})

local Section = Tab2:CreateSection("ESP")

local Button = Tab2:CreateButton({
   Name = "ESP",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/JfSedkHJ", true))()
end,
})

local Button = Tab2:CreateButton({
   Name = "Chams",
   Callback = function()
   loadstring(game:HttpGet'https://pastebin.com/raw/LEvfMUYt')()
end,
})

local Section = Tab3:CreateSection("Miscellaneous")

local Toggle = Tab3:CreateToggle({
   Name = "Inf Jump",
   CurrentValue = false,
   Flag = "ToggleJump", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bool)
   if bool then
        local function Action(Object, Function) if Object ~= nil then Function(Object); end end
            UISconnection = UserInputService.InputBegan:Connect(function(UserInput)
                if bool then
                if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
                    if localPlayer.Character then 
                    Action(localPlayer.Character.Humanoid, function(self)
                        if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                            Action(self.Parent.HumanoidRootPart, function(self)
                                self.Velocity = Vector3.new(self.Velocity.X, jump, self.Velocity.Z);
                            end)
                        end
                    end)
                end
                end
            end
            end)
        else
            UISconnection:Disconnect()
        end
   end,
})

local Toggle = Tab3:CreateToggle({
   Name = "Auto Use Heals",
   CurrentValue = false,
   Flag = "ToggleAUH", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bool)
   autopot = bool
       coroutine.wrap(
    function()
        while wait() do
            if autopot then
                pcall(
                    function()
                        if localPlayer.Character then
                            for count = 1, 6 do
                                local remote = game.ReplicatedStorage.Remote_Functions.Use_Item
                                local shield = localPlayer.Character.Humanoid.Player_Shield.Value
                                local hp = localPlayer.Character.Humanoid.Player_Health.Value
                                local fuck = "Slot" .. tostring(count)
                                local slot = game.ReplicatedStorage.Player_Storages[localPlayer.Name][fuck]
                                local val = tostring(slot.Value)
                                local equipTool = localPlayer.Character:FindFirstChildOfClass("Tool")
                                if val == "Mini Potion" then
                                    if shield < 50 then
                                        if equipTool.Name ~= val then
                                            for i, v in pairs(localPlayer.Backpack:GetChildren()) do
                                                if v.Name == val then
                                                    localPlayer.Character.Humanoid:EquipTool(v)
                                                end
                                            end
                                            remote:InvokeServer(slot)
                                        else
                                            remote:InvokeServer(slot)
                                        end
                                    end
                                elseif val == "Shield Potion" then
                                    if shield < 75 then
                                        if equipTool.Name ~= val then
                                            for i, v in pairs(localPlayer.Backpack:GetChildren()) do
                                                if v.Name == val then
                                                    localPlayer.Character.Humanoid:EquipTool(v)
                                                end
                                            end
                                            remote:InvokeServer(slot)
                                        else
                                            remote:InvokeServer(slot)
                                        end
                                    end
                                elseif val == "Gulp Jar" then
                                    if shield < 26 then
                                        if equipTool.Name ~= val then
                                            for i, v in pairs(localPlayer.Backpack:GetChildren()) do
                                                if v.Name == val then
                                                    localPlayer.Character.Humanoid:EquipTool(v)
                                                end
                                            end
                                            remote:InvokeServer(slot)
                                        else
                                            remote:InvokeServer(slot)
                                        end
                                    end
                                elseif val == "Guzzle Jug" then
                                    if shield < 75 or health < 75 then
                                        if equipTool.Name ~= val then
                                            for i, v in pairs(localPlayer.Backpack:GetChildren()) do
                                                if v.Name == val then
                                                    localPlayer.Character.Humanoid:EquipTool(v)
                                                end
                                            end
                                            remote:InvokeServer(slot)
                                        else
                                            remote:InvokeServer(slot)
                                        end
                                    end
                                elseif val == "Health Kit" then
                                    if hp < 75 then
                                        if equipTool.Name ~= val then
                                            for i, v in pairs(localPlayer.Backpack:GetChildren()) do
                                                if v.Name == val then
                                                    localPlayer.Character.Humanoid:EquipTool(v)
                                                end
                                            end
                                            remote:InvokeServer(slot)
                                        else
                                            remote:InvokeServer(slot)
                                        end
                                    end
                                elseif val == "Bandage" then
                                    if hp < 75 then
                                        if equipTool.Name ~= val then
                                            for i, v in pairs(localPlayer.Backpack:GetChildren()) do
                                                if v.Name == val then
                                                    localPlayer.Character.Humanoid:EquipTool(v)
                                                end
                                            end
                                            remote:InvokeServer(slot)
                                        else
                                            remote:InvokeServer(slot)
                                        end
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    end
)()
   end,
})

local walkEnabled
local jumpEnabled
local Toggle = Tab3:CreateToggle({
   Name = "Walk Enabled",
   CurrentValue = false,
   Flag = "ToggleWalk", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bool)
    walkEnabled = bool
   end,
})

local walk
local jump
local Slider = Tab3:CreateSlider({
   Name = "Walkspeed",
   Range = {25, 50},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 25,
   Flag = "SliderWalk", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bool)
    walk = bool
   end,
})

local Slider = Tab3:CreateSlider({
   Name = "Jumppower",
   Range = {58, 64},
   Increment = 1,
   Suffix = "Jump",
   CurrentValue = 58,
   Flag = "SliderJump", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bool)
    jump = bool
   end,
})

local Toggle = Tab3:CreateToggle({
   Name = "Jump Enabled",
   CurrentValue = false,
   Flag = "ToggleJump", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(bool)
    jumpEnabled = bool
   end,
})

local Section = Tab3:CreateSection("Configs")

local Button = Tab3:CreateButton({
   Name = "Load Config",
   Callback = function()
   Rayfield:Notify({
   Title = "Configs",
   Content = "Configs are on the way! For now set everything manualy...",
   Duration = 6.5,
   Image = 6023426915,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
      end
   },
},
})
   end,
})

local Section = Tab3:CreateSection("Ui")

local Button = Tab3:CreateButton({
   Name = "Destroy Ui",
   Callback = function()
      Rayfield:Notify({
   Title = "Destroy Ui",
   Content = "Are you sure you want to destory the Ui? All scripts will close.",
   Duration = 6.5,
   Image = 6023426915,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Destroy!",
         Callback = function()
         Rayfield:Destroy()
      end
   },
},
})
   end,
})


local alternate = 0
runService.RenderStepped:Connect(
    function()
        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
            if walkEnabled then
            localPlayer.Character.Humanoid.WalkSpeed = walk
            end
            if jumpEnabled then
                localPlayer.Character.Humanoid.JumpPower = jump
            end
        end
end)
