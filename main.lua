local success, returned = pcall(function() 
    return game:HttpGet("https://raw.githubusercontent.com/CatzCode/cattoware/main/games/" .. game.PlaceId .. ".lua")
end)
if not (success and returned and #returned ~= 0) then 
    return error("Game not supported!")
end

print("Game supported! Loading the script.")
loadstring(tostring(returned))()
