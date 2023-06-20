local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Pet & Egg",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local S1 = T2:AddSection({
Name = "Hatch | Egg"
})

local S2 = T2:AddSection({
Name = "Machine | Pet"
})

local S3 = T2:AddSection({
Name = "Grow Pet | instant has been patched"
})

local T3 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://0",
PremiumOnly = false
})

function gold(pet_1,pet_2,pet_3,pet_4,pet_5)
game:GetService("ReplicatedStorage").Remotes.Pet:FireServer("Machine",{pet_1,pet_2,pet_3,pet_4,pet_5},"Gold")
end

function diamond(pet_1,pet_2,pet_3,pet_4,pet_5)
game:GetService("ReplicatedStorage").Remotes.Pet:FireServer("Machine",{pet_1,pet_2,pet_3,pet_4,pet_5},"Diamond")
end

local egglist = {}
local zone = {}
local pet = {}
local workspace = game:GetService("Workspace")
local client = game.Players.LocalPlayer
local point = {
      Grassy = Vector3.new(-106.65882873535156, 9.07790756225586, 408.00531005859375),
      Desert = Vector3.new(-198.8064727783203, 9.07800006866455, 412.1396179199219),
      Ice = Vector3.new(-285.09039306640625, 9.128000259399414, 413.56732177734375),
      Cave = Vector3.new(-374.09149169921875, 9.07800006866455, 412.3524169921875),
      Lava = Vector3.new(-462.44384765625, 9.07800006866455, 412.6629333496094),
      Toxic = Vector3.new(-553.3580932617188, 9.07800006866455, 412.2569580078125),
      Toy = Vector3.new(-874.3162231445312, 16.9407958984375, 405.9084777832031),
      Cyber = Vector3.new(-968.8330078125, 16.4407958984375, 406.9586486816406),
      Cloud = Vector3.new(-1054.802490234375, 16.4407958984375, 406.50177001953125),
      Samurai = Vector3.new(-1321.52880859375, 17.034076690673828, 405.5628662109375),
      Farm = Vector3.new(-1144.12646484375, 17.034076690673828, 406.6676025390625),
      HauntedForest = Vector3.new(-1231.6070556640625, 17.034076690673828, 405.9743957519531),
}

function checkDoors(zone)
 for i,v in pairs(game:GetService("Workspace").MapDoors:GetChildren()) do
           if v.Name == zone then
            if v.Transparency == 1 then
               return true
             end
         end
     end
end

function SendNotify(title,content)
OrionLib:MakeNotification({
    Name = title,
    Content = content,
    Image = "rbxassetid://0",
    Time = 5
})
end

function RemoveTable(localtable,localstring)
  for _,v in pairs(localtable:GetChildren()) do
    table.remove(localstring,v.Name)
   end
end

function CreateTable(localtable,localstring)
  for _,v in pairs(localtable:GetChildren()) do
    table.insert(localstring,v.Name)
   end
end

CreateTable(workspace.Eggs,egglist)
CreateTable(workspace.Training,zone)
CreateTable(workspace.Pets[client.Name],pet)

local GoldenPet = ""
local DiamondPet = ""

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
     if checkDoors(_G.ReturnTeleportZone) then
         client.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Water[_G.ReturnTeleportZone].Position)
     else
         SendNotify("Error","Sorry you can't teleport to areas you haven't unlocked yet.")
      end
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

S1:AddDropdown({
   Name = "Select Egg",
   Default = "Grassy",
   Options = egglist,
   Callback = function(Value)
     _G.ReturnEgg = Value or "Grassy"
  end    
})

S1:AddDropdown({
   Name = "Total Hatch",
   Default = "1",
   Options = {"1","3"},
   Callback = function(Value)
     _G.TotalEgg = tonumber(Value) or 1
  end    
})

S1:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
    _G.egg = Value
      while wait() do
       if _G.egg == false then break end
          game:GetService("ReplicatedStorage").Remotes.Egg:FireServer(_G.ReturnEgg,_G.TotalEgg)
        end
  end    
})

S1:AddToggle({
  Name = "Auto Equip Best",
  Default = false,
  Callback = function(Value)
    _G.eb = Value
      while wait() do
       if _G.eb == false then break end
        game:GetService("ReplicatedStorage").Remotes.Pet:FireServer("EquipBest")
      end
  end    
})

S2:AddToggle({
  Name = "Instant Gold",
  Default = false,
  Callback = function(Value)
    _G.IGold = Value
      while wait() do
       if _G.IGold == false then break end
        CreateTable(workspace.Pets[client.Name],pet)
        GoldenPet = pet[math.random(1, #pet)]
        gold(GoldenPet,GoldenPet,GoldenPet,GoldenPet,GoldenPet)
        -- RemoveTable(workspace.Pets[client.Name],pet)
      end
  end    
})

S2:AddToggle({
  Name = "Instant Diamond",
  Default = false,
  Callback = function(Value)
    _G.IDiamond = Value
      while wait() do
       if _G.IDiamond == false then break end
        CreateTable(workspace.Pets[client.Name],pet)
        DiamondPet = pet[math.random(1, #pet)]
        diamond(DiamondPet,DiamondPet,DiamondPet,DiamondPet,DiamondPet)
        -- RemoveTable(workspace.Pets[client.Name],pet)
      end
  end    
})
--[[
S3:AddToggle({
  Name = "Instant Grow Pet",
  Default = false,
  Callback = function(Value)
    _G.IGrow = Value
      while wait() do
       if _G.IGrow == false then break end
        CreateTable(workspace.Pets[client.Name],pet)
        LocalTablePetString.GrowPet = pet[math.random(1, #pet)]
        game:GetService("ReplicatedStorage").Remotes.Pet:FireServer("Grow",LocalTablePetString.GrowPet)
        -- RemoveTable(workspace.Pets[client.Name],pet)
      end
  end    
})
]]
