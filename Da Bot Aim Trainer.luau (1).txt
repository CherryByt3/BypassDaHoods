local gi = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Utilities%20/Fetch%20Game%20Information.luau", true))()

if not gi.name:find("Da Bot Aim Trainer") then return end

local l = game:GetService("Players").LocalPlayer

local function r(c)
    local bd = c:FindFirstChild("BloxDog", true)
    bd:Destroy()
end

r(l.Character)

l.CharacterAdded:Connect(function(c)
    task.wait(0.5)
    r(c)
end)
