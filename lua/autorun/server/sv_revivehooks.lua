--WIP, need to use the validplayers table somehow...
hook.Add( "nzPlayerDowned", "OnDowned", function( ply )
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 1, 1, function()
			ply:EmitSound( "nz/"..ply.character.."/weapons/"..sound )
		end )
	end 
end )

hook.Add( "nzPlayerRevived", "OnRevived", function( ply )
	if timer.Exists( ply:SteamID().."timer" ) then
		timer.Remove( ply:SteamID().."timer" )
	end
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 0.5, 1, function()
			ply:EmitSound( "nz/"..ply.character.."/weapons/"..sound )
			timer.Simple( 5, function()
				timer.Remove( ply:SteamID().."timer" )
			end )
		end )
	end
end )