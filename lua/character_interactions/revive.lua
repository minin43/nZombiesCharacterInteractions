hook.Add( "nzPlayerDowned", "OnDowned", function( ply )
	if !validmodel( ply ) then return end
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 15, 1, function() end)
		timer.Simple( 1, function()
			ply:EmitSound( "nz/"..ply.character.."/up" .. math.random( 5 ) .. ".ogg" )
		end )
	end 
end )

hook.Add( "nzPlayerRevived", "OnRevived", function( ply )
	if !validmodel( ply ) then return end
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 15, 1, function() end)
		timer.Simple( 0.5, function()
			ply:EmitSound( "nz/"..ply.character.."/down" .. math.random( 5 ) .. ".ogg" )
		end )
	end
end )