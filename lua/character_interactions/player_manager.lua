
local characters = { 
	[ "dempsey" ] = 	"models/jessev92/player/ww2/nz-hero/dempsey.mdl", 
	[ "nikolai" ] = 	"models/jessev92/player/ww2/nz-hero/nikolai.mdl", 
	[ "takeo" ] = 		"models/jessev92/player/ww2/nz-hero/takeo.mdl", 
	[ "richtofen" ] = 	"models/jessev92/player/ww2/nz-hero/richtofen.mdl"
}

function validmodel( ply )
	for k, v in pairs( characters ) do
		if ply:GetModel() == v then 
			ply.character = k
			return true
		end
	end
	return false
end