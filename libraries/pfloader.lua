local loader = { }; do
	table.insert(loader, function()
		local ui, error = loadstring(game:HttpGet("https://raw.githubusercontent.com/CatzCode/cattoware/main/libraries/ui.lua", true))
		return ui(), (error == nil)
	end)
	table.insert(loader, function()
		local success, returned = pcall(function() 
			local client = { }; do
				client["physics"] = require(game:GetService("ReplicatedFirst").SharedModules.Old.Utilities.Math.physics:Clone())
				for i,v in pairs(getgc(true)) do
					spawn(function() 
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
						elseif (type(v) == "table") then
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
					end)
				end
			end
			return client
		end)
		return returned, ((
			returned.physics and
			returned.getgunlist and
			returned.loadplayer and
			returned.loadgun and
			returned.bcheck and
			returned.particle and
			returned.sound and
			returned.character and
			returned.network and
			returned.gamelogic and
			returned.camera and
			returned.effects and
			returned.uieffects and
			returned.replication and
			returned.publicsettings
		) and success) == true
    end)
end
return table.unpack(loader)
