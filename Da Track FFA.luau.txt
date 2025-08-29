local GameInformation = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Utilities%20/Fetch%20Game%20Information.luau", true))()
if not GameInformation.Name:find("FFA") then return end
for _, Collected in getgc() do
    if typeof(Collected) ~= "function" then continue end
    local Info = debug.getinfo(Collected)
    local Path = Info and Info.short_src
    if not (Path and Path:find("Secure")) then continue end
    hookfunction(Collected, function(...) return coroutine.yield(coroutine.running()) end)
end
