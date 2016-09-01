--There's no need to check for an existing timer because nothing else has the capability of being run at the start of the game (unless you purposefully kill yourself using console commands, but fuck off)
util.AddNetworkString( "SayNoPower" )
hook.Add( "OnGameBegin", "NoPower", function()
	if table.Count( validplayers ) > 0 then
		net.Start( "SayNoPower" )
			net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
		net.Send( validplayers[math.random( 1, #validplayers)] )
	end
end )

util.AddNetworkString( "SayDogSpawn" )
hook.Add( "OnRoundStart", "DogsSpawning", function()
	if nzRound:IsSpecial() then
		if table.Count( validplayers ) > 0 then
			net.Start( "SayDogSpawn" )
				net.WriteInt( math.random( 1, 5 ), 4 ) --There are 5 quotes from each character
			net.Send( validplayers[math.random( 1, #validplayers)] )
		end
	end
end )