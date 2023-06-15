local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local egglist = {}
local zone = {}
local workspace = game:GetService("Workspace")

local point = {
      Grassy = Vector3.new(-103.1620101928711, 9.07790756225586, 336.9129333496094),
      Desert = Vector3.new(-190.3627166748047, 9.07800006866455, 356.7900085449219),
      Ice = Vector3.new(-245.17446899414062, 9.128000259399414, 304.05419921875),
      Cave = Vector3.new(-334.85699462890625, 9.07800006866455, 292.34765625),
      Lava = Vector3.new(-422.38641357421875, 9.07800006866455, 298.4917907714844),
      Toxic = Vector3.new(-509.95849609375, 9.07800006866455, 304.6077880859375),
      Toy = Vector3.new(-872.5955200195312, 16.9407958984375, 348.67193603515625),
      Cyber = Vector3.new(-969.740234375, 16.4407958984375, 339.7765808105469),
      Cloud = Vector3.new(-1058.516845703125, 16.4407958984375, 338.5137634277344),
      Samurai = Vector3.new(-1313.56201171875, 17.034076690673828, 345.7518005371094),
      Farm = Vector3.new(-1146.83154296875, 17.034076690673828, 375.3365478515625),
      HauntedForest = Vector3.new(-1223.019775390625, 17.034076690673828, 356.712158203125),
}

function CreateTable(localtable,localstring)
  for _,v in pairs(localtable:GetChildren()) do
    table.insert(localstring,v.Name)
   end
end

CreateTable(workspace.Eggs,egglist)
CreateTable(workspace.Training,zone)

T3:AddDropdown({
   Name = "Select Zone",
   Default = "Grassy",
   Options = zone,
   Callback = function(Value)
      _G.ReturnTeleportZone = Value or "Grassy"
   end    
})

T3:AddButton({
  Name = "Teleport",
  Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Water[_G.ReturnTeleportZone].Position)
  end    
})

T1:AddDropdown({
   Name = "Select Zone",
   Default = "Grassy",
   Options = zone,
   Callback = function(Value)
      _G.ReturnZone = Value or "Grassy"
   end    
})

T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
    _G.Rod = Value
      while wait() do
       if _G.Rod == false then break end
        game:GetService("ReplicatedStorage").Remotes.Rod:FireServer("Reel")
      end
  end    
})

T1:AddToggle({
  Name = "Auto Train",
  Default = false,
  Callback = function(Value)
    _G.Train = Value
      while wait() do
       if _G.Train == false then break end
        game:GetService("ReplicatedStorage").Remotes.Train:FireServer("Train",workspace.Training[_G.ReturnZone].Hole)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Fish",
  Default = false,
  Callback = function(Value)
    _G.Cast = Value
      while wait() do
       if _G.Cast == false then break end
          if _G.ReturnZone == "Haunted Forest" then
             game:GetService("ReplicatedStorage").Remotes.Rod:FireServer("Cast",point.HauntedForest,_G.ReturnZone)
          else
             game:GetService("ReplicatedStorage").Remotes.Rod:FireServer("Cast",point[_G.ReturnZone],_G.ReturnZone)
          end
      end
  end    
})

T1:AddToggle({
  Name = "Auto Rebirth",
  Default = false,
  Callback = function(Value)
    _G.Rb = Value
      while wait() do
       if _G.Rb == false then break end
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Gift",
  Default = false,
  Callback = function(Value)
    _G.Gift = Value
      while wait() do
       if _G.Gift == false then break end
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",1)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",2)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",3)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",4)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",5)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",6)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",7)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",8)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",9)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",10)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",11)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Gift",12)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Daily Gift",
  Default = false,
  Callback = function(Value)
    _G.Daily = Value
      while wait() do
       if _G.Daily == false then break end
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",1)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",2)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",3)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",4)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",5)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",6)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",7)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",8)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",9)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",10)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",11)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",12)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",13)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",14)
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Daily",15)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Spin",
  Default = false,
  Callback = function(Value)
    _G.Spin = Value
      while wait() do
       if _G.Spin == false then break end
        game:GetService("ReplicatedStorage").Remotes.Reward:FireServer("Spin")
      end
  end    
})

T2:AddDropdown({
   Name = "Select Egg",
   Default = "Grassy",
   Options = egglist,
   Callback = function(Value)
     _G.ReturnEgg = Value or "Grassy"
  end    
})

T2:AddDropdown({
   Name = "Total Hatch",
   Default = "1",
   Options = {"1","3"},
   Callback = function(Value)
     _G.TotalEgg = tonumber(Value) or 1
  end    
})

T2:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
    _G.egg = Value
      while wait() do
       if _G.egg == false then break end
        game:GetService("ReplicatedStorage").Remotes.Egg:FireServer(_G.ReturnEgg,_G.TotalEgg)
        game:GetService("ReplicatedStorage").Remotes.Pet:FireServer("EquipBest")
      end
  end    
})
