hook.Add( "OnAllEasterEggsFound", "SongUnlocked", function( ply, ent )
	if !validmodel( ply ) then return end
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 15, 1, function()
			timer.Remove( ply:SteamID().."timer" )
		end )
		timer.Simple( 1.5, function()
			ply:EmitSound( "nz/"..ply.character.."/song_unlocked.ogg" )
		end )
	end
end )