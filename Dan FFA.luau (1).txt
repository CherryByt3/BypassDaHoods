local GameInformation = loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Utilities%20/Fetch%20Game%20Information.luau", true))()

if not tostring(GameInformation.Name):find("Dan FFA") then 
    return 
end

local OriginalNameCall; OriginalNameCall = hookmetamethod(game, "__namecall", newcclosure(function(Object, ...)
    local Arguments = {...}
    local Method = getnamecallmethod()
    
    if Method == "FireServer" and Arguments[1] == "CheatGuard" then
        return
    end
    return OriginalNameCall(Object, ...)
end))

local OriginalTaskWait; OriginalTaskWait = hookfunction(task.wait, newcclosure(function(Duration)
    local CallingScript = getcallingscript()
    if not checkcaller() and CallingScript and CallingScript.Name ~= "Animate" and CallingScript.Parent and not CallingScript.Parent:IsA("Tool") and CallingScript.Parent:IsDescendantOf(workspace) then
        Duration = 2e9
    end
    return OriginalTaskWait(Duration)
end))
