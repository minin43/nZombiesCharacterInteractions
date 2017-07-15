local sounds = {
    ["jugg"] = "juggernog.ogg",
    ["speed"] = "speedcola.ogg",
    ["revive"] = "revive.ogg",
    ["dtap"] = "doubletap.ogg",
    ["dtap2"] = "doubletap.ogg"
 }

hook.Add( "OnPlayerGetPerk", "FERMENTED HERRING DIPPED IN CAT PISS", function( ply, id, machine )
    if !ply:IsPlayer() then return end
    if !validmodel( ply ) then return end
	local soundtoplay = sounds[id]
    if soundtoplay then
        if !timer.Exists( ply:SteamID().."timer" ) then
		    timer.Create( ply:SteamID().."timer", 15, 1, function()
                timer.Remove( ply:SteamID().."timer" )
            end )
            timer.Simple( 1, function()
			    ply:EmitSound( "nz/"..ply.character.."/"..soundtoplay )
			end )
        end
    end 
end )