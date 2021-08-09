local loader = { }; do
    table.insert(loader, function()
        local ui, error = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/PikaHub/main/Libraries/UI/bruh.lua", true))
        return table.pack(ui()), (error == nil)
    end)
    table.insert(loader, function()
        local success, returned = pcall(function() 
            local client = { }; do
                repeat
                    for i,v in pairs(getgc(true)) do
                        if (type(v) == "function") then
                            local name = debug.getinfo(v).name; do
                                if (string.lower(name) == "getgunlist") then
                                    client["getgunlist"] = v
                                elseif (string.lower(name) == "loadplayer") then
                                    debug.setupvalue(v, 1, "")
                                    client["loadplayer"] = v
                                elseif (string.lower(name) == "loadgun") then
                                    client["loadgun"] = v
                                elseif (string.lower(name) == "bulletcheck") then
                                    client["bcheck"] = v 
                                end
                            end
                            for _, upval in pairs(debug.getupvalues(v)) do
                                if type(upval) == "function" then
                                    local upvalname = debug.getinfo(upval).name; do
                                        if (string.lower(upvalname) == "trajectory") then
                                            client["trajectory"] = upval
                                        end
                                    end
                                end
                            end
                        end
                        if type(v) == "table" then
                            if (rawget(v, "step") and rawget(v, "reset") and rawget(v, "new")) then
                                client["particle"] = v
                            elseif (rawget(v, "PlaySoundId")) then
                                client["sound"] = v
                            elseif (rawget(v, "setmovementmode")) then
                                client["character"] = v
                            elseif (rawget(v, "send")) then
                                client["network"] = v
                            elseif (rawget(v, "gammo")) then
                                client["gamelogic"] = v
                            elseif (rawget(v, "basecframe")) then
                                client["camera"] = v
                            elseif (rawget(v, "breakwindow")) then
                                client["effects"] = v
                            elseif (rawget(v, "firehitmarker")) then
                                client["uieffects"] = v
                            elseif (rawget(v, "getbodyparts")) then
                                client["replication"] = v
                            elseif (rawget(v, "bulletLifeTime")) then
                                client["publicsettings"] = v
                            end
                        end
                    end
                    wait(0.69) -- haha nice
                until (
                    client.getgunlist and
                    client.loadplayer and
                    client.loadgun and
                    client.bcheck and
                    client.trajectory and
                    client.particle and
                    client.sound and
                    client.character and
                    client.network and
                    client.gamelogic and
                    client.camera and
                    client.effects and
                    client.uieffects and
                    client.replication and
                    client.publicsettings
                )
            end
            return client
        end)
        return returned, success 
    end)
end
return table.unpack(loader)
