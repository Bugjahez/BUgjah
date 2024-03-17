repeat wait() until game:IsLoaded()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Input = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]
local Tool = game:GetService("ReplicatedStorage").Tools:GetChildren()
local WebhookURL = "" 
game:GetService("Players").LocalPlayer.DisplayName = "Jah Hub"

local function GetHuman()
   local h = LP.Character
   h = h and (h:FindFirstChild("Humanoid") or h:FindFirstChildWhichIsA("Humanoid"))
   return h or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
   local BV = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
   BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
   BV.Name = GramxProjectFloat
   BV.MaxForce = Vector3.new(100000, 100000, 100000)
   BV.Velocity = TweenFloatVelocity
end

local function GetDistance(Endpoint)
   if typeof(Endpoint) == "Instance" then
   Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
   elseif typeof(Endpoint) == "CFrame" then
   Endpoint = Vector3.new(Endpoint.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
   end
   local Magnitude = (Endpoint - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
   return Magnitude
end


function Tween(Endpoint)
   if typeof(Endpoint) == "Instance" then
   Endpoint = Endpoint.CFrame
   end
   local TweenFunc = {}
   local Distance = GetDistance(Endpoint)
   local TweenInfo = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().TweenSpeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
   TweenInfo:Play()
   function TweenFunc:Cancel()
   TweenInfo:Cancel()
   return false
   end
   if Distance <= 100 then
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Endpoint
   TweenInfo:Cancel()
   return false
   end
   return TweenFunc
end
spawn(function()
    while task.wait() do
        pcall(function()
            if TPtoTrainer then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall4 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall4.Velocity = Vector3.new(0, 0, 0)
                    antifall4.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    repeat task.wait()
                        if GetDistance(TrainersCF[TrainerSelected]) < 50 and GetDistance(TrainersCF[TrainerSelected]) < 150 then
                            if TweenFa then
                                TweenFa:Cancel()
                                wait(.1)
                            end
                            LP.Character.HumanoidRootPart.CFrame = TrainersCF[TrainerSelected]
                        else
                            TweenFa = Tween(TrainersCF[TrainerSelected])
                        end
                    until not TPtoTrainer
                end
            else
                antifall4:Destroy()
            end
        end)
    end
    end)
    
    spawn(function()
    while task.wait() do
        pcall(function()
            if TPtoLocation then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall5 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall5.Velocity = Vector3.new(0, 0, 0)
                    antifall5.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    repeat task.wait()
                        if GetDistance(Locations[AreaSelected]) < 50 and GetDistance(Locations[AreaSelected]) < 150 then
                            if TweenFa then
                                TweenFa:Cancel()
                                wait(.1)
                            end
                            LP.Character.HumanoidRootPart.CFrame = Locations[AreaSelected]
                        else
                            TweenFa = Tween(Locations[AreaSelected])
                        end
                    until not TPtoLocation
                end
            else
                antifall5:Destroy()
            end
        end)
    end
    end)

function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end

local function SkillBind(bind)
   pcall(function()
       VIM:SendKeyEvent(true,bind,false,game)
       task.wait()
       VIM:SendKeyEvent(false,bind,false,game)
       wait(.2)
   end)
end


local function attack(method)

    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
   
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
end

local function safestattack(method)
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, 919, "ground_slash")
    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(method, client, client.Character, client.Character.HumanoidRootPart, client.Character.Humanoid, math.huge, "ground_slash")
end

local attackMethods = {
    ["Fist"] = 'fist_combat',
    ["Sword"] = 'Sword_Combat_Slash',
    ["Scythe"] = 'Scythe_Combat_Slash',
    ["Claw"] = 'claw_Combat_Slash',
    ["Fans"] = 'fans_combat_slash'
}

if game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping") then 
    game.ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("getclientping").OnClientInvoke = function() 
        task.wait(5)
        return true 
    end 
end 

spawn(function()
   while wait() do
       pcall(function()
           SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
           if FarmMethod == "Above" then
               FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
           elseif FarmMethod == "Below" then
               FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
           elseif FarmMethod == "Behind" then
               FarmModes = CFrame.new(0,0,getgenv().Distance)
           elseif FarmMethod == "Front" then
               FarmModes = CFrame.new(0,0,-getgenv().Distance)
           end
           for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
               Insert = true
               if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                   for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                   if Insert == true then table.insert(invTable, v.Name) end
               end
           end
       end)
   end
  end)


spawn(function()
   game:GetService("RunService").Stepped:Connect(function()
       if getgenv().AllBosses or TPtoLocation or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
           for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then
                   v.CanCollide = false    
               end
               if v:IsA("Humanoid") then
                   v:ChangeState(11)
               end
           end
       end
   end)
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
game.NetworkClient.ChildRemoved:Connect(function()
  game:GetService("TeleportService"):Teleport(5956785391)
end)
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(5956785391)
    end
end)

local killAuraWait = 1.25  

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().KillAura then
                attack(attackMethods[Method])
                task.wait(killAuraWait)
                repeat
                    wait()
                until game.Players.LocalPlayer:WaitForChild("combotangasd123").Value == 0
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().SafestKillAura then
                safestattack(attackMethods[Method])
                task.wait(killAuraWait)  
                repeat
                    wait()
                until game.Players.LocalPlayer:WaitForChild("combotangasd123").Value == 0
            end
        end)
    end
end)

local function GetNearestBoss()
        
   local Bosses = game:GetService("Workspace").Mobs:GetDescendants()
   local BossesTable = {}

   for i,v in pairs(Bosses) do
       if v:IsA("Model") and v:FindFirstChild("Humanoid") then
           if v.Humanoid.Health > 0 then
               table.insert(BossesTable, v)
           end
       end
   end

   local NearestBoss = nil
   local NearestBossDistance = math.huge

   for i,v in pairs(BossesTable) do
       local Distance = GetDistance(v:GetModelCFrame() * FarmModes)
       if Distance < NearestBossDistance then
           NearestBoss = v
           NearestBossDistance = Distance
       end
   end

   return NearestBoss
end

	
spawn(function()
   while task.wait() do
      pcall(function()
         if getgenv().AllBosses then

            if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
               antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
               antifall3.Velocity = Vector3.new(0, 0, 0)
               antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
               local v = GetNearestBoss()
               
                     if v then
                        repeat task.wait()                                      
                           if GetDistance(v:GetModelCFrame() * FarmModes) < 25 and GetDistance(v:GetModelCFrame() * FarmModes) < 150 then
                              if TweenFa then
                              TweenFa:Cancel()
                              wait(.1)
                              end
                              LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * FarmModes
                           else
                              TweenFa = Tween(v:GetModelCFrame() * FarmModes)
                           end
                           if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(v:GetModelCFrame() * FarmModes) < 10 then
                              NearestMobs = true
                           elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(v:GetModelCFrame() * FarmModes) > 10 then
                              NearestMobs = false
                           end
                        until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                        NearestMobs = false
               end
            end
         else
            antifall3:Destroy()
         end
         if getgenv().AllBosses == false then
            TweenFa:Cancel()
         end
      end)
   end
end)

 spawn(function() 
     while task.wait() do 
         if AutoLoot then 
             for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do 
                 if v.Name == "Loot_Chest" and v:FindFirstChild("Drops") then 
			if #v.Drops:GetChildren() == 0 then
                       v:Destroy()
			else 
                     for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do 
                         v["Add_To_Inventory"]:InvokeServer(c.Name)                          
			if #v.Drops:GetChildren() == 0 then
                               v:Destroy()
			   end 					
		       end
                     end 
                 end 
             end 
         end 
     end 
 end) 

 local function sendWebhook(itemName)
   local payload = {
       ["content"] = "",
       ["embeds"] = {{
           ["title"] = "**Item Obtained!**",
           ["description"] = game.Players.LocalPlayer.DisplayName .. " obtained the item: " .. itemName,
           ["type"] = "rich",
           ["color"] = tonumber(0xffffff),
           ["fields"] = {
               {
                   ["name"] = "Hardware ID:",
                   ["value"] = "Unknown", -- Replace with the hardware ID retrieval method suitable for Fluxus
                   ["inline"] = true
               }
           }
       }}
   }

   local headers = {
       ["Content-Type"] = "application/json"
   }

   local requestBody = game:GetService("HttpService"):JSONEncode(payload)

   local response = http_request({
       Url = WebhookURL,
       Method = "POST",
       Headers = headers,
       Body = requestBody
   })
end

spawn(function()
   while true do
       if AutoCollectChestv3 then
           for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
               if v.Name == "Loot_Chest" and v:FindFirstChild("Drops") then
                   if #v.Drops:GetChildren() == 0 then
                       v:Destroy()
                   else
                       for _, drop in pairs(v.Drops:GetChildren()) do
                           local args = {
                               [1] = drop.Name
                           }

                           v.Add_To_Inventory:InvokeServer(unpack(args))
                           if #v.Drops:GetChildren() == 0 then
                               v:Destroy()
                           end

                           sendWebhook(drop.Name)
                       end
                   end
               end
           end
       end
       wait()
   end
end)

spawn(function()
    while task.wait() do
        if getgenv().AutoBlock then
            local args = {
                [1] = "add_blocking",
                [3] = 11565.6265117,
                [4] = game:GetService("ReplicatedStorage").PlayerValues[game.Players.LocalPlayer.Name],
                [5] = math.huge
            }
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
        end
    end
end)

 spawn(function()
    while task.wait() do
       pcall(function()
          if SkillActive then
             if AutoUseSkills and getgenv().ZMove and not UsingSkill then
                for i = 1,7 do
                   UsingSkill = true
                   SkillBind("Z")
                end              
                UsingSkill = false
             end
          end
       end)
    end
 end)
 
 
 spawn(function()
    while task.wait() do
       pcall(function()
          if SkillActive then
             if AutoUseSkills and getgenv().XMove and not UsingSkill then
                for i = 1,7 do
                   UsingSkill = true
                   SkillBind("X")
                end              
                UsingSkill = false
             end
          end
       end)
    end
 end)
 
 spawn(function()
    while task.wait() do
       pcall(function()
          if SkillActive then
             if AutoUseSkills and getgenv().CMove and not UsingSkill then
                for i = 1,7 do
                   UsingSkill = true
                   SkillBind("C")
                end              
                UsingSkill = false
             end
          end
       end)
    end
 end)
 
 spawn(function()
    while task.wait() do
       pcall(function()
          if SkillActive then
             if AutoUseSkills and getgenv().VMove and not UsingSkill then
                for i = 1,7 do
                   UsingSkill = true
                   SkillBind("V")
                end              
                UsingSkill = false
             end
          end
       end)
    end
 end)
 
 spawn(function()
    while task.wait() do
       pcall(function()
          if SkillActive then
             if AutoUseSkills and getgenv().BMove and not UsingSkill then
                for i = 1,7 do
                   UsingSkill = true
                   SkillBind("B")
                end              
                UsingSkill = false
             end
          end
       end)
    end
 end)
 
 spawn(function()
    while task.wait() do
       pcall(function()
          if SkillActive then
             if AutoUseSkills and getgenv().NMove and not UsingSkill then
                for i = 1,7 do
                   UsingSkill = true
                   SkillBind("N")
                end              
                UsingSkill = false
             end
          end
       end)
    end
 end)
 
 task.spawn(function()
    for i,v in next, getgc(true) do
       if type(v) == "table" and rawget(v, "swim_bar") then
          while task.wait() do
             if getgenv().NoDrown then
                rawset(v, "swim_bar", {
                   [1] = 2,
                   [2] = 2
                })
             end
          end
       end
    end
 end)

 spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().AllBosses or TPtoLocation or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end
    end)
 end)

 local vu = game:GetService("VirtualUser")
 game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
 end)
 game.NetworkClient.ChildRemoved:Connect(function()
   game:GetService("TeleportService"):Teleport(5956785391)
 end)
 game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
     if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
         game:GetService("TeleportService"):Teleport(5956785391)
     end
 end)

spawn(function()
	while task.wait() do
		if StaminaRegen then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "StaminaRegen" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if HealthRegen then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "HealthRegen" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if BloodMoney then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "BloodMoney" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if DoublePoints then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "DoublePoints" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if InstaKill then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "InstaKill" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if WisteriaPoisoning then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "WisteriaPoisoning" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if MobCamouflage then
			for _, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v:IsA("Model") and v.Name == "MobCamouflage" then do
LP.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
					end
				end
			end
		end
	end
end)


getgenv().TKA = false
spawn(function()
  while task.wait() do
     if getgenv().TKA then
         pcall(function()
local args = {
                    [1] = "skil_ting_asd",
                    [2] = game:GetService("Players").LocalPlayer,
                    [3] = "Thunderbreathingrapidslashes",
                    [4] = 5
                }
                
                game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))                 
                wait(14)
          end)
      end
  end
end)

spawn(function()
  while task.wait() do
    if getgenv().TKA then
       pcall(function()
       local args = {
                [1] = "ricespiritdamage",
                [2] = game:GetService("Players").LocalPlayer.Character,
                [3] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame,
                [4] = 300
            }     
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args))
            wait(0.85)
      end)
    end
  end
end)

getgenv().BypassGKA = false
getgenv().GKA = false
spawn(function()
  while task.wait() do
     if getgenv().BypassGKA then
         pcall(function()
local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                Handle_Initiate_S_:InvokeServer("skil_ting_asd", game.Players.LocalPlayer, "arrow_knock_back", 5)
                wait(14)
         end)

      end
   end
end)

spawn(function()
   while task.wait() do
     if getgenv().GKA then
        local success, error = pcall(function()
                    local hitCounter = {} -- Counter for each model

                    for i, v in next, workspace.Mobs:GetDescendants() do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            local modelId = v:GetFullName()

                            if not hitCounter[modelId] then
                                hitCounter[modelId] = 0
                            end

                            if hitCounter[modelId] <= 2 then
                                local humanoid = v:FindFirstChildOfClass("Humanoid")
                                if humanoid and humanoid.Health > 0 then
                                    local Handle_Initiate_S_ = game.ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_
                                    Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", game.Players.LocalPlayer.Character, v.HumanoidRootPart.CFrame, v, 500, 500)
				    Handle_Initiate_S_:InvokeServer("arrow_knock_back_damage", game.Players.LocalPlayer.Character, v.HumanoidRootPart.CFrame, v, 500, 500)
                                    hitCounter[modelId] = hitCounter[modelId] + 1
                                else

                                    print("Model with health 0:", modelId)
                                end
                            end

                            local hitCount = 0
                            for _, count in pairs(hitCounter) do
                                hitCount = hitCount + count
                            end
                            if hitCount > 2 then
                                break 
                            end
                        end
                    end
                end)

                if not success then
                    print("An error occurred:", error)
                end
              wait()
      end
  end
end)
				
local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = library.subs.Wait

local Window = library:CreateWindow({
Name = "Bugjah",
Themeable = {
Info = ""
}
})

local Main = Window:CreateTab({
Name = "Main"
})

local Status = Main:CreateSection({
    Name = "[Status]",
    Side = "Left"
    })

local ClanLabel = Status:AddLabel({
Name = "Clan N/A"
})

local RaceLabel = Status:AddLabel({
Name = "Race N/A"
})
 
local BreathingLabel = Status:AddLabel({
Name = "Breathing: N/A"
})
        
local BDALabel = Status:AddLabel({
Name = "BDA: N/A"
})
     
local function updateLabel()
    local localplayer = game:GetService("Players").LocalPlayer
    local ClanValue = game:GetService("ReplicatedStorage").Player_Data[localplayer.Name].Clan.Value
    local RaceValue = game:GetService("ReplicatedStorage").Player_Data[localplayer.Name].Race.Value
    local BreathingValue = game:GetService("ReplicatedStorage").Player_Data[localplayer.Name].Power.Value
    local ArtValue = game:GetService("ReplicatedStorage").Player_Data[localplayer.Name].Demon_Art.Value
ClanLabel:SetText("Clan: " .. ClanValue)
if RaceValue == 1 then
        RaceLabel:SetText("Race: Human")
    elseif raceValue == 2 then
        RaceLabel:SetText("Race: Slayer")
    elseif RaceValue == 3 then
        RaceLabel:SetText("Race: Demon")
    else
        RaceLabel:SetText("Race: Hybrid")
    end
BreathingLabel:SetText("Breathing: " .. BreathingValue)
BDALabel:SetText("BDA: " .. ArtValue)
end
game:GetService("RunService").Heartbeat:Connect(updateLabel)

    local DemonProgressLabel = Status:AddLabel({
Name = "DemonProgress: N/A"
})
            
local BreathingProgressLabel = Status:AddLabel({
Name = "BreathingProgress: N/A"
})

local function updateLabel()
    local demonProgress = game:GetService("ReplicatedStorage").Player_Data[playerName].DemonProgress
    local breathingProgress = game:GetService("ReplicatedStorage").Player_Data[playerName].BreathingProgress
    local demonText = demonProgress["1"].Value .. "/" .. demonProgress["2"].Value
    local breathingText = breathingProgress["1"].Value .. "/" .. breathingProgress["2"].Value
    
    DemonProgressLabel:SetText("Demon Progress: " .. demonText)
    BreathingProgressLabel:SetText("Breathing Progress: " .. breathingText)
end

game:GetService("RunService").Heartbeat:Connect(updateLabel)

local StartTime = os.time()

local TimeLabel = Status:AddLabel({
Name = "Elapsed Time: 0s"
})

local function updateLabel()
    local ElapsedTime = os.time() - StartTime
    local FormattedTime = string.format("%02d:%02d:%02d", ElapsedTime / 3600, (ElapsedTime / 60) % 60, ElapsedTime % 60)
    TimeLabel:SetText("Elapsed Time: " .. FormattedTime)
end

game:GetService("RunService").Heartbeat:Connect(updateLabel)

Status:AddDropdown({
    Name = "Select Clan",
    List = {"Kamado", "Uzui", "Rengoku", "Agatsuma", "Soyama", "Hashibira"},
    Multi = false,
    Callback = function(v)
        local localplayer = game:GetService("Players").LocalPlayer
        local clanValue = v
        game:GetService("ReplicatedStorage").Player_Data[localplayer.Name].Clan.Value = clanValue
    end
    })

        local Farm = Main:CreateSection({
            Name = "[Farm]",
            Side = "Left"
            })
            
            Farm:AddToggle({
            Name = "Farm Ouwigahara",
            Flag = "Auto Farm",
            Default = false,
            Callback = function(value)
                getgenv().AllBosses = value
                end
            })

            local UserInputService = game:GetService("UserInputService")
            local ContextActionService = game:GetService("ContextActionService")
            local mouseEnabled = true
        
            local function DisableMouseClicks()
                mouseEnabled = false
                ContextActionService:BindAction("DisableMouseClicks", function() end, false, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2)
            end
            
            local function EnableMouseClicks()
                mouseEnabled = true
                ContextActionService:UnbindAction("DisableMouseClicks")
            end

            Farm:AddToggle({
            Name = "Kill Aura [16 Hits]",
            Flag = "KA",
            Default = false,
            Callback = function(value)   
                    getgenv().KillAura = value
                    pcall(function(value)
                        if value then
                            DisableMouseClicks()
                        else
                            EnableMouseClicks()
                        end
                    end)   
                end
            })

Farm:AddToggle({
            Name = "Kill Aura [14 Hits]",
            Flag = "KA",
            Default = false,
            Callback = function(value)      
                    getgenv().SafestKillAura = value   
                    pcall(function(value)
                        if value then
                            DisableMouseClicks()
                        else
                            EnableMouseClicks()
                        end
                    end)   
            end
            })

Farm:AddToggle({
Name = "Arrow GKA",
Flag = "GKA",
Default = false,
Callback = function(value)
      getgenv().BypassGKA = value
      getgenv().GKA = value
        end
        })
   
Farm:AddToggle({
Name = "Thunder KA",
Flag = "TKA",
Default = false,
Callback = function(value)
      getgenv().TKA = value
 end
})      
            Farm:AddToggle({
            Name = "Auto Block (No Skills)",
            Flag = "Block",
            Default = false,
            Callback = function(value)
                if value then
                    getgenv().AutoBlock = true
                else
                    getgenv().AutoBlock = false
                    local args = {
                        [1] = "remove_blocking",
                        [2] = game:GetService("ReplicatedStorage"):WaitForChild("PlayerValues"):WaitForChild(game.Players.LocalPlayer.Name)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S_"):InvokeServer(unpack(args))
                end
                end
            })

            Farm:AddToggle({
                Name = "Auto Loot",
                Flag = "Loot",
                Default = false,
                Callback = function(value)
     getgenv().AutoLoot = value
                    end
                })

Farm:AddToggle({
    Name = "Auto Loot [Webhook]",
    Flag = "Loot Webhook",
    Default = false,
    Callback = function(value)
        getgenv().AutoCollectChestv3 = value
        end
    })
                
    Farm:AddTextbox({
    Name = "Webhook URL",
     Flag = "URL",
    Default = string,
    Callback = function(value)
        getgenv().WebhookURL = value
    end
   }) 

   local Skill = Main:CreateSection({
    Name = "[Auto Skill]",
    Side = "Right"
    })
    
    Skill:AddToggle({
    Name = "Auto Skill",
    Flag = "Auto Skill",
    Default = false,
    Callback = function(t)
        getgenv().AutoUseSkills = t
        end
        })
    
    Skill:AddToggle({
        Name = "[Z]",
    Flag = "Auto SKill",
    Default = false,
    Callback = function(t)
        getgenv().ZMove = t
    end
    })  
       
    Skill:AddToggle({
        Name = "[X]",
    Flag = "Auto SKill",
    Default = false,
    Callback = function(t)
        getgenv().XMove = t
    end
    })  
   
    Skill:AddToggle({
        Name = "[C]",
    Flag = "Auto SKill",
    Default = false,
    Callback = function(t)
        getgenv().CMove = t 
    end
    })  
   
    Skill:AddToggle({
        Name = "[V]",
    Flag = "Auto SKill",
    Default = false,
    Callback = function(t)
        getgenv().VMove = t
    end
    })  
   
    Skill:AddToggle({
        Name = "[B]",
    Flag = "Auto SKill",
    Default = false,
    Callback = function(t)
        getgenv().BMove = t 
    end
    })  

    Skill:AddToggle({
        Name = "[N]",
    Flag = "Auto SKill",
    Default = false,
    Callback = function(t)
        getgenv().NMove = t   
    end
    })  

local Setting = Main:CreateSection({
Name = "[Setting]",
Side = "Right"
})

getgenv().Method = "Scythe"
Setting:AddDropdown({
Name = "Kill Aura Method",
Flag = "KAW",
Default = "Sword",
List = {"Scythe", "Sword", "Fist", "Fan", "Claw"},
Multi = false,
Callback = function(self)
    getgenv().Method = self
    end
})

getgenv().FarmMethod = "Above"
Setting:AddDropdown({
Name = "Farm Method",
Flag = "FM",
Default = "Above",
List = {"Above", "Below", "Behind", "Front"},
Multi = false,
Callback = function(self)
    getgenv().FarmMethod = self
    end
})

Setting:AddSlider({
    Name = "Kill Aura Delay",
    Flag = "KACd",
    Value = 1.5,
    Min = 1.25,
    Max = 2.5,
    Textbox = true,
    Callback = function(self)
        killAuraWait = self.Value 
        end
    })
 
getgenv().TweenSpeed = 300
Setting:AddSlider({
Name = "Tweed Speed",
Flag = "TS",
Value = 300,
Min = 100,
Max = 500,
Textbox = true,
Callback = function(self)
    getgenv().TweenSpeed = self
    end
})

getgenv().Distance = 7
Setting:AddSlider({
Name = "Farm Distrance",
Flag = "Distrance",
Value = 7,
Min = 0,
Max = 20,
Textbox = true,
Callback = function(self)
    getgenv().Distance = self
    end
})

local Ouwi = Main:CreateSection({
Name = "Auto Orb",
Side = "Right"
})

Ouwi:AddToggle({
Name = "Auto All Orbs",
Default = false,
Callback = function(value)
getgenv().HealthRegen = value
getgenv().StaminaRegen = value
getgenv().BloodMoney = value
getgenv().DoublePoints = value
getgenv().InstaKill = value
getgenv().WisteriaPoisoning = value
getgenv().MobCamouflage = value
end
})

Ouwi:AddToggle({
   Name = "Auto [Health Regen] Orb",
   Default = false,
   Callback = function(value)
      getgenv().HealthRegen = value
   end
})

Ouwi:AddToggle({
   Name = "Auto [Stamina Regen] Orb",
   Default = false,
   Callback = function(value)
      getgenv().StaminaRegen = value
   end
})

Ouwi:AddToggle({
   Name = "Auto [Blood Money] Orb",
   Default = false,
   Callback = function(value)
      getgenv().BloodMoney = value
   end
})

Ouwi:AddToggle({
   Name = "Auto [Double Points] Orb",
   Default = false,
   Callback = function(value)
      getgenv().DoublePoints = value
   end
})

Ouwi:AddToggle({
   Name = "Auto [Instant Kill] Orb",
   Default = false,
   Callback = function(value)
      getgenv().InstaKill = value
   end
})

Ouwi:AddToggle({
   Name = "Auto [Wisteria Poisoning] Orb",
   Default = false,
   Callback = function(value)
      getgenv().WisteriaPoisoning = value
   end
})

Ouwi:AddToggle({
   Name = "Auto [Mob Camouflage] Orb",
   Default = false,
   Callback = function(value)
      getgenv().MobCamouflage = value
   end
})

local Misc = Window:CreateTab({
Name = "Misc"
})

local Miscellaneous = Misc:CreateSection({
Name = "[Miscellaneous]",
Side = "Left"
})

Miscellaneous:AddToggle({
    Name = "Inf Stamina",
    Default = false,
    Callback = function(state)
        if state then
           getgenv().infstuff = true
           while getgenv().infstuff do
              task.wait()
              getrenv()._G:Stamina(-100)
           end
        else
           getgenv().infstuff = false
        end  
    end
})

Miscellaneous:AddToggle({
    Name = "Inf Breathing",
    Default = false,
    Callback = function(state)
        if state then
           getgenv().infstuff = true
           while getgenv().infstuff do
              task.wait()
              getrenv()._G:Breath(-100)
           end
        else
           getgenv().infstuff = false
        end   
    end
})

Miscellaneous:AddToggle({
    Name = "No Drown",
    Default = false,
    Callback = function(t)
        getgenv().NoDrown = t  
    end
})

Miscellaneous:AddToggle({
    Name = "No Cooldown [Can Kick]",
    Default = false,
    Callback = function(state)
        if state then
           getgenv().NoCdMoves = true
           oldindex = hookmetamethod(game, "__index", function(index, value)
              if tostring(index) == "LastUsed" and getgenv().NoCdMoves then
                 return 0
              end
              return oldindex(index, value)
           end)
        else
           getgenv().NoCdMoves = false
           hookmetamethod(game, "__index", oldindex)
        end 
    end
})

Miscellaneous:AddToggle({
    Name = "No Burn [DEMON]",
    Default = false,
    Callback = function(state)
        if state then
           game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = true
        else
           game:GetService("Players").LocalPlayer.PlayerScripts["Small_Scripts"].Gameplay["Sun_Damage"].Disabled = false
        end  
    end
})

local Mode = Misc:CreateSection({
Name = "[Mode]",
Side = "Right"
})

Mode:AddToggle({
    Name = "Rengoku Mode [Human/Slayer]",
    Default = false,
    Callback = function(state)
        if state then
           game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(true)
        else
           game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(false)
        end 
    end
    })
 
Mode:AddToggle({
    Name = "GodSpeed Mode [Human/Slayer]",
    Default = false,
    Callback = function(state)
        if state then
           game:GetService("ReplicatedStorage").Remotes.thundertang123:FireServer(true)
        else
           game:GetService("ReplicatedStorage").Remotes.thundertang123:FireServer(false)
        end
    end
    })
 
Mode:AddToggle({
    Name = "WarDrum Mode",
    Default = false,
    Callback = function(Value)
        getgenv().infWD = Value
          while getgenv().infWD do 
          local args = {
          [1] = true
          }
  
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(unpack(args))
          wait(3)
        end 
    end
    })
          
Mode:AddToggle({
    Name = "Semi GodMode [Kamado]",
    Default = false,
    Callback = function(state)
        if state then
            game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(true)
        else
            game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(false)
        end 
    end
    })
       
Mode:AddToggle({
    Name = "Semi Godmode [All Race]",
    Default = false,
    Callback = function(state)
        if state then
            game:GetService("ReplicatedStorage").Remotes.regeneration_breathing_remote:FireServer(true)
        else
            game:GetService("ReplicatedStorage").Remotes.regeneration_breathing_remote:FireServer(false)
        end
    end
    })
    
Mode:AddToggle({
    Name = "Scythe Godmode [30 Mas]",
    Default = false,
    Callback = function(state)
        if state then
           _G.godmode2 = true
     while _G.godmode2 do
     local args = {
        [1] = "skil_ting_asd",
        [2] = game:GetService("Players").LocalPlayer,
        [3] = "scythe_asteroid_reap",
        [4] = 1
     }
     
     game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
     wait(0.1)
     end
        else
           _G.godmode2 = false
           while _G.godmode2 do
           local args = {
              [1] = "skil_ting_asd",
              [2] = game:GetService("Players").LocalPlayer,
              [3] = "scythe_asteroid_reap",
              [4] = 1
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
           wait(0.1)
           end
        end 
    end
    })   


    Extra:AddToggle({
     Name = "White Screen [FPS Boost]",
    Flag = "White Screen",
    Default = false,
       Callback = function(state)
          if state then
             game:GetService("RunService"):Set3dRenderingEnabled(false)
          else
             game:GetService("RunService"):Set3dRenderingEnabled(true)
          end
       end
    })

local MobileTab = Window:CreateTab({
 Name = "Mobile", 
})
local Mobile = MobileTab:CreateSection({
Name = "Setting",
Side = "Left"
})

local KAW = Mobile:AddLabel({
Name = "Kill Aura Weapon: "
})

Mobile:AddButton({
    Name = "Fist Kill Aura",
    Flag = "KAW",
    Callback = function()
        getgenv().Method = "Fist"
        end 
    })
    
    Mobile:AddButton({
    Name = "Sword Kill Aura",
    Flag = "KAW",
    Callback = function()
        getgenv().Method = "Sword"
        end 
    })
    
    Mobile:AddButton({
    Name = "Scythe Kill Aura",
    Flag = "KAW",
    Callback = function()
        getgenv().Method = "Scythe"
        end 
    })
    
    Mobile:AddButton({
    Name = "Fan Kill Aura",
    Flag = "KAW",
    Callback = function()
        getgenv().Method = "Fans"
        end
    })
    
    Mobile:AddButton({
    Name = "Claw Kill Aura",
    Flag = "KAW",
    Callback = function()
        getgenv().Method = "Claw"
        end 
    })
    ---Farm Method
    
    local FM = Mobile:AddLabel({
    Name = "Farm Method: "
    })
    
    Mobile:AddButton({
    Name = "Above",
    Flag = "FM",
    Callback = function()
        getgenv().FarmMethod = "Above"
        end
        })
    
    Mobile:AddButton({
    Name = "Below",
    Flag = "FM",
    Callback = function()
        getgenv().FarmMethod = "Below"
        end
        })
    
    Mobile:AddButton({
    Name = "Behind",
    Flag = "FM",
    Callback = function()
          getgenv().FarmMethod = "Behind"
        end
        })
    
    
    Mobile:AddButton({
    Name = "Front",
    Flag = "FM",
    Callback = function()
         getgenv().FarmMethod = "Front"
        end
        })
