Port = 53640 
Server =  game:GetService("NetworkServer") 
HostService = game:GetService("RunService")Server:Start(Port,20) 
game:GetService("RunService"):Run() 
print("Rowritten server started!") 
function onJoined(NewPlayer) 
print("New player found: "..NewPlayer.Name.."") 
NewPlayer:LoadCharacter(true) 
while wait() do 
if NewPlayer.Character.Humanoid.Health == 0 then 
wait(5) 
NewPlayer:LoadCharacter(true)
elseif NewPlayer.Character.Parent  == nil then 
wait(5) 
NewPlayer:LoadCharacter(true) 
end 
end 
end 
game.Players.PlayerAdded:connect(onJoined) 
local server = "localhost"
local serverport = 53640 
local clientport = 0 
local playername = "test"
game:SetMessage("Connecting to server...") 
function dieerror(errmsg) 
game:SetMessage(errmsg) 
wait(math.huge) 
end 
local suc, err = pcall(function() 
client = game:GetService("NetworkClient") 
local player = game:GetService("Players"):CreateLocalPlayer(0)
game:Load("rbxasset://place.rbxl")
player:SetSuperSafeChat(false) 
game:GetService("Visit") 
player.Name = playername 
game:ClearMessage() 
end) 
if not suc then 
dieerror(err) 
end 
function connected(url, replicator) 
local suc, err = pcall(function() 
local marker = replicator:SendMarker() 
end) 
if not suc then 
dieerror(err) 
end 
marker.Recieved:wait() 
local suc, err = pcall(function() 
game:ClearMessage() 
end) 
if not suc then 
dieerror(err) 
end 
end 
function rejected() 
dieerror("Connection failed: Rejected by server.") 
end 
function failed(peer, errcode, why) 
dieerror("Failed [".. peer.. "], ".. errcode.. ": ".. why) 
end 
local suc, err = pcall(function() 
client.ConnectionAccepted:connect(connected) 
client.ConnectionRejected:connect(rejected) 
client.ConnectionFailed:connect(failed) 
client:Connect(server, serverport, clientport, 20) 
end) 
if not suc then 
local x = Instance.new("Message") 
x.Text = err 
x.Parent = workspace 
wait(math.huge) 
end 
while true do 
wait(0.001) 
replicator:SendMarker() 
end 
