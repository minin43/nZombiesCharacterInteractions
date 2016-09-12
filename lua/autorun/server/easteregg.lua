
hook.Add( "OnAllEasterEggsFound", "SongUnlocked", function( ply, ent )
	if !validmodel( ply ) then return end
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 1.5, 1, function()
			ply:EmitSound( "nz/"..ply.character.."/easter egg/song_unlocked.ogg" )
			timer.Simple( 5, function()
				timer.Remove( ply:SteamID().."timer" )
			end )
		end )
	end
end )