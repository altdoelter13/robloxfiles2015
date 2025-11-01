-- Solo script easier version by EnergyCell
-- Uae Tools > Execute script to run this.
local NetworkServer = game:GetService("NetworkServer")
NetworkServer:Start(53640)
game:Load("rbxasset://place.rbxl")
local plr = game.Players:CreateLocalPlayer(0)
game:GetService("Visit")
game:GetService("RunService"):run()
local NetworkClient = game:GetService("NetworkClient")
NetworkClient:Connect("127.0.0.1", 53640)
plr:LoadCharacter()
print ("RBLXDev solo script by EnergyCell v1.2 fixed")
while true do wait(0.001)
if plr.Character.Humanoid.Health == 0
then wait(5) plr:LoadCharacter()
print ("LocalPlayer was killed.")
end
end


