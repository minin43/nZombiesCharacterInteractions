local sounds = {
    ["jugg"] = { "juggernog.ogg" },
    ["speed"] = { "speedcola.ogg" },
    ["revive"] = { "revive.ogg" },
    ["dtap"] = { "doubletap.ogg" },
    ["dtap2"] = { "doubletap.ogg" },
 }

hook.Add( "OnPlayerGetPerk", "FERMENTED HERRING DIPPED IN CAT PISS", function( ply, id, machine )
    if !ply:IsPlayer() then return end
    if !validmodel( ply ) then return end
	local sound = sounds[id]
    if sound then
        if !timer.Exists( ply:SteamID().."timer" ) then
		    timer.Create( ply:SteamID().."timer", 1, 1, function()
			    ply:EmitSound( "nz/"..ply.character.."/"..id.."/"..sound )
			    timer.Simple( 5, function()
				    timer.Remove( ply:SteamID().."timer" )
			    end )
		    end )
	    else
            timer.Simple( 1, function()
				timer.Remove( ply:SteamID().."timer" )
                ply:EmitSound( "nz/"..ply.character.."/perks/"..sound )
			end )
        end
    end 
end )