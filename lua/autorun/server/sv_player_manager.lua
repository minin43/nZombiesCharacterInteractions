
local characters = { ["Dempsey"] = "", ["Nikolai"] = "", ["Takeo"] = "", ["Richtofen"] = "" } --The 4 acceptable Nazi Zombie playermodels
local validplayers = {}

local function ValidModel( ply )
	for k, v in pairs( characters ) do
		if ply:GetModel() == v then 
			ply.character = k
			return true
		end
	end
	return false
end

hook.Add( "OnGameBegin", "PlayerCheck", function()
	for k, v in pairs( player.GetAll() ) do
		if ValidModel( v ) then 
			table.insert( validplayers, k, v )
		end
	end
end )

hook.Add( "PlayerSpawn", "PlayerCheck", function( ply )
	if ValidModel( ply ) then
		table.insert( validplayers, ply )
	end
end )

hook.Add( "OnPlayerDropOut", "PlayerCheck", function( ply )
	if validplayers[ply] then
		table.remove( validplayers, table.KeyFromValue( validplayers, ply) )
	end
end )