validplayers = {}

hook.Add( "PlayerSpawn", "PlayerCheck2", function( ply )
	if validmodel( ply ) then
		table.insert( validplayers, ply )
	end
end )

hook.Add( "OnPlayerDropOut", "PlayerCheck3", function( ply )
	if validplayers[ply] then
		table.remove( validplayers, table.KeyFromValue( validplayers, ply) )
	end
end )

hook.Add( "OnGameBegin", "NoPower", function()
	print("OnGameBegin called")
	for k, v in pairs( player.GetAll() ) do
		print( k, v, v:GetModel() )
		if validmodel( v ) then 
			print("player has valid model")
			table.insert( validplayers, v )
		end
	end
	print("validplayers table debug")
	PrintTable(validplayers)
	local chooseone = table.Random( validplayers )
	if chooseone then
		timer.Simple( 5, function()
			chooseone:EmitSound( "nz/"..chooseone.character.."/no_power".. math.random( 5 ) .. ".ogg" )
		end )
	end
end )

--//This is written assuming all special rounds will be spawn the dogs and not exploding zombies
hook.Add( "OnRoundStart", "DogsSpawning", function()
	print("OnRoundStart hook called")
	print("Round is special:", nzRound:IsSpecial() )
	if !nzRound:IsSpecial() then return end
	local chooseone = table.Random( validplayers )
	PrintTable(validplayers)
	print(chooseone)
	if chooseone then
		chooseone:EmitSound( "nz/"..chooseone.character.."/dog_spawned".. math.random( 5 ) .. ".ogg" )
	end
end )