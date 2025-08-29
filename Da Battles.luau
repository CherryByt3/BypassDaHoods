local GameInformation = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Utilities%20/Fetch%20Game%20Information.luau", true))()
if not GameInformation.Name:find("Da Battles") then return end
loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Anti-Cheats%20Bypassers%20/Adonis.luau", true))()
local Players = Game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local OriginalNameCall; OriginalNameCall = hookmetamethod(game, "__namecall", newcclosure(function(Object, ...)
    local Arguments = {...}
    local Method = getnamecallmethod()
    if Method == "FireServer" and Object.Name == "a" then
        return
    end
    return OriginalNameCall(Object, ...)
end))
local OriginalNewIndex; OriginalNewIndex = hookmetamethod(game, "__newindex", newcclosure(function(Object, Key, Value)
    if Object == LocalPlayer and Key == "Parent" and Value == nil then
        return OriginalNewIndex(Object, Key, Players)
    end
    if not checkcaller() and Key == "Name" and tostring(Object.Parent) == "Ugc" then
        return OriginalNewIndex(Object, Key, Object.ClassName)
    end
    return OriginalNewIndex(Object, Key, Value)
end))
