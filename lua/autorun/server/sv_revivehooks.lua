--WIP, need to use the validplayers table somehow...
util.AddNetworkString( "SayReviveDown" )
hook.Add( "nzPlayerDowned", "", function( ply )
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 0.1, 1, function() --All dialogue delays are done client-side
			net.Start( "SayReviveDown" )
				net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
			net.Send( ply )
		end )
	end 
end )

util.AddNetworkString( "SayReviveUp" )
hook.Add( "nzPlayerRevived", "", function( ply )
	if timer.Exists( ply:SteamID().."timer" ) then
		timer.Remove( ply:SteamID().."timer" )
	end
	if !timer.Exists( ply:SteamID().."timer" ) then
		timer.Create( ply:SteamID().."timer", 0.1, 1, function() --All dialogue delays are done client-side
			net.Start( "SayReviveUp" )
				net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
			net.Send( ply )
			timer.Simple( 5, function()
				timer.Remove( ply:SteamID().."timer" )
			end )
		end )
	end
end )