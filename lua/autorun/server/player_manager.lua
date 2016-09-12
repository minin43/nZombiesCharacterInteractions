
local characters = { 
	["Dempsey"] = "players/dempsey/dempsey.mdl", 
	["Nikolai"] = "players/nikolai/nikolai.mdl", 
	["Takeo"] = "players/takeo/takeo.mdl", 
	["Richtofen"] = "players/richtofen/richtofen.mdl" 
}

local function ValidModel( ply )
	for k, v in pairs( characters ) do
		if ply:GetModel() == v then 
			ply.character = k
			return true
		end
	end
	return false
end