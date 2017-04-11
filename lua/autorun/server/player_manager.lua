
local characters = { 
	[ "dempsey" ] = "players/dempsey/dempsey.mdl", 
	[ "nikolai" ] = "players/nikolai/nikolai.mdl", 
	[ "takeo" ] = "players/takeo/takeo.mdl", 
	[ "richtofen" ] = "players/richtofen/richtofen.mdl" 
}

function ValidModel( ply )
	for k, v in pairs( characters ) do
		if ply:GetModel() == v then 
			ply.character = k
			return true
		end
	end
	return false
end